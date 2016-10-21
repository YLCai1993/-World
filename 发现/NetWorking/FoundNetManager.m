//
//  FoundNetManager.m
//  BaseProject
//
//  Created by YLCai on 16/10/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "FoundNetManager.h"
/*  热门图片链接  */
#define kPathHotPath @"http://221.228.82.178/napi/index/hot/?platform_name=iOS&start=%@"
#define khottailPath @"&__domain=www.duitang.com&include_fields=sender%2Cfavroite_count%2Calbum%2Cicon_url%2Creply_count%2Clike_count&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&locale=zh_CN&app_code=gandalf&platform_version=10.0.2&screen_height=667&device_name=Unknown%20iPhone&limit=0&screen_width=375"

/*  文章路径  */
#define kArticlePath @"http://221.228.82.178/napi/topic/article/list/?platform_name=iOS&start=%@"
#define kArticleTailPath @"&__domain=www.duitang.com&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&locale=zh_CN&app_code=gandalf&platform_version=10.0.2&screen_height=667&type=by_banner&device_name=Unknown%20iPhone&screen_width=375"

/* 获取好物图片  */
#define kHaoWuPath @"http://221.228.82.178/napi/blog/list/by_category/?platform_name=iOS&start=%@"
#define kHaoWuTailPath @"&__domain=www.duitang.com&include_fields=sender%2Cfavroite_count%2Calbum%2Cicon_url%2Creply_count%2Clike_count&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&app_code=gandalf&locale=zh_CN&platform_version=10.0.2&screen_height=667&device_name=Unknown%20iPhone&limit=0&cate_key=5017d172705cbe10c0000003&screen_width=375"

/* 图片分类头部数据地址 */
#define kPicClassTopHeadPath @"http://www.duitang.com/napi/category/detail/?locale=zh_CN&app_version=6.3.2%20rv%3A168184&device_name=Unknown%20iPhone&category_id="
#define kPicClassTopPath @"%@"
#define kPIcClassTopBottomPath @"&app_code=gandalf&platform_name=iOS&device_platform=iPhone8%2C1&platform_version=10.0.2&screen_height=667&screen_width=375&__domain=www.duitang.com"

/* 图片分类下方数据地址 */
#define kPicClassBottomHeadPath @"http://221.228.82.178/napi/blog/list/by_category/?platform_name=iOS&start=%@"
#define kPicClassCenterpath @"&__domain=www.duitang.com&include_fields=sender%2Cfavroite_count%2Calbum%2Cicon_url%2Creply_count%2Clike_count&filter_params=%7B%0A%0A%7D&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&app_code=gandalf&locale=zh_CN&platform_version=10.0.2&screen_height=667&device_name=Unknown%20iPhone&limit=0&cate_key="
#define kPicClassTailpath @"%@&screen_width=375"


@implementation FoundNetManager
/*  热门图片链接  */
+(id)getDataFormStartPage:(NSInteger )Start CompleteHandle:(void(^)(FoundModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:kPathHotPath,@(Start)];
    path = [path stringByAppendingString:khottailPath];
    return [self  GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([FoundModel objectWithKeyValues:responseObj],error);
    }];
}

/*  文章路径  */
+(id)getArticleDataFormStartPage:(NSInteger )Start CompleteHandle:(void(^)(FoundArticleModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:kArticlePath,@(Start)];
    path = [path stringByAppendingString:kArticleTailPath];
    return [self  GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([FoundArticleModel objectWithKeyValues:responseObj],error);
    }];
 
}

/* 获取好物图片  */
+(id)getHaoWuDataFormStartPage:(NSInteger )Start CompleteHandle:(void(^)(FoundModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:kHaoWuPath,@(Start)];
    path = [path stringByAppendingString:kHaoWuTailPath];
    return [self  GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([FoundModel objectWithKeyValues:responseObj],error);
    }];

}

/*  获取下方图片分类上方的数据 */
+(id)getTopPicClassDataFormStartPage:(NSString *)picID CompleteHandle:(void(^)(PicClassModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:kPicClassTopPath,picID];
    path = [kPicClassTopHeadPath stringByAppendingString:path];
    path = [path stringByAppendingString:kPIcClassTopBottomPath];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([PicClassModel objectWithKeyValues:responseObj],error);
    }];
}

/*  获取下方图片分类下方的数据 */
+(id)getBottomPicClassDataFormStartPage:(NSInteger )startID andPicID:(NSString *)picID CompleteHandle:(void(^)(PicClassBottomModel *model,NSError *error))completeHandle{
    NSString *path = [NSString stringWithFormat:kPicClassBottomHeadPath,@(startID)];
    path = [path stringByAppendingString:kPicClassCenterpath];
    NSString *path1 = [NSString stringWithFormat:kPicClassTailpath,picID];
    path = [path stringByAppendingString:path1];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHandle([PicClassBottomModel objectWithKeyValues:responseObj],error);
    }];
    
    return nil;
}

@end




























