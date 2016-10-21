//
//  AlbumBottomModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumBottomModel.h"

@implementation AlbumBottomModel

@end


@implementation AlbumBottomDataModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"objectList":@"object_list",
             @"nextStart":@"next_start"
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"objectList":[AlbumBottomDataObjectListModel class]
             };
}

@end

@implementation AlbumBottomDataObjectListModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"addDatetime":@"add_datetime",
             @"addDatetimePretty":@"add_datetime_pretty",
             @"addDatetimeTs":@"add_datetime_ts",
             @"extraType":@"extra_type",
             @"favoriteCount":@"favorite_count",
             @"iconUrl":@"icon_url",
             @"isCertifyUser":@"is_certify_user",
             @"likeCount":@"like_count",
             @"replyCount":@"reply_count",
             @"objectListIdentifier":@"id"
             };
}

@end

@implementation AlbumBottomDataObjectListAlbumModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"favoriteCount":@"favorite_count",
             @"activedAt":@"actived_at",
             @"favoriteCount":@"favorite_count",
             @"favoriteId":@"favorite_id",
             @"likeCount":@"like_count"
             };
}

@end

@implementation AlbumBottomDataObjectListSenderModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"isCertifyUser":@"is_certify_user"
             };
}


@end

@implementation AlbumBottomDataObjectListPhotoModel


@end