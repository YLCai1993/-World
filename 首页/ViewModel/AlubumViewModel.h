//
//  AlubumViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "PageNetManager.h"

@interface AlubumViewModel : BaseViewModel

-(instancetype)initWithAlbumID:(NSString *)ID;
@property(nonatomic,strong)NSString *AlbumID;

#pragma mark 上方的数据请求
/*  获取作者名称 */
-(NSString *)getName;

/*  获取图片数量 */
-(NSString *)getPicCount;

/*  获取收藏人数 */
-(NSString *)favoCount;

/* 获取头像链接地址 */
-(NSURL *)gethHeadURL;

/* 获取作者的昵称 */
-(NSString *)getNikeName;

/* 获取数据 */
-(void)getsDataFromNetCompleteHandle:(CompletionHandle)completionHandle;

#pragma mark 下方的数据请求
/* 返回下方详解view的高度 */
-(CGFloat )heightForMsgForItems:(NSInteger )index;

/*  获取下方的items个数 */
-(NSInteger )itemsNumber;

/* 获取图片的宽度 */
-(CGFloat )picWidthForItems:(NSInteger )index;

/* 获取图片的高度 */
-(CGFloat )picHeightForItems:(NSInteger )index;

/* 获取图片 */
-(NSURL *)getBottomPicForItems:(NSInteger )index;

/* 获取用户名 */
-(NSString *)getmsgFormItems:(NSInteger )index;

/* 获取评论数量 */
-(NSString *)getRepleyCountForItems:(NSInteger )index;

/* 获取点赞数量 */
-(NSString *)getLikeCountForItems:(NSInteger )index;

/* 获取喜欢数量 */
-(NSString *)getFavoCountForItems:(NSInteger )index;

/*  获取详细ID   */
-(NSString *)idForItems:(NSInteger )items;

/* 获取详细的ID */
-(NSString *)getDetailIDForItems:(NSInteger )items;

/* 获取 */
-(void)getBottomDataFromNetCompleteHandle:(CompletionHandle)completionHandle;


@end
