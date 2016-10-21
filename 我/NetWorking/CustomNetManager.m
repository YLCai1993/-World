//
//  CustomNetManager.m
//  BaseProject
//
//  Created by YLCai on 16/10/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CustomNetManager.h"

#define kCunstomPathHeade @"http://221.228.82.181/napi/blog/detail/?platform_name=iOS&__domain=www.duitang.com&include_fields=tags%2Crelated_albums%2Crelated_albums.covers%2Croot_album%2Cshare_links_3%2Cextra_html%2Ctop_comments%2Ctop_like_users&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&top_like_users_count=8&locale=zh_CN&app_code=gandalf&platform_version=10.0.2&screen_height=667&top_forward_users_count=8&device_name=Unknown%20iPhone&blog_id="
#define kCustomPath @"%@&screen_width=375&top_comments_count=12"

@implementation CustomNetManager

//

/*  获取通用技术 */
+(id)getDataFormID:(NSString *)ID CompleteHandle:(void(^)(CustomModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:kCustomPath,ID];
    path = [kCunstomPathHeade stringByAppendingString:path];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([CustomModel objectWithKeyValues:responseObj],error);
    }];
}

@end
