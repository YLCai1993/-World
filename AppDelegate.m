//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "YLTabbarController.h"
#import "MobClick.h"
#import <SMS_SDK/SMSSDK.h>

#define AppKey @"58046994e0f55abb74000251"

#import "CustomNetManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self getData];
    
    //初始化应用，appKey和appSecret从后台申请得
    //174ff82117216   ff277d0538b3dd0e0044d190be15a9ee
    //申请shareSDK授权
    [SMSSDK registerApp:@"174ff82117216" withSecret:@"ff277d0538b3dd0e0044d190be15a9ee"];
    
    /*  友盟统计注册  */
    [MobClick startWithAppkey:AppKey reportPolicy:BATCH channelId:nil];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    YLTabbarController *tabBar = [[YLTabbarController alloc] init];
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
    [self initializeWithApplication:application];

    return YES;
}

-(void)getData{

//    [CustomNetManager
    
}

@end




















