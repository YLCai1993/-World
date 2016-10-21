//
//  TopicViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "PageNetManager.h"

@interface TopicViewModel : BaseViewModel

-(instancetype)initWithTopicTopicID:(NSString *)topicID;
@property(nonatomic,strong)NSString *topicID;


#pragma mark 顶部的数据获取
/*  是否有图片 */
-(BOOL)isContainHeaderImageView;

/* 获取表头视图的高 */
-(CGFloat )heightForHeaderView;

/* 获取顶部的标题内容  */
-(NSString *)titleForHeader;

/*  图片的获取  */
-(NSURL *)picURLForHeader;

/*  获取userName的名字 */
-(NSString *)userNameForheader;

/*  获取时间 */
-(NSString *)timeForHeader;

/*  获取浏览次数 */
-(NSString *)visitForHeader;

#pragma mark - 获取下方数据
/*  获取评论的数量 */
-(NSInteger )rowNumber;

/*  获取评论头像avatar */
-(NSURL *)avatarURLForRow:(NSInteger )row;

/*  获取评论用户名username*/
-(NSString *)userNameForRow:(NSInteger )row;

/*  获取日期add_datetime_str*/
-(NSString *)dateTimeForRow:(NSInteger )row;

/*  获取评论内容*/
-(NSString *)contentURLForRow:(NSInteger )row;

/*  是否有评论图片*/
-(BOOL )isContainPhotoForRow:(NSInteger )row;

/*  获取图片数组*/
-(NSArray *)photosForRow:(NSInteger )row;

/*  获取评论人数reply_count*/
-(NSString *)replyCountForRow:(NSInteger )row;

/*  获取点赞人数 like_count*/
-(NSString *)likeCountForRow:(NSInteger )row;

/*  是否有回复内容 */
-(BOOL)isContainRepley:(NSInteger )row;

/*  获取回复人的名称 */
-(NSString *)senderUserNameForRow:(NSInteger )row;

/* 获取回复人对象名称(和评论人用户名一样) */
-(NSString *)recipientUserNameForRow:(NSInteger )row;

/*  获取回复内容 */
-(NSString *)replyContentForRow:(NSInteger )row;

/*  一开始获取的数据  */
-(void)getActionMoreDataCompletionHandle:(CompletionHandle)completionHandle;

/*  返回上方view的高度 */
-(CGFloat )heightTopViewForRow:(NSInteger )row;

/*  返回单元格的高度  */
-(CGFloat )cellHeightForRow:(NSInteger )row;

@end



















