//
//  CustomViewViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CustomViewViewController.h"
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>
#import "CustomViewModel.h"
#import "CustomCommentView.h"
#import "CustomView.h"

@interface CustomViewViewController ()

@property(nonatomic,strong)UIScrollView *scrollerView;
@property(nonatomic,strong)CustomViewModel *CVM;
@property(nonatomic,assign)CGFloat originX;

@end

@implementation CustomViewViewController

-(CustomViewModel *)CVM{
    if (!_CVM) {
        _CVM = [[CustomViewModel alloc] initWithID:self.ID];
    }
    return _CVM;
}

-(instancetype)initWithID:(NSString *)ID{
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}

-(UIScrollView *)scrollerView{
    if (!_scrollerView) {
        _scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
//        _scrollerView.contentSize = CGSizeMake(0, 2*kWindowH);
    }
    return _scrollerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"详情";
    self.scrollerView.backgroundColor = [UIColor colorWithRed:229/255.0 green:230/255.0 blue:231/255.0 alpha:1.0];
    [self.view addSubview:self.scrollerView];
    [Factory addBackItemToVC:self];
    /*  获取数据  */
    [self getData];
    [Factory addBackItemToVC:self];
    
    UISwipeGestureRecognizer *swipe= [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)addSubView{
    self.originX = 0;
    CustomView *view = [[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:nil options:nil].firstObject;
    [view.bgImageView sd_setImageWithURL:[self.CVM getPhotoURL] placeholderImage:[UIImage imageNamed:@"11111"]];
    [view.bgImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo([self.CVM hetHeightForPhoto]);
    }];
    view.msgLabel.text = [self.CVM getMsg];
    [view.SenderAvatarLabel sd_setImageWithURL:[self.CVM getSenderAvatarURL] placeholderImage:[UIImage imageNamed:@"bizhi"]];
    [view.SenderButton setTitle:[self.CVM getSenderUserName] forState:UIControlStateNormal];
    [view.TopView mas_updateConstraints:^(MASConstraintMaker *make) {
       make.height.mas_equalTo([self.CVM heightForTopView]);
    }];
    view.SenderUserLabel.text = [self.CVM getSenderUserArea];
    view.AdddateTimeLabel.text = [self.CVM getAdddateTime];
    view.frame = CGRectMake(0, 0, kWindowW, [self.CVM heightTopView]);
    self.originX = [self.CVM heightTopView] + 5;
    [self.scrollerView addSubview:view];
}

-(void)getData{
    [self.CVM getDataFromNetCompleteHandle:^(NSError *error) {
        /* 添加第一个视图 */
        [self addSubView];
        /* 添加评论视图 */
        [self addCommentView];
        /* 添加点赞视图 */
        [self addLikeView];
        /* 添加收藏到一下专辑 */
        [self addAlbumView];
        /* 添加推广视图 */
        [self addRecommandView];
        if (error) {
            [self showErrorMsg:error];
        }
    }];
}

-(void)addRecommandView{
    UILabel *label = [UILabel new];
    label.text = @"推广";
    label.textColor = [UIColor lightGrayColor];
     label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(10, self.originX, kWindowW-20, 20);
    [self.scrollerView addSubview:label];
   //355   175
    UIButton *button = [UIButton buttonWithType:0];
    [button setBackgroundImage:[UIImage imageNamed:[self.CVM tuiGaungPicName]] forState:UIControlStateNormal];
    button.frame = CGRectMake(10, self.originX + 30, kWindowW-20, 175);
    [self.scrollerView addSubview:button];
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    view.frame = CGRectMake(10, self.originX+205, kWindowW-20, 45);
    [self.scrollerView addSubview:view];
    
    UILabel *recommand = [UILabel new];
    recommand.text = @"这里是商品的介绍";
    recommand.font = [UIFont systemFontOfSize:15];
    [view addSubview:recommand];
    [recommand mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    self.originX = self.originX + 260;
    self.scrollerView.contentSize = CGSizeMake(0, self.originX);
}

-(void)addAlbumView{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    view.frame = CGRectMake(10, self.originX, kWindowW - 20, 156);
    [self.scrollerView addSubview:view];
    UILabel *label = [UILabel new];
    label.text = @"收藏到以下专辑";
    label.textColor = [UIColor lightGrayColor];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(14);
    }];
    NSArray *pics = [self.CVM releatedURLs];
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.frame = CGRectMake(0, 46, kWindowW-20, 110);
    CGFloat width = pics.count * 100 + (pics.count + 1)*10;
    scrollView.contentSize = CGSizeMake(width, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor whiteColor];
    [view addSubview:scrollView];
    
    for (NSInteger i = 0; i < pics.count; i++) {
        UIButton *button = [UIButton buttonWithType:0];
        [button sd_setBackgroundImageWithURL:pics[i] forState:UIControlStateNormal];
        CGFloat buttonX = 10 + (100 + 10)*i;
        button.frame = CGRectMake(buttonX, 0, 100, 100);
        [scrollView addSubview:button];
        
        UILabel *label = [UILabel new];
        label.text = [self.CVM releateNames][i];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:12];
        [button addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(67);
            make.right.mas_equalTo(-10);
        }];
        
        UILabel *subLabel = [UILabel new];
        
        subLabel.text = [self.CVM releateUserNames][i];
        subLabel.textColor = [UIColor lightGrayColor];
        subLabel.font = [UIFont systemFontOfSize:11];
        [button addSubview:subLabel];
        [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(80);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    self.originX = self.originX + 156 + 15;
    [self.scrollerView addSubview:view];
}

-(void)addLikeView{
    if (![self.CVM isContainTopLikeUsers]) return;
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    view.frame = CGRectMake(10, self.originX, kWindowW-20, 123);
    UILabel *label = [UILabel new];
    label.textColor = [UIColor lightGrayColor];
    label.text = [NSString stringWithFormat:@"赞 %u",arc4random_uniform(40)];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.mas_equalTo(10);
    }];
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(57);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    NSArray *arr = [self.CVM topLikeUserAvatarURL];
    NSInteger count = arr.count > 6 ? 6 :arr.count;
    for (NSInteger i = 0; i<count + 1; i++) {
        UIButton *button = [UIButton buttonWithType:0];
        if (i == count) {
          [button setBackgroundImage:[UIImage imageNamed:@"icon_more_dark"] forState:UIControlStateNormal];
        }else{
         [button sd_setBackgroundImageWithURL:arr[i] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"caocao"]];
        }
        CGFloat buttonX = 10 + 50 * i;
        button.frame = CGRectMake(buttonX, 70, 40, 40);
        button.layer.cornerRadius = 20;
        button.layer.masksToBounds = YES;
        [view addSubview:button];
    }
    self.originX = self.originX + 123 + 15;
    [self.scrollerView addSubview:view];
    
}

-(void)addCommentView{
    if (![self.CVM isContainTopComments]) return;
    CustomCommentView *view = [[NSBundle mainBundle] loadNibNamed:@"CustomCommentView" owner:nil options:nil].firstObject;
    view.frame = CGRectMake(10, self.originX, kWindowW - 20, [self.CVM getHeightCommentView]);
    view.commentCount.text =[NSString stringWithFormat:@"评论 %u",arc4random_uniform(40)];
    [view.commentAvatarImageView sd_setImageWithURL:[self.CVM getTopcommentAvatarURL] placeholderImage:[UIImage imageNamed:@"bizhi"]];
    view.CommentContentLabel.text = [self.CVM getTopCommentContent];
    view.addDateTimeLabel.text = [self.CVM commentTime];
    self.originX = [self.CVM heightTopView] + [self.CVM getHeightCommentView] + 15;
    [self.scrollerView addSubview:view];
}


@end
