//
//  AlbumModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumModel.h"

@implementation AlbumModel

@end


@implementation AlbumDataModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"favoriteCount":@"favorite_count",
             @"favoriteId":@"favorite_id",
             @"activedAt":@"actived_at",
             @"likeCount":@"like_count",
             @"createdAt":@"created_at",
             @"shareLinks3":@"share_links_3",
             @"likeId":@"like_id"
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"shareLinks3":[AlbumDataShareLinks3Model class],
             @"user":[AlbumDataUserModel class]
             };
}

@end

@implementation AlbumDataShareLinks3Model



@end

@implementation AlbumDataUserModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"isCertifyUser":@"is_certify_user"
             };
}

@end

@implementation AlbumDataTagsModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"tagId":@"tag_id"
             };
}


@end