//
//  PageNetManager.m
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PageNetManager.h"
/* 第一页首页地址 */
#define kPagePath @"http://www.duitang.com/napi/ad/banner/list/?platform_name=iOS&start=%@"
#define tailPath  @"&query_type=normal&__domain=www.duitang.com&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&locale=zh_CN&app_code=gandalf&platform_version=10.0.2&screen_height=667&device_name=Unknown%20iPhone&limit=0&ad_id=IGA009&screen_width=375"

/* 第一页专辑上方链接地址 */
#define kAlbumPath @"http://221.228.82.178/napi/album/detail/?platform_name=iOS&__domain=www.duitang.com&include_fields=id%2Cname%2Cdesc%2Cuser%2Clike_count%2Clike_id%2Ccount%2Ccovers%2Cmanagers%2Cmembers%2Cmember_count%2Ccategory%2Cshare_links_3&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&user_id=0&locale=zh_CN&app_code=gandalf&platform_version=10.0.2&screen_height=667&device_name=Unknown%20iPhone&screen_width=375&album_id="
#define kAbumTail @"%@"

/*  第一页专辑下方链接地址 */
#define kAlbumBottomPath @"http://221.228.82.178/napi/blog/list/by_album/?platform_name=iOS&start=%@"
#define kAlbumBottomcenterPath @"&__domain=www.duitang.com&include_fields=sender%2Cfavroite_count%2Calbum%2Cicon_url%2Creply_count%2Clike_count&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&user_id=11789727&app_code=gandalf&locale=zh_CN&platform_version=10.0.2&screen_height=667&device_name=Unknown%20iPhone&limit=0&screen_width=375&album_id="
#define kAlbumBottomTail @"%@&sender_id=0"

/*  第一页话题上方的链接地址 */
#define kTopicHeadPath @"http://www.duitang.com/napi/topic/detail/?platform_name=iOS&__domain=www.duitang.com&include_fields=share_links_3&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&"
#define kTopicPath @"topic_id=%@"
#define kTopicTailPath @"&locale=zh_CN&app_code=gandalf&platform_version=10.0.2&screen_height=667&device_name=Unknown%20iPhone&screen_width=375"

/* 第一页有关话题下方的数据 */
#define topicBottomHeaderPath @"http://221.228.82.178/napi/topic/comment/list/?platform_name=iOS&start=%@"
#define unUsePath1 @"&__domain=www.duitang.com&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&"
#define topicBottomTailPath @"topic_id=%@"
#define unUsePath2 @"&locale=zh_CN&app_code=gandalf&platform_version=10.0.2&screen_height=667&device_name=Unknown%20iPhone&limit=0&screen_width=375"


@implementation PageNetManager
/*  获取第一页的数据 */
+(id)getDataFormStartPage:(NSInteger )Start CompleteHandle:(void(^)(PageModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:kPagePath,@(Start)];
    path = [path stringByAppendingString:tailPath];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([PageModel objectWithKeyValues:responseObj],error);
    }];
}
//80623771
/* 获取第一个有关专辑的头部数据 */
+(id)getAlbumDataFormID:(NSString *)ID CompleteHandle:(void(^)(AlbumModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:kAbumTail,ID];
    path = [kAlbumPath stringByAppendingString:path];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([AlbumModel objectWithKeyValues:responseObj],error);
    }];
}

/*  获取第一个有关小哈 u 年纪底部的数据 */
+(id)getAlbumBottomForID:(NSString *)ID andStart:(NSString *)starts CompleteHandle:(void(^)(AlbumBottomModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:kAlbumBottomPath,starts];
    path = [path stringByAppendingString:kAlbumBottomcenterPath];
    NSString *path2 = [NSString stringWithFormat:kAlbumBottomTail,ID];
    path = [path stringByAppendingString:path2];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([AlbumBottomModel objectWithKeyValues:responseObj],error);
    }];
}
//
/*  获取有关话题头部的数据 */
+(id)getTopicDataFormID:(NSString *)ID CompleteHandle:(void(^)(TopicModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:kTopicPath,ID];
    path = [kTopicHeadPath stringByAppendingString:path];
    path = [path stringByAppendingString:kTopicTailPath];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([TopicModel objectWithKeyValues:responseObj],error);
    }];
}

/*  获取有关话题的底部数据 */
+(id)getTopicBottomFormID:(NSString *)ID andStart:(NSInteger )start CompleteHandle:(void(^)(TopicBottomModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:topicBottomHeaderPath,@(start)];
    path = [path stringByAppendingString:unUsePath1];
    NSString *path2 = [NSString stringWithFormat:topicBottomTailPath,ID];
    path2 = [path2 stringByAppendingString:unUsePath2];
    path = [path stringByAppendingString:path2];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([TopicBottomModel objectWithKeyValues:responseObj],error);
    }];
}


@end



















