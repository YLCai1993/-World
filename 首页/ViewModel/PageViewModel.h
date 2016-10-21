//
//  PageViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "PageNetManager.h"

@interface PageViewModel : BaseViewModel

/*  返回列表的行数 */
-(NSInteger )rowNumber;

/*  返回图片URL  */
-(NSURL *)imageURLForRow:(NSInteger )row;

/* 右侧小星星图片的获取 */
-(NSURL *)xingxingURL;

/*  返回列表介绍 */
-(NSString *)descForRow:(NSInteger )row;

/*  返回类型 */
-(NSString *)classForRow:(NSInteger )row;

/*  返回作者名称  */
-(NSString *)nameForRow:(NSInteger )row;

/*  返回关注人数  */
-(NSString *)dynamicForRow:(NSInteger )row;

/*  返回每个cell的行高  */
-(CGFloat )cellHeightForRow:(NSInteger )row;

/*  是不是文章 */
-(BOOL )isArticleForRow:(NSInteger )row;

/*  是不是专辑 */
-(BOOL )isAlnbumForRow:(NSInteger )row;

/*  是不是话题 */
-(BOOL )isTopicForRow:(NSInteger )row;

/* 是不是堆糖商店 */
-(BOOL )isStoreForRow:(NSInteger )row;

/* 是不是大图 */
-(BOOL )isBigPicForRow:(NSInteger )row;

/* 获取最后的ID */
-(NSString *)IDForRow:(NSInteger )row;

/*  获取链接地址 */
-(NSString *)StoreIDForRow:(NSInteger )row;

/*  获取专辑链接地址 */
-(NSString *)albumIDForRow:(NSInteger )row;

@end
