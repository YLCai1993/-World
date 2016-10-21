//
//  MyViewController.m
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MyViewController.h"
#import "SingInViewController.h"
#import "YLLogInViewController.h"
#import "MeView.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MeView *view = [[NSBundle mainBundle] loadNibNamed:@"MeView" owner:nil options:nil].firstObject;
    [view.sigINBUTTON2 bk_addEventHandler:^(id sender) {
        SingInViewController *vc = [[SingInViewController alloc] initWithNibName:@"SingInViewController" bundle:nil];
        [vc.senAnswerButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self presentViewController:vc animated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    [view.sigInButton bk_addEventHandler:^(id sender) {
        YLLogInViewController *vc = [[YLLogInViewController alloc]initWithNibName:@"YLLogInViewController" bundle:nil];
        [self presentViewController:vc animated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

@end




















