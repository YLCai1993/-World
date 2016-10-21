//
//  PicClassviewModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PicClassviewModel.h"

@interface PicClassviewModel()

@property(nonatomic,strong)PicClassDataModel *dataModel;
@property(nonatomic,assign)NSInteger start;

@end

@implementation PicClassviewModel

-(instancetype)initWithPicID:(NSString *)ID{
    if (self = [super init]) {
        self.picID = ID;
    }
    return self;
}

/*  获取顶部的小标题  */
-(NSArray *)itemsName{
    NSMutableArray *arr = [NSMutableArray new];
    for (PicClassDataSubCatesModel *model in self.dataModel.subCates) {
        [arr addObject:model.name];
    }
    return [arr copy];
}

//获取右边的按钮的链接
-(NSURL *)urlForRight{
    NSString *path = [self.dataModel.selectionAlbumTarget  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [NSURL URLWithString:path];
}


/* 获取数据 */
-(void)getTopDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [FoundNetManager getTopPicClassDataFormStartPage:self.picID CompleteHandle:^(PicClassModel *model, NSError *error) {
        self.dataModel = model.data;
        completionHandle(error);
    }];
}

#pragma mark - 回去下面列表的数据

-(PicClassBottomDataObjectListModel *)objectForItems:(NSInteger )items{
    return self.dataArr[items];
}
/*  获取列表的个数 */
-(NSInteger )itemsNumber{
    return self.dataArr.count;
}

/*  获取显示的图片  */
-(NSURL *)photoURlForItems:(NSInteger )items{
    PicClassBottomDataObjectListPhotoModel *photo = [self objectForItems:items].photo;
    NSString *path = [photo.path substringToIndex:photo.path.length - 5];
    return [NSURL URLWithString:path];
}

/*  获取图片的高度  */
-(CGFloat )photoHeightForItems:(NSInteger )items{
    PicClassBottomDataObjectListPhotoModel *photo = [self objectForItems:items].photo;
    return photo.height / ( photo.width/((kWindowW - 30)/2) );
}

/*  获取下方显示的内容  */
-(NSString *)contentForItems:(NSInteger )items{
    return [self objectForItems:items].msg;
}

/*  获取评论的数目  */
-(NSString *)commentForItems:(NSInteger )items{
    return [NSString stringWithFormat:@"%.0lf",[self objectForItems:items].replyCount];
}

/*  获取点赞的数目  */
-(NSString *)likeCountForItems:(NSInteger )items{
    return [NSString stringWithFormat:@"%.0lf",[self objectForItems:items].likeCount];
}

/*  获取喜欢的数目  */
-(NSString *)favoCountForItems:(NSInteger )items{
   return [NSString stringWithFormat:@"%.0lf",[self objectForItems:items].favoriteCount];
}

/*  获取用户的头像  */
-(NSURL *)avaterURLForItems:(NSInteger )items{
    PicClassBottomDataObjectListSenderModel *sender = [self objectForItems:items].sender;
    return [NSURL URLWithString:sender.avatar];
}

/*  获取用户的类别  */
-(NSString *)classForItems:(NSInteger )items{
    PicClassBottomDataObjectListAlbumModel *album = [self objectForItems:items].album;
    return album.name;
}

/*  获取用户的名称  */
-(NSString *)userNameForItems:(NSInteger )items{
    PicClassBottomDataObjectListSenderModel *sender = [self objectForItems:items].sender;
    return sender.username;
}

/*  获取上方view的高度  */
-(CGFloat )topViewHeightForItems:(NSInteger )items{
    CGFloat textH = 0;
    textH = [[self contentForItems:items] boundingRectWithSize:CGSizeMake(173-15, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:13]} context:nil].size.height;
    if (textH >= 90) {
        textH = 90;
    }
    CGFloat height = 30 + textH;
    return height;
}

/*  获取下方view的高度  */
-(CGFloat )bottomViewHeightForItems:(NSInteger )items{
    CGFloat textH = 0;
     textH = [[self classForItems:items] boundingRectWithSize:CGSizeMake(172-45-10, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:13]} context:nil].size.height;
        CGFloat height = textH + 36;
    return height;
}

/*  获取item的高度  */
-(CGFloat )itemsHeightForItems:(NSInteger )items{
    return [self photoHeightForItems:items] + [self topViewHeightForItems:items] + [self bottomViewHeightForItems:items] + 2;
}

/*  获取item的ID */
-(NSString *)IDForItems:(NSInteger )items{
    return [NSString stringWithFormat:@"%.0lf",[self objectForItems:items].objectListIdentifier];
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
   self.dataTask = [FoundNetManager getBottomPicClassDataFormStartPage:_start andPicID:self.picID CompleteHandle:^(PicClassBottomModel *model, NSError *error) {
        if (_start == 0) {
            [self.dataArr removeAllObjects];
        }
        PicClassBottomDataModel *data = model.data;
        [self.dataArr addObjectsFromArray:data.objectList];
        _start = (NSInteger)data.nextStart;
        completionHandle(error);
    }];
}

@end















































