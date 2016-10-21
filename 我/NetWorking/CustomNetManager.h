//
//  CustomNetManager.h
//  BaseProject
//
//  Created by YLCai on 16/10/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "CustomModel.h"

@interface CustomNetManager : BaseNetManager

/*  获取通用技术 */
+(id)getDataFormID:(NSString *)ID CompleteHandle:(void(^)(CustomModel *model,NSError *error))completeHandle;


@end
