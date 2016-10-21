//
//  CustomViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CustomViewModel.h"

@interface CustomViewModel()

@property(nonatomic,strong)CustomDataModel *dataModel;

@end

@implementation CustomViewModel

-(instancetype)initWithID:(NSString *)ID{
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}

/*  获取图片地址URL */
-(NSURL *)getPhotoURL{
    NSString *path = self.dataModel.photo.path;
    return [NSURL URLWithString:[path substringToIndex:path.length-5]];
}

/*  获取图片的高度 */
-(CGFloat )hetHeightForPhoto{
    CGFloat width = self.dataModel.photo.width;
    return  self.dataModel.photo.height / (width / (kWindowW - 20));
}

/*  是否有msg(图片下方的数字) */
-(BOOL )isContainMsg{
    return YES;
}

/*  返回msg文字的高度 */
-(CGFloat )msgHeight{
    CGFloat textH = [[self getMsg] boundingRectWithSize:CGSizeMake(335, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
    return textH;
}

/*  获取msg(图片下方的数字或文字) */
-(NSString *)getMsg{
    return self.dataModel.msg;
}

/*  是否有人收藏 sender */
-(BOOL )isHadSomeOneCollect{
    CustomDataSenderModel *sender = self.dataModel.sender;
    return sender == nil ? NO : YES;
}

/*  获取收藏人的信息头像URL(Sender) */
-(NSURL *)getSenderAvatarURL{
    return [NSURL URLWithString:self.dataModel.sender.avatar];
}

/*  获取收藏人的信息名称(Sender) */
-(NSString *)getSenderUserName{
    return self.dataModel.sender.username;
}

/*  获取收藏人的信息的收藏位置(Sender)(收藏到。。。) */
-(NSString *)getSenderUserArea{
    return [NSString stringWithFormat:@"收藏到 %@",self.dataModel.album.name];
}

/*  获取收藏时间add_datetime */
-(NSString *)getAdddateTime{
    return self.dataModel.addDatetime;
}

/*  获取下方View的高度 */
-(CGFloat )heightForTopView{
    CGFloat height = 30 + [self msgHeight] + 50;
    return height;
}

/*  获取上方视图的高度 */
-(CGFloat )heightTopView{
    CGFloat height = 10 + [self hetHeightForPhoto] + 4 + [self heightForTopView];
    return height;
}

/*  是否有评论 top_comments  object_list */
-(BOOL)isContainTopComments{
    CustomDataTopCommentsModel *topComments = self.dataModel.topComments;
    NSArray *arr = topComments.objectList;
    if (arr.count == 0 || arr == nil) {
        return NO;
    }
    return YES;
}

/*  评论人头像  top_comments  object_list sender  avatar */
-(NSURL *)getTopcommentAvatarURL{
    CustomDataTopCommentsObjectlistModel *object = self.dataModel.topComments.objectList[0];
    return [NSURL URLWithString:object.sender.avatar];
}

/*  评论时间 add_datetime_str */
-(NSString *)commentTime{
    CustomDataTopCommentsObjectlistModel *object = self.dataModel.topComments.objectList[0];
    return object.addDatetime;
}

/*  评论人名称 top_comments  object_list username */
-(NSString *)getTopCommentUserName{
    CustomDataTopCommentsObjectlistModel *object = self.dataModel.topComments.objectList[0];
    return object.sender.username;
}

/*  评论人评论内容 content */
-(NSString *)getTopCommentContent{
    CustomDataTopCommentsObjectlistModel *object = self.dataModel.topComments.objectList[0];
    return object.content;
}

/*  返回评论底部视图的高度 */
-(CGFloat)getHeightCommentView{
    CGFloat height = 100 + [self getHeightForTopCommentContent];
    return height;
}

/*  返回评论的高度 */
-(CGFloat )getHeightForTopCommentContent{
    CustomDataTopCommentsObjectlistModel *object = self.dataModel.topComments.objectList[0];  //285
    CGFloat textH = [object.content boundingRectWithSize:CGSizeMake(285, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;
    return textH;
}

/*  是否有点赞 top_like_users  */
-(BOOL )isContainTopLikeUsers{
    NSArray *array = self.dataModel.topLikeUsers;
    if (array.count == 0 || array == nil) {
        return NO;
    }else{
        return YES;
    }
 
}

/*  点赞头像 top_like_users  */
-(NSArray *)topLikeUserAvatarURL{
    NSMutableArray *arr = [NSMutableArray new];
    for (CustomDataRelatedAlbumsUserModel *user in self.dataModel.topLikeUsers) {
        [arr addObject:[NSURL URLWithString:user.avatar]];
    }
    return [arr copy];
}

/*  收藏到以下专辑的图片URL related_albums  covers */  //都是以数组形势
-(NSArray *)releatedURLs{
    NSMutableArray *arr = [NSMutableArray array];
    for (CustomDataRelatedAlbumsModel *releate in self.dataModel.relatedAlbums) {
        [arr addObject:[NSURL URLWithString:releate.user.avatar]];
    }
    return [arr copy];
}

/*  收藏到以下专辑的名称 related_albums  name */
-(NSArray *)releateNames{
    NSMutableArray *arr = [NSMutableArray array];
    for (CustomDataRelatedAlbumsModel *releate in self.dataModel.relatedAlbums) {
        [arr addObject:releate.name];
    }
    return [arr copy];
}

/*  收藏到以下专辑的用户名 related_albums  user  username */
-(NSArray *)releateUserNames{
    NSMutableArray *arr = [NSMutableArray array];
    for (CustomDataRelatedAlbumsModel *releate in self.dataModel.relatedAlbums) {
        [arr addObject:[NSString stringWithFormat:@"by %@",releate.user.username]];
    }
    return [arr copy];
}

/*  获取推广图片 */
-(NSString *)tuiGaungPicName{
    return [NSString stringWithFormat:@"0000%u",arc4random_uniform(13)];
}

/*  获取推广介绍 */
-(NSString *)tuiGuangRecommandl{
    return @"造物主赐予的美丽，每次人值得拥有";
}


-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [CustomNetManager getDataFormID:self.ID CompleteHandle:^(CustomModel *model, NSError *error) {
        self.dataModel = model.data;
        completionHandle(error);
    }];
}

@end

























