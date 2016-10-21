//
//  FoundArticleModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "FoundArticleModel.h"

@implementation FoundArticleModel

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

@implementation FoundArticleDataModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"objectList":@"object_list",
             @"nextStart":@"next_start"
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"objectList":[FoundArticleDataObjectListModel class],
             };
}


@end

@implementation FoundArticleDataObjectListModel


+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"activeTime":@"active_time",
             @"addDatetimeTs":@"add_datetime_ts",
             @"articleType":@"article_type",
             @"commentCount":@"comment_count",
             @"contentCategory":@"content_category",
             @"dynamicInfo":@"dynamic_info",
             @"dynamicInfo2":@"dynamic_info2",
             @"extraUrl":@"extra_url",
             @"favoriteId":@"favorite_id",
             @"iconUrl":@"icon_url",
             @"iconUrl2":@"icon_url2",
             @"objectListIdentifier":@"id",
             @"likeId":@"like_id",
             @"statusStr":@"status_str",
             @"visitCount":@"visit_count"
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"photos":[FoundArticleDataObjectListPhotoModel class],
             };
}

@end

@implementation FoundArticleDataObjectListPhotoModel

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

@implementation FoundArticleDataObjectListCoverModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"coverDesc":@"cover_desc",
             @"photoPath":@"photo_path",
             @"coverIdentifier":@"id"
             
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"":@"",
             };
}

@end

@implementation FoundArticleDataObjectListSenderModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"senderIdentifier":@"id",
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

@implementation FoundArticleDataObjectListClubModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"clubIdentifier":@"id",
             };
}

@end









































