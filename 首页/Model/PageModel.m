//
//  PageModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PageModel.h"

@implementation PageModel

@end

@implementation PageDataModel

+(NSDictionary *)objectClassInArray{
    return @{
             @"objectList":[PageDataObjectListModel class]
             };
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"objectList":@"object_list",
             @"nextStart":@"next_start"
             };
}

@end

@implementation PageDataObjectListModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"contentCategory":@"content_category",
             @"contentType":@"content_type",
             @"desc":@"description",
             @"disabledAt":@"disabled_at",
             @"disabledAtStr":@"disabled_at_str",
             @"dynamicInfo":@"dynamic_info",
             @"dynamicInfo2":@"dynamic_info2",
             @"iconUrl":@"icon_url",
             @"iconUrl2":@"icon_url2",
             @"imageUrl":@"image_url",
             };
}

@end

@implementation PageDataObjectListColumnModel

@end

