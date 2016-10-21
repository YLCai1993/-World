//
//  PicClassModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PicClassModel.h"

@implementation PicClassModel

@end


@implementation PicClassDataModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"dataIdentifier":@"id",
             @"isShowPrice":@"is_show_price",
             @"selectionAlbumTarget":@"selection_album_target",
             @"shortName":@"short_name",
             @"subCates":@"sub_cates",
             };
}

+(NSDictionary *)objectClassInArray{
    return @{
             @"subCates":[PicClassDataSubCatesModel class]
             };
}

@end


@implementation PicClassDataSubCatesModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"subCatesIdentifier":@"id",
             @"themeName":@"theme_name",
             };
}

@end