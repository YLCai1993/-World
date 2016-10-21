//
//  AlbumViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumViewController.h"
#import <UIImageView+WebCache.h>
#import "CustomViewViewController.h"
#import "PSCollectionView.h"
#import "AlubumViewModel.h"
#import "AlbumHeaderView.h"
#import "AlbumBottomView.h"

@interface AlbumViewController ()<UIScrollViewDelegate,PSCollectionViewDelegate, PSCollectionViewDataSource>

@property(nonatomic,strong)PSCollectionView *collectionView;
@property(nonatomic,strong)AlubumViewModel *AVM;

@end

@implementation AlbumViewController

-(AlubumViewModel *)AVM{
    if (!_AVM) {
        _AVM = [[AlubumViewModel alloc] initWithAlbumID:self.albumID];
    }
    return _AVM;
}

-(instancetype)initWithAlbumID:(NSString *)ID{
    if (self = [super init]) {
        self.albumID = ID;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.titles;
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView = [[PSCollectionView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
    self.collectionView.delegate = self;
    self.collectionView.collectionViewDelegate = self;
    self.collectionView.collectionViewDataSource = self;
    self.collectionView.userInteractionEnabled = YES;
    
    CGRect frame  = self.collectionView.frame;
    frame.origin.y = -64;
    frame.size.height += 60;
    self.collectionView.frame = frame;
    self.collectionView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [self.view addSubview:self.collectionView];
    
    
    
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, -44, 0);
    
    /* 设置collectionView的竖向为两行 */
    self.collectionView.numColsPortrait = 2;
    
    /* 获取数据 */
    [self getData];
    
    /* 配置表图视图 */
    [self configTableHeaderView];
    
    /*  设置导航栏的背景颜色 */
//    self.navigationController.navigationBar.alpha = 0;
    
    [Factory addBackItemToVC:self];
    UISwipeGestureRecognizer *swipe= [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)configTableHeaderView{
    AlbumHeaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"AlbumHeaderView" owner:nil options:nil].firstObject;
    headerView.titleLbael.text = [self.AVM getName];
    headerView.bgIMgaeView.image = [UIImage imageNamed:@"bigImage.jpg"];
    headerView.imageCountLabel.text = [self.AVM getPicCount];
    [headerView.headImageView sd_setImageWithURL:[self.AVM gethHeadURL] placeholderImage:[UIImage imageNamed:@"error@3x"]];
    headerView.nameLabel.text = [self.AVM getNikeName];
    headerView.leftButton.selected = YES;
    headerView.frame = CGRectMake(0, 0, kWindowW, 270);
    self.collectionView.headerView = headerView;
    
}

-(void)getData{
    [self.AVM getsDataFromNetCompleteHandle:^(NSError *error) {
        [self.collectionView reloadData];
        [self configTableHeaderView];
        if (error) {
            [self showErrorMsg:error];
        }
    }];
    [self.AVM getBottomDataFromNetCompleteHandle:^(NSError *error) {
        [self.collectionView reloadData];
        if (error) {
            [self showErrorMsg:error];
        }
    }];
    
    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.AVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.collectionView reloadData];
            [self.collectionView.footer endRefreshing];
            if (error) {
                [self showErrorMsg:error];
            }
        }];
    }];
}

#pragma mark PSCollectionViewDelegate
-(NSInteger )numberOfRowsInCollectionView:(PSCollectionView *)collectionView{
    return self.AVM.dataArr.count;
}

//返回每个item的高度
-(CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index{
    return [self.AVM picHeightForItems:index] + [self.AVM heightForMsgForItems:index];
}

//返回每个items的高度
-(PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index{
    PSCollectionViewCell *cell = [collectionView dequeueReusableViewForClass:[PSCollectionViewCell class]];
    cell.userInteractionEnabled = YES;
    if (!cell) {
        cell = [[PSCollectionViewCell alloc] initWithFrame:CGRectZero];
        cell.clipsToBounds = true;
        UIView *view = [UIView new];
        view.userInteractionEnabled = YES;
        [cell addSubview:view];
        view.tag = 100;
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.userInteractionEnabled = YES;
        imageView.tag = 200;
        [view addSubview:imageView];
        
        AlbumBottomView *bottomView = [[NSBundle mainBundle] loadNibNamed:@"AlbumBottomView" owner:nil options:nil].firstObject;
        bottomView.tag = 300;
        [view addSubview:bottomView];

    }
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:200];
    imageView.userInteractionEnabled = YES;
    [imageView sd_setImageWithURL:[self.AVM getBottomPicForItems:index] placeholderImage:[UIImage imageNamed:@"error"]];

    AlbumBottomView *bottomView = (AlbumBottomView *)[cell viewWithTag:300];
    bottomView.userInteractionEnabled = YES;
    bottomView.nameLabel.text = [self.AVM getmsgFormItems:index];
    bottomView.commentLabel.text = [self.AVM getRepleyCountForItems:index];
    bottomView.dingLabel.text = [self.AVM getLikeCountForItems:index];
    bottomView.favoLabel.text = [self.AVM getFavoCountForItems:index];

//    view.frame = CGRectMake(0, 0, (kWindowW - 30)/2, [self collectionView:collectionView heightForRowAtIndex:index]);
    imageView.frame = CGRectMake(0, 0, 172.5, [self.AVM picHeightForItems:index]);
    bottomView.frame = CGRectMake(0, [self.AVM picHeightForItems:index], 172.5, [self.AVM heightForMsgForItems:index]);
    return cell;
    
}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGPoint offset = scrollView.contentOffset;
//    if (offset.y < 100 && offset.y > 0) {
//        self.navigationController.navigationBar.alpha = 1.0 * (offset.y / 100);
//    }else if(offset.y <= 0){
//        self.navigationController.navigationBar.alpha = 0;
//    }else{
//        self.navigationController.navigationBar.alpha = 1;
//    }
//}

-(void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index{
    self.navigationController.navigationBar.alpha = 1;
    CustomViewViewController *vc = [[CustomViewViewController alloc] initWithID:[self.AVM getDetailIDForItems:index]];
    [self.navigationController pushViewController:vc animated:YES];
}


@end























