//
//  FoundModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "FoundModel.h"

@implementation FoundModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"":@""
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
            
             };
}

@end

@implementation FoundDataModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"objectList":@"object_list",
             @"nextStart":@"next_start"
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"objectList":[FoundDataObjectListModel class]
             };
}
@end

@implementation FoundDataObjectListModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"objectListIdentifier":@"id",
             @"favoriteCount":@"favorite_count",
             @"addDatetime":@"add_datetime",
             @"addDatetimePretty":@"add_datetime_pretty",
             @"addDatetimeTs":@"add_datetime_ts",
             @"favoriteCount":@"favorite_count",
             @"iconUrl":@"icon_url",
             @"isCertifyUser":@"is_certify_user",
             @"likeCount":@"like_count",
             @"replyCount":@"reply_count",
             @"senderId":@"sender_id",
             @"sourceLink":@"source_link"
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             
             };
}


@end

@implementation FoundDataObjectListAlbumModel


+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"activedAt":@"actived_at",
             @"favoriteCount":@"favorite_count",
             @"favoriteId":@"favorite_id",
             @"likeCount":@"like_count",
             @"albumIdentifier":@"id",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             
             };
}

@end

@implementation FoundDataObjectLisPhototModel


+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"":@"",
             @"":@"",
             @"":@"",
             @"":@"",
             @"":@"",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             
             };
}

@end

@implementation FoundDataObjectListSenderModel


+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"isCertifyUser":@"is_certify_user"
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             
             };
}

@end

@implementation FoundDataObjectListItemModel


+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"icon_url":@"iconUrl"
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             
             };
}

@end