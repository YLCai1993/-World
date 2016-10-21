//
//  AlubumViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlubumViewModel.h"

@interface AlubumViewModel()

@property(nonatomic,strong)AlbumDataModel *albumModel;

@property(nonatomic,strong)NSString *nextStart;

@end

@implementation AlubumViewModel

-(instancetype)initWithAlbumID:(NSString *)ID{
    if (self = [super init]) {
        self.AlbumID = ID;
    }
    return self;
}

/*  获取作者名称 */
-(NSString *)getName{
    return self.albumModel.name;
}

/*  获取图片数量 */
-(NSString *)getPicCount{
    return [NSString stringWithFormat:@"%.0lf张图片 %@",self.albumModel.count,[self favoCount]];
}

/*  获取收藏人数 */
-(NSString *)favoCount{
    return [NSString stringWithFormat:@"%.0lf人收藏",self.albumModel.favoriteCount];
}

/* 获取头像链接地址 */
-(NSURL *)gethHeadURL{
    AlbumDataUserModel *user = self.albumModel.user;
    return [NSURL URLWithString:user.avatar];
}

/* 获取作者的昵称 */
-(NSString *)getNikeName{
     AlbumDataUserModel *user = self.albumModel.user;
    return user.username;
}

-(void)getsDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [PageNetManager getAlbumDataFormID:_AlbumID CompleteHandle:^(AlbumModel *model, NSError *error) {
        self.albumModel = model.data;
        completionHandle(error);
    }];
}

#pragma mark - 获取下方信息的方法

/*  获取详细ID   */
-(NSString *)idForItems:(NSInteger )items{
    AlbumBottomDataObjectListModel *object = self.dataArr[items];
    return [NSString stringWithFormat:@"%.0lf",object.objectListIdentifier];
}

/* 获取详细的ID */
-(NSString *)getDetailIDForItems:(NSInteger )items{
    AlbumBottomDataObjectListModel *object = self.dataArr[items];
    return [NSString stringWithFormat:@"%.0lf",object.objectListIdentifier];
}

/* 返回下方详解view的高度 */
-(CGFloat )heightForMsgForItems:(NSInteger )index{
    
    CGFloat textH = [[self getmsgFormItems:index] boundingRectWithSize:CGSizeMake(173-15, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size.height;
    return 30 + textH;
}

/*  获取下方的items个数 */
-(NSInteger )itemsNumber{
    return self.dataArr.count;
}

/* 获取图片的宽度 */  //172.5
-(CGFloat )picWidthForItems:(NSInteger )index{
    return 172.5;
}

/* 获取图片的高度 */
-(CGFloat )picHeightForItems:(NSInteger )index{
    AlbumBottomDataObjectListModel *object = self.dataArr[index];
    AlbumBottomDataObjectListPhotoModel *photo = object.photo;
    CGFloat height = photo.height / (photo.width / 172.5);
    return height;
}

/* 获取图片 */
-(NSURL *)getBottomPicForItems:(NSInteger )index{
    AlbumBottomDataObjectListModel *object = self.dataArr[index];
    AlbumBottomDataObjectListPhotoModel *photo = object.photo;
    NSString *path = [photo.path substringToIndex:photo.path.length - 5];
    return [NSURL URLWithString:path];
}

/* 获取用户名 */
-(NSString *)getmsgFormItems:(NSInteger )index{
    AlbumBottomDataObjectListModel *object = self.dataArr[index];
    return object.msg;
}

/* 获取评论数量 */
-(NSString *)getRepleyCountForItems:(NSInteger )index{
    AlbumBottomDataObjectListModel *object = self.dataArr[index];
    return [NSString stringWithFormat:@"%.0lf",object.replyCount];
}

/* 获取点赞数量 */
-(NSString *)getLikeCountForItems:(NSInteger )index{
    AlbumBottomDataObjectListModel *object = self.dataArr[index];
    return [NSString stringWithFormat:@"%.0lf",object.likeCount];
}

/* 获取喜欢数量 */
-(NSString *)getFavoCountForItems:(NSInteger )index{
    AlbumBottomDataObjectListModel *object = self.dataArr[index];
    return [NSString stringWithFormat:@"%.0lf",object.favoriteCount];
}

//获取下方数据
-(void)getBottomDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    _nextStart = 0;
    [self getBottomsssDataFromNetCompleteHandle:completionHandle];
}

-(void)getBottomsssDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [PageNetManager getAlbumBottomForID:_AlbumID andStart:_nextStart CompleteHandle:^(AlbumBottomModel *model, NSError *error)
                     {
                         if (_nextStart == 0) {
                             [self.dataArr removeAllObjects];
                         }
                         AlbumBottomDataModel *data = model.data;
                         [self.dataArr addObjectsFromArray:data.objectList];
                         _nextStart = [NSString stringWithFormat:@"%.0lf",data.nextStart];
                         completionHandle(error);
                     }];

}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    [self getBottomsssDataFromNetCompleteHandle:completionHandle];
}

@end



























