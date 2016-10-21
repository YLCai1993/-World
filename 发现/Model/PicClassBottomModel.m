//
//  PicClassBottomModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PicClassBottomModel.h"

@implementation PicClassBottomModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"":@""
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"":@""
             };
}

@end

@implementation PicClassBottomDataModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"objectList":@"object_list",
             @"nextStart":@"next_start",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"objectList":[PicClassBottomDataObjectListModel class]
             };
}

@end

@implementation PicClassBottomDataObjectListModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"addDatetime":@"add_datetime",
             @"addDatetimePretty":@"add_datetime_pretty",
             @"addDatetimeTs":@"add_datetime_ts",
             @"favoriteCount":@"favorite_count",
             @"iconUrl":@"icon_url",
             @"objectListIdentifier":@"id",
             @"isCertifyUser":@"is_certify_user",
             @"likeCount":@"like_count",
             @"replyCount":@"reply_count",
             @"senderId":@"sender_id",
             @"sourceLink":@"source_link",
             
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"":@""
             };
}

@end

@implementation PicClassBottomDataObjectListAlbumModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"activedAt":@"actived_at",
             @"favoriteCount":@"favorite_count",
             @"favoriteId":@"favorite_id",
             @"albumIdentifier":@"id",
             @"likeCount":@"like_count",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"":@""
             };
}

@end

@implementation PicClassBottomDataObjectListSenderModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"isCertifyUser":@"is_certify_user",
             @"senderIdentifier":@"id",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"":@""
             };
}

@end

@implementation PicClassBottomDataObjectListPhotoModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"":@""
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"":@""
             };
}

@end



































