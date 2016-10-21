//
//  CustomViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "CustomNetManager.h"

@interface CustomViewModel : BaseViewModel

-(instancetype)initWithID:(NSString *)ID;
@property(nonatomic,strong)NSString *ID;

/*  获取图片地址URL */
-(NSURL *)getPhotoURL;

/*  获取图片的高度 */
-(CGFloat )hetHeightForPhoto;

/*  是否有msg(图片下方的数字) */
-(BOOL )isContainMsg;

/*  返回msg文字的高度 */
-(CGFloat )msgHeight;

/*  获取msg(图片下方的数字或文字) */
-(NSString *)getMsg;

/*  是否有人收藏sender */
-(BOOL )isHadSomeOneCollect;

/*  获取收藏人的信息头像URL(Sender) */
-(NSURL *)getSenderAvatarURL;

/*  获取收藏人的信息名称(Sender) */
-(NSString *)getSenderUserName;

/*  获取收藏人的信息的收藏位置(Sender)(收藏到。。。) */
-(NSString *)getSenderUserArea;

/*  获取收藏时间add_datetime */
-(NSString *)getAdddateTime;

/*  获取下方View的高度 */
-(CGFloat )heightForTopView;

/*  获取上方视图的高度 */
-(CGFloat )heightTopView;

/*  是否有评论 top_comments  object_list */
-(BOOL)isContainTopComments;

/*  评论人头像  top_comments  object_list sender  avatar */
-(NSURL *)getTopcommentAvatarURL;

/*  评论人名称 top_comments  object_list username */
-(NSString *)getTopCommentUserName;

/*  评论时间 add_datetime_str */
-(NSString *)commentTime;

/*  评论人评论内容 content */
-(NSString *)getTopCommentContent;

/*  返回评论的高度 */
-(CGFloat )getHeightForTopCommentContent;

/*  返回评论底部视图的高度 */
-(CGFloat)getHeightCommentView;

/*  是否有点赞 top_like_users  */
-(BOOL )isContainTopLikeUsers;

/*  点赞头像 top_like_users  */
-(NSArray *)topLikeUserAvatarURL;

/*  收藏到以下专辑的图片URL related_albums  covers */  //都是以数组形势
-(NSArray *)releatedURLs;

/*  收藏到以下专辑的名称 related_albums  name */
-(NSArray *)releateNames;

/*  收藏到以下专辑的用户名 related_albums  user  username */
-(NSArray *)releateUserNames;

/*  获取推广图片 */
-(NSString *)tuiGaungPicName;

/*  获取推广介绍 */
-(NSString *)tuiGuangRecommandl;

@end
















































