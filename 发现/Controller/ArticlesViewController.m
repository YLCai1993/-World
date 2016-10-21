//
//  ArticleViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ArticlesViewController.h"
#import "ArticleViewModel.h"
#import <UIImageView+WebCache.h>
#import "PageSmallImageCell.h"
#import "DetailArticleViewController.h"

@interface ArticlesViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)ArticleViewModel *AVM;

@end

@implementation ArticlesViewController

-(ArticleViewModel *)AVM{
    if (!_AVM) {
        _AVM = [[ArticleViewModel alloc] init];
    }
    return _AVM;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    /*  注册 */
    [_tableView registerNib:[UINib nibWithNibName:@"PageSmallImageCell" bundle:nil] forCellReuseIdentifier:@"PageSmallImageCell"];
    
    /*  获取数据 */
    [self getData];
    
    [Factory addBackItemToVC:self];
    UISwipeGestureRecognizer *swipe= [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getData{
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.AVM refreshDataCompletionHandle:^(NSError *error) {
           [self.tableView reloadData];
           [self.tableView.header endRefreshing ];
           if (error) {
               [self showErrorMsg:error];
           }
       }];
    }];
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
       [self.AVM getMoreDataCompletionHandle:^(NSError *error) {
           [self.tableView.footer endRefreshing];
           [self.tableView reloadData];
           if (error) {
               [self showErrorMsg:error];
           }
       }];
    }];
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.AVM rowNumber];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailArticleViewController *vc = [[DetailArticleViewController alloc] initWithURL:[self.AVM extraURLForRow:indexPath.row]];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PageSmallImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PageSmallImageCell"];
    [cell.smallPicTure sd_setImageWithURL:[self.AVM urlForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"bizhi"]];
    cell.descLabel.text = [self.AVM contentForRow:indexPath.row];
    cell.classLabel.text = [self.AVM classForRow:indexPath.row];
    cell.nikeNameLabel.text = [self.AVM userNameForRow:indexPath.row];
    cell.likeLabel.text = [self.AVM favoCountForRow:indexPath.row];
    [cell.xingxingImageView sd_setImageWithURL:[self.AVM XingUrlForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"xingxing"]];
    return cell;
}

@end





























