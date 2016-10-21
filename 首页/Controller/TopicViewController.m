//
//  TopicViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicViewModel.h"
#import "TopicheaderView.h"
#import <UIImageView+WebCache.h>
#import "TopicFooterCell.h"

@interface TopicViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)TopicViewModel *TVM;

@end

@implementation TopicViewController

-(TopicViewModel *)TVM{
    if (!_TVM) {
        _TVM = [[TopicViewModel alloc] initWithTopicTopicID:_topicID];
    }
    return _TVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithRed:229/255.0 green:230/255.0 blue:231/255.0 alpha:1];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(instancetype)initWithTopicID:(NSString *)topicID{
    if (self = [super init]) {
        self.topicID = topicID;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"::::::::::::::::::%@",_topicID);
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"话题详情";
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    /* 获取数据 */
    [self getData];
    
    /* 注册cell */
    [self.tableView registerNib:[UINib nibWithNibName:@"TopicFooterCell" bundle:nil] forCellReuseIdentifier:@"TopicFooterCell"];
    
    [Factory addBackItemToVC:self];
    UISwipeGestureRecognizer *swipe= [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getData{
    [self.TVM refreshDataCompletionHandle:^(NSError *error) {
        /* 配置表头数据 */
        [self configTableHeader];
        if (error) {
            [self showErrorMsg:error];
        }
    }];
    [self.TVM getActionMoreDataCompletionHandle:^(NSError *error) {
        [self.tableView reloadData];
        if (error) {
            [self showSuccessMsg:error];
        }
    }];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
       [self.TVM getMoreDataCompletionHandle:^(NSError *error) {
           [self.tableView.footer endRefreshing];
           [self.tableView reloadData];
           if (error) {
               [self showErrorMsg:error];
           }
       }];
    }];
}

-(void)configTableHeader{
    TopicheaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"TopicheaderView" owner:nil options:nil].firstObject;
    headerView.contentLabel.text = [self.TVM titleForHeader];
    if ([self.TVM isContainHeaderImageView]) {
        [headerView.imageView sd_setImageWithURL:[self.TVM picURLForHeader] placeholderImage:[UIImage imageNamed:@"angle-mask"]];
    }else{
        [headerView.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }
    
    [headerView.userNameButton setTitle:[self.TVM userNameForheader] forState:UIControlStateNormal];
    headerView.visitLabel.text = [self.TVM visitForHeader];
    headerView.frame = CGRectMake(0, 0, kWindowW, [self.TVM heightForHeaderView]);
    self.tableView.tableHeaderView = headerView;
}


#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.TVM rowNumber];
}

/*  返回cell的高度 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.TVM cellHeightForRow:indexPath.row];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TopicFooterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicFooterCell"];
    [cell.UserHeadView sd_setImageWithURL:[self.TVM avatarURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"error"]];
    [cell.userNameLabel setTitle:[self.TVM userNameForRow:indexPath.row] forState:UIControlStateNormal];
    cell.topicContentLabel.text = [self.TVM contentURLForRow:indexPath.row];
    cell.dateTimeLabel.text = [self.TVM dateTimeForRow:indexPath.row];
    cell.commentLabel.text = [self.TVM replyCountForRow:indexPath.row];
    cell.likeLabel.text = [self.TVM likeCountForRow:indexPath.row];
    [cell.topView mas_updateConstraints:^(MASConstraintMaker *make) {

        make.height.mas_equalTo([self.TVM heightTopViewForRow:indexPath.row]);
    }];
    
    /* 判断当前有没有图片 */
    if ([self.TVM isContainPhotoForRow:indexPath.row]) {
        /* 话题图片 */
        [cell.topicImageView sd_setImageWithURL:[self.TVM photosForRow:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"angle-mask"]];
        [cell.topicImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(90);
        }];
    }else{
        /* 改变当前cell的高度 */
        [cell.topicImageView mas_updateConstraints:^(MASConstraintMaker *make) {
           make.height.mas_equalTo(0);
        }];
    }
       /* 判断当前有没有评论内容 */
    if ([self.TVM isContainRepley:indexPath.row]) {
         cell.commentBackView.hidden = NO;
        /* 有关回复的信息 */
        [cell.answerNameLabel setTitle:[self.TVM senderUserNameForRow:indexPath.row] forState:UIControlStateNormal];
        [cell.answeredLabel setTitle:[self.TVM recipientUserNameForRow:indexPath.row] forState:UIControlStateNormal];
        cell.answerContenrLabel.text = [self.TVM replyContentForRow:indexPath.row];
    }else{
        [cell.commentBackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        cell.commentBackView.hidden = YES;
    }
    return cell;
}


@end























