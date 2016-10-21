//
//  PageViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PageViewController.h"
#import "PageViewModel.h"
#import "PageBigImageCell.h"
#import "PageSmallImageCell.h"
#import <UIImageView+WebCache.h>
#import "ArticleViewController.h"
#import "AlbumViewController.h"
#import "TopicViewController.h"
#import "SingInViewController.h"

@interface PageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)PageViewModel *PVM;

@end

@implementation PageViewController

-(PageViewModel *)PVM{
    if (!_PVM) {
        _PVM = [PageViewModel new];
    }
    return _PVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(sinIN)];
    rightItem.tintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    self.navigationItem.title = @"每日精选";
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    /* 注册cell */
    [self.tableView registerNib:[UINib nibWithNibName:@"PageBigImageCell" bundle:nil] forCellReuseIdentifier:@"PageBigImageCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"PageSmallImageCell" bundle:nil] forCellReuseIdentifier:@"PageSmallImageCell"];
    
    /* 获取数据  */
    [self getData];
    
}

-(void)sinIN{
    SingInViewController *vc = [[SingInViewController alloc] initWithNibName:@"SingInViewController" bundle:nil];
    [vc.senAnswerButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)getData{
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.PVM refreshDataCompletionHandle:^(NSError *error) {
           [_tableView reloadData];
           [_tableView.header endRefreshing];
           if (error) {
               [self showErrorMsg:error];
           }
       }];
    }];
    [_tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.PVM getMoreDataCompletionHandle:^(NSError *error) {
            [_tableView.footer endRefreshing];
            [_tableView reloadData];
            if (error){
                [self showErrorMsg:error];
            }
        }];
    }];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.PVM.rowNumber;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.PVM cellHeightForRow:indexPath.row];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.PVM isArticleForRow:indexPath.row] | [self.PVM isStoreForRow:indexPath.row]) {
        ArticleViewController *vc = [[ArticleViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        vc.article = [self.PVM isArticleForRow:indexPath.row];
        vc.ID = [self.PVM isArticleForRow:indexPath.row] ? [self.PVM IDForRow:indexPath.row] : [self.PVM StoreIDForRow:indexPath.row];
        vc.title1 = [self.PVM isArticleForRow:indexPath.row] ? @"文章详情":@"每日精选";
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([self.PVM isAlnbumForRow:indexPath.row]){
        AlbumViewController *albumVC = [[AlbumViewController alloc] initWithAlbumID:[self.PVM albumIDForRow:indexPath.row]];
        albumVC.titles = [self.PVM descForRow:indexPath.row];
        albumVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:albumVC animated:YES];
    }else if ([self.PVM isTopicForRow:indexPath.row]){
        TopicViewController *vc = [[TopicViewController alloc] initWithTopicID:[self.PVM IDForRow:indexPath.row]];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*  如果是大图 */
    if ([self.PVM isBigPicForRow:indexPath.row]) {
        PageBigImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PageBigImageCell"];
        [cell.bgImageView sd_setImageWithURL:[self.PVM imageURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"valenciaGradientMap"]];
        if (indexPath.row == 0) {
            cell.topTitle.hidden = NO;
            cell.topTitle.text = [self.PVM descForRow:indexPath.row];
            cell.bottomView.hidden = YES;
        }else{
            cell.topTitle.hidden = YES;
            cell.bottomView.hidden = NO;
            cell.bottomTitle.text = [self.PVM descForRow:indexPath.row];
            cell.classLabel.text = [self.PVM classForRow:indexPath.row];
            cell.nikeNameLabel.text = [self.PVM nameForRow:indexPath.row];
            [cell.likeImage sd_setImageWithURL:[self.PVM xingxingURL] placeholderImage:[UIImage imageNamed:@"error"]];
            cell.lickeLabel.text = [self.PVM dynamicForRow:indexPath.row];
        }
        return cell;
    }else{
       
        PageSmallImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PageSmallImageCell"];
        cell.shuxianLabel.hidden = NO;
        cell.xingxingImageView.hidden = NO;
        if ([self.PVM isStoreForRow:indexPath.row]) {
            cell.shuxianLabel.hidden = YES;
            cell.xingxingImageView.hidden = YES;
        }
        [cell.smallPicTure sd_setImageWithURL:[self.PVM imageURLForRow:indexPath.row]  placeholderImage:[UIImage imageNamed:@"angle-mask"]];
        cell.descLabel.text = [self.PVM descForRow:indexPath.row];
        cell.classLabel.text = [self.PVM classForRow:indexPath.row];
        cell.nikeNameLabel.text = [self.PVM nameForRow:indexPath.row];
        [cell.xingxingImageView sd_setImageWithURL:[self.PVM xingxingURL] placeholderImage:[UIImage imageNamed:@"error"]];
        cell.likeLabel.text = [self.PVM dynamicForRow:indexPath.row];
        return cell;
    }
}

@end






















