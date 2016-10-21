//
//  YLTabbarController.m
//  蘑菇街
//
//  Created by YLCai on 16/10/14.
//  Copyright © 2016年 YLCai. All rights reserved.
//

#import "YLTabbarController.h"
#import "FoundsViewController.h"
#import "StoreViewController.h"
#import "PageViewController.h"
#import "MyViewController.h"


@interface YLTabbarController ()

@property(nonatomic,strong)UIView *customTabBar;

@end

@implementation YLTabbarController

+(YLTabbarController *)defaultTabBarContrller{
    static YLTabbarController *tabBar = nil;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabBar  = [[YLTabbarController alloc] init];
    });
    return tabBar;
}

+(void)initialize{
    if (self == [YLTabbarController class]) {
        UITabBar *tabBar = [UITabBar appearance];
        tabBar.backgroundColor = [UIColor redColor];
        
        
        UITabBarItem *barItem = [UITabBarItem appearance];
        
        //设置item中文字的普通样式
        NSMutableDictionary *normalAttributes = [NSMutableDictionary dictionary];
        normalAttributes[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
        normalAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:11];
        [barItem setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
        
        //设置item中文字被选中的样式
        NSMutableDictionary *selectedAttributes = [NSMutableDictionary dictionary];
        selectedAttributes[NSForegroundColorAttributeName] = [UIColor redColor];
        selectedAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:11];
        [barItem setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    PageViewController *pageVC = [[PageViewController alloc] init];
    FoundsViewController *foundVC = [[FoundsViewController alloc] init];
    StoreViewController *storeVc = [[StoreViewController alloc] init];
    MyViewController *mYVC = [[MyViewController alloc] init];
    pageVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"old_tabbar_icon_news_normal"] selectedImage:[UIImage imageNamed:@"old_tabbar_icon_news_highlight"]];
    foundVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    storeVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"商店" image:[UIImage imageNamed:@"night_tabbar_icon_media_normal"] selectedImage:[UIImage imageNamed:@"night_tabbar_icon_media_highlight"]];
    mYVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"tabbar_setting"] selectedImage:[UIImage imageNamed:@"tabbar_setting_hl"]];
    UINavigationController *pageNC = [[UINavigationController alloc] initWithRootViewController:pageVC];
    UINavigationController *FoundNC = [[UINavigationController alloc] initWithRootViewController:foundVC];
    UINavigationController *storeNC = [[UINavigationController alloc] initWithRootViewController:storeVc];
//    UINavigationController *myNC = [[UINavigationController alloc] initWithRootViewController:mYVC];
    self.viewControllers = @[pageNC,FoundNC,storeNC,mYVC];
    
    //渲染图片
    self.tabBar.tintColor = [UIColor colorWithRed:230/255.0 green:60/255.0 blue:69/255.0 alpha:1.0];
    self.tabBarItem.selectedImage = [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
       
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end















