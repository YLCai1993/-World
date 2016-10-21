//
//  TopicViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicViewModel.h"

@interface TopicViewModel()

@property(nonatomic,strong)TopicDataModel *dataModel;
@property(nonatomic,assign)NSInteger start;

@end

@implementation TopicViewModel
-(instancetype)initWithTopicTopicID:(NSString *)topicID{
    if (self = [super init]) {
        self.topicID = topicID;
    }
    return self;
}

#pragma mark 顶部的数据获取
/*  是否有图片 */
-(BOOL)isContainHeaderImageView{
    if (self.dataModel.photos == nil || self.dataModel.photos
               .count == 0) {
        return NO;
    }
    return YES;
}


/* 获取表头视图的高 */
-(CGFloat )heightForHeaderView{
    CGFloat height = 235;
     CGFloat textH = [[self titleForHeader] boundingRectWithSize:CGSizeMake(kWindowW-30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size.height;
    if ([self isContainHeaderImageView]) {
       return height + textH;
    }else{
        return height + textH - 120;
    }
   
    
}

/* 获取顶部的标题内容  */
-(NSString *)titleForHeader{
    return self.dataModel.content;
}

/*  图片的获取  */
-(NSURL *)picURLForHeader{
    if (self.dataModel.photos == nil || self.dataModel.photos
        .count == 0) {
        return nil;
    }
    TopicDataPhotoModel *photo = self.dataModel.photos[0];
    return [NSURL URLWithString:photo.path];
}

/*  获取userName的名字 */
-(NSString *)userNameForheader{
    TopicDataSenderModel *sender = self.dataModel.sender;
    return sender.username;
}

/*  获取时间 */
-(NSString *)timeForHeader{
    return [NSString stringWithFormat:@"%.0lf",self.dataModel.activeTime];
}

/*  获取浏览次数 */
-(NSString *)visitForHeader{
    CGFloat count = self.dataModel.visitCount;
    if (count > 1000) {
        return [NSString stringWithFormat:@"浏览 %.1lfk",count/1000];
    }else{
        return [NSString stringWithFormat:@"%.0lf",self.dataModel.visitCount];
    }
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.dataTask = [PageNetManager getTopicDataFormID:_topicID CompleteHandle:^(TopicModel *model, NSError *error) {
        self.dataModel = model.data;
        completionHandle(error);
    }];
}

#pragma mark - 获取下方数据
-(TopicBottomDataObjectListModel *)ObjectModelForRow:(NSInteger )row{
    return self.dataArr[row];
}

/*  获取评论的数量 */
-(NSInteger )rowNumber{
    return self.dataArr.count;
}

/*  获取评论头像avatar */
-(NSURL *)avatarURLForRow:(NSInteger )row{
    TopicBottomDataObjectListSenderModel *sender = [self ObjectModelForRow:row].sender;
    return [NSURL URLWithString:sender.avatar];
}

/*  获取评论用户名username*/
-(NSString *)userNameForRow:(NSInteger )row{
    TopicBottomDataObjectListSenderModel *sender = [self ObjectModelForRow:row].sender;
    return sender.username;
}

/*  获取日期add_datetime_str*/
-(NSString *)dateTimeForRow:(NSInteger )row{
    return [self ObjectModelForRow:row].addDatetimeStr;
}

/*  获取评论内容*/
-(NSString *)contentURLForRow:(NSInteger )row{
    return [self ObjectModelForRow:row].content;
}

/*  是否有评论图片*/
-(BOOL )isContainPhotoForRow:(NSInteger )row{
    NSArray *arr = [self ObjectModelForRow:row].photos;
    if (arr == nil || arr.count == 0) {
        return NO;
    }
    return YES;
}

/*  获取图片数组*/
-(NSArray *)photosForRow:(NSInteger )row{
    if ([self isContainPhotoForRow:row]) {
        NSMutableArray *arr = [NSMutableArray new];
        for (TopicBottomDataObjectListPhotosModel *photo in [self ObjectModelForRow:row].photos) {
            [arr addObject:[NSURL URLWithString:photo.path]];
        }
        return [arr copy];
    }else{
        return nil;
    }
}

/*  获取评论人数reply_count*/
-(NSString *)replyCountForRow:(NSInteger )row{
    return [NSString stringWithFormat:@"%.0lf",[self ObjectModelForRow:row].replyCount];
}

/*  获取点赞人数 like_count*/
-(NSString *)likeCountForRow:(NSInteger )row{
    return [NSString stringWithFormat:@"%.0lf",[self ObjectModelForRow:row].likeCount];
}

/*  是否有回复内容 */
-(BOOL)isContainRepley:(NSInteger )row{
    return [[self replyCountForRow:row] isEqualToString:@"0"] ? NO : YES;
}

/*  获取回复人的名称(第一个) */
-(NSString *)senderUserNameForRow:(NSInteger )row{
    if ([self isContainRepley:row]) {
        TopicBottomDataObjectListRepliesModel *reply = [self ObjectModelForRow:row].replies[0];
        TopicBottomDataObjectListSenderModel *sender = reply.sender;
        return sender.username;
    }else{
        return nil;
    }
}

/* 获取回复人对象名称(和评论人用户名一样) */
-(NSString *)recipientUserNameForRow:(NSInteger )row{
    if ([self isContainRepley:row]) {
        TopicBottomDataObjectListRepliesModel *reply = [self ObjectModelForRow:row].replies[0];
        TopicBottomDataObjectListRepliesRecipientModel *recipient = reply.recipient;
        return recipient.username;
    }else{
        return nil;
    }
}

/*  获取回复内容 */
-(NSString *)replyContentForRow:(NSInteger )row{
    if ([self isContainRepley:row]) {
        TopicBottomDataObjectListRepliesModel *reply = [self ObjectModelForRow:row].replies[0];
        return reply.content;
    }else{
        return nil;
    }
}

/*  一开始获取的数据  */
-(void)getActionMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    self.start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [PageNetManager getTopicBottomFormID:_topicID andStart:_start CompleteHandle:^(TopicBottomModel *model, NSError *error) {
        TopicBottomDataModel *data = model.data;
        if (_start == 0) {
            [self.dataArr removeAllObjects];
        }
        _start = data.nextStart;
        [self.dataArr addObjectsFromArray:data.objectList];
        completionHandle(error);
    }];
}

/*  返回上方view的高度 */
-(CGFloat )heightTopViewForRow:(NSInteger )row{
    CGFloat height = 10 + 40 + 20 + 10;
    CGFloat textH = [[self contentURLForRow:row] boundingRectWithSize:CGSizeMake(305-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil].size.height;
    if (textH >= 90) {
        textH = 90;
    }
    height = height + textH;
    if ([self isContainPhotoForRow:row]) {
        height = height + 90;
        return height;
    }
    return height;
}

/*  返回单元格的高度  */
-(CGFloat )cellHeightForRow:(NSInteger )row{
//    NSLog(@"row:%ld  白色的高度:%lf",row,[self heightTopViewForRow:row]);
    CGFloat height = 30 + [self heightTopViewForRow:row];
    if ([self isContainRepley:row]) {
        height = height + 2 + 70;
        return height + 20;
    }
    return height + 20;
}

@end
































