//
//  FoundHotViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "FoundNetManager.h"

@interface FoundHotViewModel : BaseViewModel

-(instancetype)initWithType:(NSString *)type;
@property(nonatomic,strong)NSString *type;

/*  items的个数 */
-(NSInteger )RowNumber;

/*  获取图片地址 photo */
-(NSURL *)photoURLForItems:(NSInteger )index;

/*  获取图片的高度*/
-(CGFloat )photoHeightForItems:(NSInteger )index;

/*  获取下方的信息msg*/
-(NSString *)msgForItems:(NSInteger )index;

/*  获取回复数量replyCount*/
-(NSString *)replyCountRorItems:(NSInteger )index;

/*  获取点赞数量likeCount*/
-(NSString *)lickeCountForItems:(NSInteger )index;

/*  获取喜欢数量favoriteCount*/
-(NSString *)favoriteForItems:(NSInteger )index;

/*  是否有购物车 */
-(BOOL )isContainCartForItems:(NSInteger )index;

/*  获取购物车图片*/
-(NSURL *)cartURLForItems:(NSInteger )index;

/*  获取用户头像URLavatar*/
-(NSURL *)avatarForIyems:(NSInteger )index;

/*  获取个性签名下方name*/
-(NSString *)nameForItems:(NSInteger )index;

/*  获取用户名userName  */
-(NSString *)userNameForitems:(NSInteger )index;

/*  获取上方的view高度 */
-(CGFloat )topViewForItems:(NSInteger )index;

/*  获取下方的view的高度 */
-(CGFloat )bottomIndexForItems:(NSInteger )index;

/*  获取当前item的高度  */
-(CGFloat )itemsHeightForItems:(NSInteger )index;

/*  获取当前详细页的ID  */
-(NSString *)IDForItems:(NSInteger )items;

@end






















