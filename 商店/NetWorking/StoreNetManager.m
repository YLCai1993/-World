//
//  StoreNetManager.m
//  BaseProject
//
//  Created by YLCai on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "StoreNetManager.h"

#define kAdsPath @"http://221.228.82.178/napi/ad/banner/list/?platform_name=iOS&__domain=www.duitang.com&timestamp=1476840722000&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&locale=zh_CN&app_code=gandalf&platform_version=10.0.2&screen_height=667&device_name=Unknown%20iPhone&limit=30&ad_id=COM001&screen_width=375"

#define kListPath @"http://www.duitang.com/napi/ad/banner/list/?platform_name=iOS&__domain=www.duitang.com&timestamp=1476504970000&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&locale=zh_CN&app_code=gandalf&platform_version=10.0.2&screen_height=667&device_name=Unknown%20iPhone&limit=30&ad_id=COM003&screen_width=375"

@implementation StoreNetManager

/*  获取头部广告数据  */
+(id)getAdsDataFromCompleteHandle:(void(^)(PageModel *model,NSError *error))completeHandle{
    return  [self GET:kAdsPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([PageModel objectWithKeyValues:responseObj],error);
    }];
}

/*  获取头部广告数据  */
+(id)getListDataFromCompleteHandle:(void(^)(PageModel *model,NSError *error))completeHandle{
    return [self GET:kListPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([PageModel objectWithKeyValues:responseObj],error);
    }];
}

@end
