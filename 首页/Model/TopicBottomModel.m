//
//  TopicBottomModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicBottomModel.h"

@implementation TopicBottomModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             
             };
}


@end

@implementation TopicBottomDataModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"nextStart":@"next_start",
             @"objectList":@"object_list"
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"objectList":[TopicBottomDataObjectListModel class]
             };
}

@end

@implementation TopicBottomDataObjectListModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"addDatetimeStr":@"add_datetime_str",
             @"addDatetimeTs":@"add_datetime_ts",
             @"hasLiked":@"has_liked",
             @"likeCount":@"like_count",
             @"replyCount":@"reply_count",
             @"statusStr":@"status_str",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"replies":[TopicBottomDataObjectListRepliesModel class],
             @"photos":[TopicBottomDataObjectListPhotosModel class],
             };
}

@end

@implementation TopicBottomDataObjectListRepliesModel

+(NSDictionary *)objectClassInArray{
    return @{
//             @"photos":[TopicBottomDataObjectListPhotosModel class]
             };
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"addDatetimeStr":@"add_datetime_str",
             @"addDatetimeTs":@"add_datetime_ts",
             @"statusStr":@"status_str",
             @"tCommentId":@"t_comment_id",
             };
}

@end

@implementation TopicBottomDataObjectListPhotosModel



@end

@implementation TopicBottomDataObjectListRepliesRecipientModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"isCertifyUser":@"is_certify_user",
             @"ID":@"id"
             };
}

@end

@implementation TopicBottomDataObjectListSenderModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"isCertifyUser":@"is_certify_user",
             @"ID":@"id"
             };
}

@end



























