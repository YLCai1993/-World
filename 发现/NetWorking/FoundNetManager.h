//
//  FoundNetManager.h
//  BaseProject
//
//  Created by YLCai on 16/10/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "FoundModel.h"
#import "FoundArticleModel.h"
#import "PicClassModel.h"
#import "PicClassBottomModel.h"

@interface FoundNetManager : BaseNetManager

/*  获取热门图片的数据 */
+(id)getDataFormStartPage:(NSInteger )Start CompleteHandle:(void(^)(FoundModel *model,NSError *error))completeHandle;

/* 获取文章数据  */
+(id)getArticleDataFormStartPage:(NSInteger )Start CompleteHandle:(void(^)(FoundArticleModel *model,NSError *error))completeHandle;

/*  获取好物数据  */
+(id)getHaoWuDataFormStartPage:(NSInteger )Start CompleteHandle:(void(^)(FoundModel *model,NSError *error))completeHandle;

/*  获取下方图片分类上方的数据 */
+(id)getTopPicClassDataFormStartPage:(NSString *)picID CompleteHandle:(void(^)(PicClassModel *model,NSError *error))completeHandle;

/*  获取下方图片分类下方的数据 */
+(id)getBottomPicClassDataFormStartPage:(NSInteger )startID andPicID:(NSString *)picID CompleteHandle:(void(^)(PicClassBottomModel *model,NSError *error))completeHandle;

@end
