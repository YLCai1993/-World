//
//  SingInViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "SingInViewController.h"
#import "ZhuCeViewController.h"
#import <SMS_SDK/SMSSDK.h>

@interface SingInViewController ()

@property (weak, nonatomic) IBOutlet UITextField *telNumberTextField;

@property (weak, nonatomic) IBOutlet UITextField *answerTextField;

@end



@implementation SingInViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)setSenAnswerButton:(UIButton *)senAnswerButton{
    _senAnswerButton = senAnswerButton;
    _senAnswerButton.layer.cornerRadius = 5;
    _senAnswerButton.layer.masksToBounds = YES;
}

/*  发送验证码 */
- (IBAction)sendAnswer:(UIButton *)sender {
    sender.selected = !sender.selected;
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.telNumberTextField.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (error) {
            [self showSuccessMsg:error.description];
        }else{
            NSString *str = @"短信发送成功";
            [self showSuccessMsg:str];
        }
    }];
}

/* 验证短信验证码 */
- (IBAction)userAnswer:(UIButton *)sender {
    [SMSSDK commitVerificationCode:self.answerTextField.text phoneNumber:self.telNumberTextField.text zone:@"86" result:^(NSError *error) {
        if (error) {
            NSLog(@"验证码不正确:%@",error);
        }else{
            ZhuCeViewController *vc = [[ZhuCeViewController alloc] initWithNibName:@"ZhuCeViewController" bundle:nil];
            [self presentViewController:vc animated:YES completion:nil];
        }
    }];

}


/*  返回按钮   */
- (IBAction)cilckButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/* 微博登录 */
- (IBAction)weiBoSinIn:(UIButton *)sender {
}

/* 微信登录  */
- (IBAction)weChatSinIn:(UIButton *)sender {
}

/* QQ登录  */
- (IBAction)QQSinIn:(UIButton *)sender {
}

@end
