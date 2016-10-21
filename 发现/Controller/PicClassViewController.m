//
//  PicClassViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PicClassViewController.h"
#import <UIImageView+WebCache.h>
#import "DetailArticleViewController.h"
#import "PicClassviewModel.h"
#import "CustomViewViewController.h"
#import "PSCollectionView.h"
#import "AlbumBottomView.h"
#import "HotPictureCell.h"

#define kButtonH 32
#define kButtonW 64
#define kLeftMargin 35
#define kMarginHer 12
#define KMarginVer 12
#define kColNumber 4

@interface PicClassViewController ()<UIScrollViewDelegate,PSCollectionViewDelegate, PSCollectionViewDataSource>

@property(nonatomic,strong)PSCollectionView *collectionView;
@property(nonatomic,strong)PicClassviewModel *PVM;

@end

@implementation PicClassViewController

-(PicClassviewModel *)PVM{
    if (!_PVM) {
        _PVM  = [[PicClassviewModel alloc] initWithPicID:self.picID];
    }
    return _PVM;
}

-(PSCollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[PSCollectionView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
        _collectionView.delegate = self;
        _collectionView.collectionViewDelegate = self;
        _collectionView.collectionViewDataSource = self;
        CGRect frame  = self.collectionView.frame;
        _collectionView.frame = frame;
        _collectionView.backgroundColor = [UIColor colorWithRed:229/255.0 green:230/255.0 blue:231/255.0 alpha:1.0];
    }
    return _collectionView;
}

-(instancetype)initWithPicID:(NSString *)ID  andTitleName:(NSString *)name{
    if (self = [super init]) {
        self.picID = ID;
        self.titleName = name;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.titleName;
    
    [self.view addSubview:self.collectionView];
    /*  设置竖向为两行 */
    self.collectionView.numColsPortrait = 2;
    
    /* 获取数据 */
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
    [self.PVM getTopDataFromNetCompleteHandle:^(NSError *error) {
        /* 配置表头视图 */
        [self configTableheaderView];
        if (error) {
            [self showErrorMsg:error];
        }
    }];
    
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.PVM refreshDataCompletionHandle:^(NSError *error) {
           [self.collectionView reloadData];
           [self.collectionView.header endRefreshing];
           if (error) {
               [self showErrorMsg:error];
           }
       }];
    }];
    [self.collectionView.header beginRefreshing];
    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
       [self.PVM getMoreDataCompletionHandle:^(NSError *error) {
           [self.collectionView reloadData];
           [self.collectionView.footer endRefreshing];
           if (error) {
               [self showProgress];
           }
       }];
    }];
}

-(void)configTableheaderView{
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"beijingan"]];
    imageView.userInteractionEnabled = YES;
    UIView *headerView = [UIView new];
    headerView.alpha = 0.8;
    NSArray *names = [self.PVM itemsName];
    /* 计算表头视图的高度 */
    CGFloat buttonCount = ((names.count - 1)/ kColNumber) + 1;
    CGFloat height = (buttonCount +1) * KMarginVer + buttonCount * kButtonH;
    imageView.frame = CGRectMake(0, 0, kWindowW, 0);
    headerView.frame = CGRectMake(0, 0, kWindowW, 0);
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame = CGRectMake(0, 0, kWindowW, height + 44);
        headerView.frame = CGRectMake(0, 0, kWindowW, height + 44);
    }];
    [imageView addSubview:headerView];
    if (names.count == 0 || names == nil) {
        return;
    }
    for (NSInteger i = 0; i<names.count; i++) {
        NSInteger row = (NSInteger) (i / kColNumber);  //当前行数
        NSInteger col = i % kColNumber;      //当前行数的第几个
        UIButton *button = [UIButton buttonWithType:0];
        [button setTitle:[NSString stringWithFormat:@"#%@",names[i]] forState:UIControlStateNormal];
        NSString *name = names[i];
        if (name.length >= 5) {
             button.titleLabel.font = [UIFont systemFontOfSize:11];
        }else{
             button.titleLabel.font = [UIFont systemFontOfSize:13];
        }
        button.titleLabel.textColor = [UIColor blackColor];
        CGFloat buttonX = kLeftMargin + (kButtonW + kMarginHer)*col;
        [button setBackgroundImage:[UIImage imageNamed:@"channel_compact_placeholder_inactive"] forState:UIControlStateNormal];
        CGFloat buttonY = KMarginVer +(KMarginVer + kButtonH) * row;
        button.frame = CGRectMake(buttonX, -100, kButtonW, kButtonH);
//        [UIView animateWithDuration:0.2 animations:^{
//             button.frame = CGRectMake(buttonX, -100, kButtonW, kButtonH);
//        } completion:^(BOOL finished) {
//           [UIView animateWithDuration:0.1 animations:^{
//               button.frame = CGRectMake(buttonX, buttonY, kButtonW, kButtonH);
//           }];
//        }];
        [headerView addSubview:button];
    }
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    UIButton *leftButton = [UIButton buttonWithType:0];
    leftButton.backgroundColor = [UIColor whiteColor];
    [leftButton setImage:[UIImage imageNamed:@"cj"] forState:UIControlStateNormal];
    
    leftButton.frame = CGRectMake(0, height, 187, 44);
    [headerView addSubview:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:0];
    rightButton.frame = CGRectMake(188, height, 187, 44);
    rightButton.backgroundColor = [UIColor whiteColor];
    [rightButton bk_addEventHandler:^(id sender) {
        DetailArticleViewController *VC = [[DetailArticleViewController alloc] initWithURL:[self.PVM urlForRight]];
        VC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:VC animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    [rightButton setImage:[UIImage imageNamed:@"js"] forState:UIControlStateNormal];
    [headerView addSubview:rightButton];
    
    self.collectionView.headerView = imageView;
}

#pragma mark - UITableViewDelegate
#pragma mark - UICollectionViewDelegate
-(NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView{
    return [self.PVM itemsNumber];
}

-(CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index{
    return [self.PVM itemsHeightForItems:index];
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
        topView.tag = 300;
        [view addSubview:topView];
        
        HotPictureCell *hotPic = [[NSBundle mainBundle] loadNibNamed:@"HotPictureCell" owner:nil options:nil].firstObject;
        hotPic.tag = 400;
        [view addSubview:hotPic];
        
        [cell addSubview:view];
    }
//    UIView *view = (UIView *)[cell viewWithTag:100];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:200];
    [imageView sd_setImageWithURL:[self.PVM photoURlForItems:index] placeholderImage:[UIImage imageNamed:@"meirong"]];
    
    AlbumBottomView *topView = [cell viewWithTag:300];
    topView.nameLabel.text = [self.PVM contentForItems:index];
    topView.commentLabel.text = [self.PVM commentForItems:index];
    topView.dingLabel.text = [self.PVM likeCountForItems:index];
    topView.favoLabel.text = [self.PVM favoCountForItems:index];
    
    HotPictureCell *hotPic = [cell viewWithTag:400];
    [hotPic.userImageView sd_setImageWithURL:[self.PVM avaterURLForItems:index] placeholderImage:[UIImage imageNamed:@"chahua"]];
    hotPic.nameLabel.text = @"你好";
    //    hotPic.nameLabel.text = [self.FTVM nameForItems:index];
    hotPic.userNameLabel.text = [self.PVM userNameForItems:index];
//    view.frame = CGRectMake(0, 0, 172.5, [self collectionView:collectionView heightForRowAtIndex:index]);;
    imageView.frame = CGRectMake(0, 0, 172.5, [self.PVM photoHeightForItems:index]);
    topView.frame = CGRectMake(0, [self.PVM photoHeightForItems:index], 172.5, [self.PVM topViewHeightForItems:index]);
    hotPic.frame = CGRectMake(0, [self.PVM photoHeightForItems:index] + [self.PVM topViewHeightForItems:index] + 1, 172.5, [self.PVM bottomViewHeightForItems:index]);
    return cell;
}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGPoint offset = scrollView.contentOffset;
//    if (offset.y < 80 && offset.y > -20) {
//        self.navigationController.navigationBar.alpha = 1.0 * (offset.y / 100);
//    }else if(offset.y <= 0){
//        self.navigationController.navigationBar.alpha = 0;
//    }else{
//        self.navigationController.navigationBar.alpha = 1;
//    }
//}

-(void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index{
    CustomViewViewController *vc = [[CustomViewViewController alloc] initWithID:[self.PVM IDForItems:index]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end




























