//
//  TopicModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicModel.h"

@implementation TopicModel

@end

@implementation TopicDataModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"photos":[TopicDataPhotoModel class]
             };
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"activeTime":@"active_time",
             @"addDatetimeTs":@"add_datetime_ts",
             @"dynamicInfo2":@"dynamic_info2",
             @"favoriteId":@"favorite_id",
             @"likeId":@"like_id",
             @"shareLinks":@"share_links",
             @"shareLinks3":@"share_links_3",
             @"statusStr":@"status_str",
             @"visitCount":@"visit_count",
             @"ID":@"id"
             };
}
@end

@implementation TopicDataPhotoModel


@end

@implementation TopicDataSenderModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"senderIdentifier":@"is_certify_user"
             };
}

@end

@implementation TopicDataShareLinks3Model

@end

@implementation TopicDataShareLinksModel

@end

@implementation TopicDataClubModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"clubIdentifier":@"id"
             };
}

@end















