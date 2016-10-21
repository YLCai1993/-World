//
//  StoreNetManager.h
//  BaseProject
//
//  Created by YLCai on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "PageModel.h"

@interface StoreNetManager : BaseNetManager

/*  获取头部广告数据  */
+(id)getAdsDataFromCompleteHandle:(void(^)(PageModel *model,NSError *error))completeHandle;

/*  获取头部广告数据  */
+(id)getListDataFromCompleteHandle:(void(^)(PageModel *model,NSError *error))completeHandle;

@end
