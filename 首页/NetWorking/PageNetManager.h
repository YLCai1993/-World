//
//  PageNetManager.h
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "PageModel.h"
#import "AlbumModel.h"
#import "AlbumBottomModel.h"
#import "TopicModel.h"
#import "TopicBottomModel.h"

@interface PageNetManager : BaseNetManager

/*  获取第一页的数据 */
+(id)getDataFormStartPage:(NSInteger )Start CompleteHandle:(void(^)(PageModel *model,NSError *error))completeHandle;

/*  获取第一个有关专辑的头部数据 */
+(id)getAlbumDataFormID:(NSString *)ID CompleteHandle:(void(^)(AlbumModel *model,NSError *error))completeHandle;

/*  获取第一个有关专辑底部的数据 */
+(id)getAlbumBottomForID:(NSString *)ID andStart:(NSString *)starts CompleteHandle:(void(^)(AlbumBottomModel *model,NSError *error))completeHandle;

/*  获取有关话题头部的数据 */
+(id)getTopicDataFormID:(NSString *)ID CompleteHandle:(void(^)(TopicModel *model,NSError *error))completeHandle;

//http://221.228.82.178/napi/topic/comment/list/?platform_name=iOS&start=0&__domain=www.duitang.com&app_version=6.3.2%20rv%3A168184&device_platform=iPhone8%2C1&topic_id=371478&locale=zh_CN&app_code=gandalf&platform_version=10.0.2&screen_height=667&device_name=Unknown%20iPhone&limit=0&screen_width=375
/*  获取有关话题的底部数据 */
+(id)getTopicBottomFormID:(NSString *)ID andStart:(NSInteger )start CompleteHandle:(void(^)(TopicBottomModel *model,NSError *error))completeHandle;

@end






















