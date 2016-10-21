//
//  CustomModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CustomModel.h"

@implementation CustomModel



@end

@implementation CustomDataModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"addDatetime":@"add_datetime",
             @"addDatetimePretty":@"add_datetime_pretty",
             @"addDatetimeTs":@"add_datetime_ts",
             @"eventCount":@"event_count",
             @"extraHtml":@"extra_html",
             @"extraType":@"extra_type",
             @"favoriteCount":@"favorite_count",
             @"hasFavorited":@"has_favorited",
             @"iconUrl":@"icon_url",
             @"dataIdentifier":@"id",
             @"isCertifyUser":@"is_certify_user",
             @"isRoot":@"is_root",
             @"":@"like_count",
             @"likeCount":@"like_id",
             @"nextId":@"next_id",
             @"prevId":@"prev_id",
             @"relatedAlbums":@"related_albums",
             @"replyCount":@"reply_count",
             @"rootAlbum":@"root_album",
             @"senderId":@"sender_id",
             @"shareLinks3":@"share_links_3",
             @"topComments":@"top_comments",
             @"topLikeUsers":@"top_like_users",
             @"":@"",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"relatedAlbums":[CustomDataRelatedAlbumsModel class],
             @"topLikeUsers":[CustomDatatopLikeUsersModel class]
             };
}

@end

@implementation CustomDataRelatedAlbumsModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"activedAt":@"actived_at",
             @"favoriteCount":@"favorite_count",
             @"favoriteId":@"favorite_id",
             @"relatedAlbumsIdentifier":@"id",
             @"isRoot":@"is_root",
             @"likeCount":@"like_count",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"":@"",
             };
}

@end

@implementation CustomDataRelatedAlbumsUserModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"userIdentifier":@"id",
             @"isCertifyUser":@"is_certify_user",
             @"":@"",
             @"":@"",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"":@"",
             };
}

@end

@implementation CustomDatatopLikeUsersModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"topLikeUsersIdentifier":@"id",
             @"isCertifyUser":@"is_certify_user",
             @"":@"",
             @"":@"",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"":@"",
             };
}

@end

@implementation CustomDataAlbumModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"activedAt":@"actived_at",
             @"favoriteCount":@"favorite_count",
             @"favoriteId":@"favorite_id",
             @"albumIdentifier":@"id",
             @"likeCount":@"like_count",
             @"":@"",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"":@"",
             };
}

@end

@implementation CustomDataRootAlbumModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"activedAt":@"actived_at",
             @"favoriteCount":@"favorite_count",
             @"favoriteId":@"favorite_id",
             @"rootAlbumIdentifier":@"id",
             @"likeCount":@"like_count",
             @"":@"",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"":@"",
             };
}

@end

@implementation CustomDataShareLinks3Model

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"":@"",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"":@"",
             };
}

@end

@implementation CustomDataSenderModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"senderIdentifier":@"id",
             @"isCertifyUser":@"is_certify_user",
             @"":@"",
             @"":@"",
             @"":@"",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"":@"",
             };
}


@end

@implementation CustomDataTopCommentsModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"nextStart":@"next_start",
             @"objectList":@"object_list"
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"objectList":[CustomDataTopCommentsObjectlistModel class],
             };
}

@end

@implementation CustomDataTopCommentsObjectlistModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"addDatetime":@"add_datetime",
             @"addDatetimePretty":@"add_datetime_pretty",
             @"addDatetimeStr":@"add_datetime_str",
             @"addDatetimeTs":@"add_datetime_ts",
             @"objectListIdentifier":@"id",
             @"":@"",
             @"":@"",
             };
}

@end

@implementation CustomDataPhotoModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"":@"",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"":@"",
             };
}

@end



















