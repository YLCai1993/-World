//
//  YLLogInViewController.m
//  YLCBai
//
//  Created by YLCai on 16/8/28.
//  Copyright © 2016年 YLCai. All rights reserved.
//

#import "YLLogInViewController.h"
#import <objc/runtime.h>

@interface YLLogInViewController ()

@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIButton *qqButton;
@property (weak, nonatomic) IBOutlet UIButton *sinaButton;
@property (weak, nonatomic) IBOutlet UIButton *tecentButton;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;
@property (weak, nonatomic) IBOutlet UIButton *forgetButton;
@property (weak, nonatomic) IBOutlet UIView *textView;
@property (weak, nonatomic) IBOutlet UILabel *quickLogInlabel;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
/*  快速登录左边白线的宽度  */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLineWidth;
/*  快速登录右边白线的宽度  */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightLineWidth;
/*  登录view离关闭按钮的距离   */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstrain;
/*   登录viwe离左边距离  */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textLeft;

@end

@implementation YLLogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topConstrain.constant = -250;
    self.leftLineWidth.constant = 0;
    self.rightLineWidth.constant = 0;
    
    self.forgetButton.layer.mask = [[CALayer alloc] init];
    self.quickLogInlabel.layer.mask = [[CALayer alloc] init];
    self.registerButton.layer.mask = [[CALayer alloc] init];
}

/*  注册按钮  */
- (IBAction)regsiterButton:(UIButton *)sender {
    /*   显示注册界面  */
    if (self.textLeft.constant == 0) {
        self.textLeft.constant =- self.view.bounds.size.width;
        sender.selected = YES;
    }else{
        /*   显示登录界面  */
        self.textLeft.constant = 0;
        sender.selected = NO;
    }
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:1.0 animations:^{
        self.closeButton.transform = CGAffineTransformMakeRotation(M_PI);
    }];
    self.topConstrain.constant = 40;
    self.leftLineWidth.constant = 103;
    self.rightLineWidth.constant = 103;
    
    [UIView animateWithDuration:1.0 delay:0.5 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
       /*   忘记密码动画   */
        [self setupAnimationWithStartRect:CGRectMake(0, 0, 0, CGRectGetHeight(self.forgetButton.frame)) endRect:CGRectMake(0, 0, CGRectGetWidth(self.forgetButton.frame), CGRectGetHeight(self.forgetButton.frame)) object:self.forgetButton duration:0.5];
        
        /*  注册按钮动画 */
        [self setupAnimationWithStartRect:CGRectMake(-(CGRectGetWidth(self.registerButton.frame)), 0, 0, CGRectGetHeight(self.registerButton.frame)) endRect:CGRectMake(0, 0, CGRectGetWidth(self.registerButton.frame), CGRectGetHeight(self.registerButton.frame)) object:self.registerButton duration:0.5];
    }];
    
    /*  快速登录动画  */
    [self setupAnimationWithStartRect:CGRectMake(self.quickLogInlabel.bounds.size.width/2, 0, 0, CGRectGetHeight(self.quickLogInlabel.frame)) endRect:CGRectMake(0, 0, CGRectGetWidth(self.quickLogInlabel.frame), CGRectGetHeight(self.quickLogInlabel.frame)) object:self.quickLogInlabel duration:0.5];
    
    [UIView animateWithDuration:0.1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        self.qqButton.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.sinaButton.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.tecentButton.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
       [UIView animateWithDuration:1 delay:1.5 usingSpringWithDamping:0.4 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
           self.qqButton.transform = CGAffineTransformIdentity;
           self.sinaButton.transform = CGAffineTransformIdentity;;
           self.tecentButton.transform = CGAffineTransformIdentity;
       } completion:^(BOOL finished) {
           
       }];
    }];
}

/*  设置动画  */
-(void)setupAnimationWithStartRect:(CGRect)startRect endRect:(CGRect)endRect object:(UIView *)view duration:(NSTimeInterval )duration{
    UIBezierPath *beginPath = [UIBezierPath bezierPathWithRect:startRect];
    UIBezierPath *endPath = [UIBezierPath bezierPathWithRect:endRect];
    
    CAShapeLayer *quickMask = [[CAShapeLayer alloc] init];
    quickMask.path = endPath.CGPath;
    quickMask.fillColor = [UIColor whiteColor].CGColor;
    view.layer.mask = quickMask;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = duration;
    animation.beginTime = CACurrentMediaTime();
    animation.fromValue = (__bridge id _Nullable)(beginPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(endPath.CGPath);
    [quickMask addAnimation:animation forKey:@"path"];
}

- (IBAction)closeButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return  UIStatusBarStyleLightContent;
}
@end



































