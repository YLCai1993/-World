//
//  PicClassviewModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "FoundNetManager.h"

@interface PicClassviewModel : BaseViewModel

-(instancetype)initWithPicID:(NSString *)ID;
@property(nonatomic,strong)NSString *picID;

/*  获取顶部的小标题  */
-(NSArray *)itemsName;

/* 获取数据 */
-(void)getTopDataFromNetCompleteHandle:(CompletionHandle)completionHandle;

//获取右边的按钮的链接
-(NSURL *)urlForRight;

#pragma mark - 回去下面列表的数据

/*  获取列表的个数 */
-(NSInteger )itemsNumber;

/*  获取显示的图片  */
-(NSURL *)photoURlForItems:(NSInteger )items;

/*  获取图片的高度  */
-(CGFloat )photoHeightForItems:(NSInteger )items;

/*  获取下方显示的内容  */
-(NSString *)contentForItems:(NSInteger )items;

/*  获取评论的数目  */
-(NSString *)commentForItems:(NSInteger )items;

/*  获取点赞的数目  */
-(NSString *)likeCountForItems:(NSInteger )items;

/*  获取喜欢的数目  */
-(NSString *)favoCountForItems:(NSInteger )items;

/*  获取用户的头像  */
-(NSURL *)avaterURLForItems:(NSInteger )items;

/*  获取用户的类别  */
-(NSString *)classForItems:(NSInteger )items;

/*  获取用户的名称  */
-(NSString *)userNameForItems:(NSInteger )items;

/*  获取上方view的高度  */
-(CGFloat )topViewHeightForItems:(NSInteger )items;

/*  获取下方view的高度  */
-(CGFloat )bottomViewHeightForItems:(NSInteger )items;

/*  获取item的高度  */
-(CGFloat )itemsHeightForItems:(NSInteger )items;

/*  获取item的ID */
-(NSString *)IDForItems:(NSInteger )items;

@end





























