//
//  ContentViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ContentViewController.h"
#import <UIImageView+WebCache.h>
#import "FoundHotViewModel.h"
#import "PSCollectionView.h"
#import "AlbumBottomView.h"
#import "HotPictureCell.h"
#import "CustomViewViewController.h"

#define kImageWidth 75
#define kImageHeight 75
#define kTopBounle 10
#define kLeftBoudle 12

@interface ContentViewController ()<UIScrollViewDelegate,PSCollectionViewDelegate, PSCollectionViewDataSource>

@property(nonatomic,strong)PSCollectionView *collectionView;

@property(nonatomic,strong)NSArray *topArray;
@property(nonatomic,strong)NSArray *topImageArray;
@property(nonatomic,strong)FoundHotViewModel *FTVM;
@property(nonatomic,strong)NSArray *articleTopArray;
@property(nonatomic,strong)NSArray *articleImageArray;

@end

@implementation ContentViewController

-(NSArray *)articleTopArray{
    return @[@"搭配",@"服饰",@"鞋包配饰",@"家居杂志"];
}

-(NSArray *)articleImageArray{
    return @[@"lvxing",@"world",@"meishi",@"caocao"];
}

-(PSCollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[PSCollectionView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
        _collectionView.delegate = self;
        _collectionView.collectionViewDelegate = self;
        _collectionView.collectionViewDataSource = self;
        CGRect frame  = self.collectionView.frame;
        frame.origin.y = 0;
        _collectionView.frame = frame;
        _collectionView.backgroundColor = [UIColor colorWithRed:229/255.0 green:230/255.0 blue:231/255.0 alpha:1.0];
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, -44, 0);
    }
    return _collectionView;
}

-(FoundHotViewModel *)FTVM{
    if (!_FTVM) {
        _FTVM = [[FoundHotViewModel alloc] initWithType:self.headTitle];
    }
    return _FTVM;
}

-(NSArray *)topArray{
    if (!_topArray) {
        _topArray = @[@"今日TOP榜",@"宅家生活",@"光影世界",@"旅拍文化",@"赏味世界",@"手艺宅子",@"种草清单"];
    }
    return _topArray;
}

-(NSArray *)topImageArray{
    if (!_topImageArray) {
        _topImageArray = @[@"bizhi",@"jiaju",@"sheying",@"lvxing",@"world",@"meishi",@"caocao"];
    }
    return _topImageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = self.headTitle;
 
    [self.view addSubview:self.collectionView];
    
    /*  设置竖向为两行 */
    self.collectionView.numColsPortrait = 2;
    /*  配置表头视图  */
    [self configTableView];
    /*  获取数据 */
    [self getData];
    
    [Factory addBackItemToVC:self];
}

-(void)getData{
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.FTVM refreshDataCompletionHandle:^(NSError *error) {
           [self.collectionView reloadData];
           [self.collectionView.header endRefreshing];
           if (error) {
               [self showErrorMsg:error];
           }
       }];
    }];
    [self.collectionView.header beginRefreshing];
    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
       [self.FTVM getMoreDataCompletionHandle:^(NSError *error) {
           [self.collectionView reloadData];
           [self.collectionView.footer endRefreshing];
           if (error) {
               [self showErrorMsg:error];
           }
       }];
    }];
}

-(void)configTableView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, 130)];
    scrollView.showsVerticalScrollIndicator = NO;
    NSArray *array = nil;
    if ([self.headTitle isEqualToString:@"热门图片"]) {
        array = self.topArray;
    }else{
        array = self.articleTopArray;
    }
    
    for (NSInteger i = 0; i < array.count; i++) {
        UIButton *button = [UIButton buttonWithType:0];
        if ([self.headTitle isEqualToString:@"热门图片"]){
            scrollView.contentSize = CGSizeMake(525 + 10 * 8 , 0);
            [button setBackgroundImage:[UIImage imageNamed:self.topImageArray[i]] forState:UIControlStateNormal];
        }else{
            scrollView.contentSize = CGSizeMake(300 + 10 * 5 , 0);
           [button setBackgroundImage:[UIImage imageNamed:self.articleImageArray[i]] forState:UIControlStateNormal];
        }
        CGFloat buttonnX = kLeftBoudle + (kImageWidth + kLeftBoudle) * i;
        button.frame = CGRectMake(buttonnX, kTopBounle, kImageWidth, kImageHeight);
        [scrollView addSubview:button];
        
        UILabel *label = [[UILabel alloc] init];
        
        
        if ([self.headTitle isEqualToString:@"热门图片"]) {
            label.text = self.topArray[i];
        }else{
            label.text = self.articleTopArray[i];
        }
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.frame = CGRectMake(buttonnX,kTopBounle+ kImageHeight + 5, kImageWidth, 20);
        [scrollView addSubview:label];
    }
    self.collectionView.headerView = scrollView;
}

#pragma mark - UICollectionViewDelegate
-(NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView{
    return [self.FTVM RowNumber];
}

-(CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index{
    return [self.FTVM itemsHeightForItems:index];
}

-(PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index{
    PSCollectionViewCell *cell = [collectionView dequeueReusableViewForClass:[PSCollectionViewCell class]];
    if (!cell) {
        cell = [[PSCollectionViewCell alloc] initWithFrame:CGRectZero];
        UIView *view = [UIView new];
        view.tag = 100;
        view.backgroundColor = [UIColor colorWithRed:229/255.0 green:230/255.0 blue:231/255.0 alpha:1.0];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.tag = 200;
        [view addSubview:imageView];
        
        AlbumBottomView *topView = [[NSBundle mainBundle] loadNibNamed:@"AlbumBottomView" owner:nil options:nil].firstObject;
        topView.cartImageView.hidden = NO;
        topView.tag = 300;
        [view addSubview:topView];
        
        HotPictureCell *hotPic = [[NSBundle mainBundle] loadNibNamed:@"HotPictureCell" owner:nil options:nil].firstObject;
        hotPic.tag = 400;
        [view addSubview:hotPic];
        
        [cell addSubview:view];
    }
//    UIView *view = (UIView *)[cell viewWithTag:100];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:200];
    [imageView sd_setImageWithURL:[self.FTVM photoURLForItems:index] placeholderImage:[UIImage imageNamed:@"bgmodel"]];
    
    AlbumBottomView *topView = [cell viewWithTag:300];
    topView.nameLabel.text = [self.FTVM msgForItems:index];
    topView.commentLabel.text = [self.FTVM replyCountRorItems:index];
    topView.dingLabel.text = [self.FTVM lickeCountForItems:index];
    topView.favoLabel.text = [self.FTVM favoriteForItems:index];
    
    HotPictureCell *hotPic = [cell viewWithTag:400];
    [hotPic.userImageView sd_setImageWithURL:[self.FTVM avatarForIyems:index] placeholderImage:[UIImage imageNamed:@"chahua"]];
    hotPic.nameLabel.text = @"你好";
//    hotPic.nameLabel.text = [self.FTVM nameForItems:index];
    hotPic.userNameLabel.text = [self.FTVM userNameForitems:index];
    
//    view.frame = CGRectMake(0, 0, 172.5, [self collectionView:collectionView heightForRowAtIndex:index]);;
    imageView.frame = CGRectMake(0, 0, 172.5, [self.FTVM photoHeightForItems:index]);
    topView.frame = CGRectMake(0, [self.FTVM photoHeightForItems:index], 172.5, [self.FTVM topViewForItems:index]);
    hotPic.frame = CGRectMake(0, [self.FTVM photoHeightForItems:index] + [self.FTVM topViewForItems:index] + 1, 172.5, [self.FTVM bottomIndexForItems:index]);
    return cell;
}

-(void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index{
    self.navigationController.navigationBar.alpha = 1;
    CustomViewViewController *vc = [[CustomViewViewController alloc] initWithID:[self.FTVM IDForItems:index]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end


































