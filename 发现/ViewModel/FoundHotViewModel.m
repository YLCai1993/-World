//
//  FoundHotViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "FoundHotViewModel.h"

@interface FoundHotViewModel()

@property(nonatomic,assign)NSInteger start;

@end

@implementation FoundHotViewModel

-(instancetype)initWithType:(NSString *)type{
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

/*  items的个数 */
/*  items的个数 */
-(NSInteger )RowNumber{
   return self.dataArr.count;
}

-(FoundDataObjectListModel *)objectListForItems:(NSInteger )items{
    return self.dataArr[items];
}

/*  获取图片地址 photo */
-(NSURL *)photoURLForItems:(NSInteger )index{
    FoundDataObjectLisPhototModel *photo = [self objectListForItems:index].photo;
    NSString *path = [photo.path substringToIndex:photo.path.length - 5];
    return [NSURL URLWithString:path ];
}

/*  获取图片的高度*/
-(CGFloat )photoHeightForItems:(NSInteger )index{
    FoundDataObjectLisPhototModel *photo = [self objectListForItems:index].photo;
    return photo.height / ( photo.width/((kWindowW - 30)/2) );
}

/*  获取下方的信息msg*/
-(NSString *)msgForItems:(NSInteger )index{
    return [self objectListForItems:index].msg;
}

/*  获取回复数量replyCount*/
-(NSString *)replyCountRorItems:(NSInteger )index{
    NSString *count = [NSString stringWithFormat:@"%.0lf",[self objectListForItems:index].replyCount];
    return count;
}

/*  获取点赞数量likeCount*/
-(NSString *)lickeCountForItems:(NSInteger )index{
     NSString *count = [NSString stringWithFormat:@"%.0lf",[self objectListForItems:index].likeCount];
    return count;
}

/*  获取喜欢数量favoriteCount*/
-(NSString *)favoriteForItems:(NSInteger )index{
   NSString *count = [NSString stringWithFormat:@"%.0lf",[self objectListForItems:index].favoriteCount];
    return count;
}

/*  是否有购物车 */
-(BOOL )isContainCartForItems:(NSInteger )index{
    return NO;
}

/*  获取购物车图片*/
-(NSURL *)cartURLForItems:(NSInteger )index{
    return nil;
}

/*  获取用户头像URLavatar*/
-(NSURL *)avatarForIyems:(NSInteger )index{
    FoundDataObjectListSenderModel *sender = [self objectListForItems:index].sender;
    return [NSURL URLWithString:sender.avatar];
}

/*  获取个性签名下方name*/
-(NSString *)nameForItems:(NSInteger )index{
    FoundDataObjectListAlbumModel *album = [self objectListForItems:index].album;
    return album.name;
}

/*  获取用户名userName  */
-(NSString *)userNameForitems:(NSInteger )index{
    FoundDataObjectListSenderModel *sender = [self objectListForItems:index].sender;
    return sender.username;
}

/*  获取上方的view高度 */
-(CGFloat )topViewForItems:(NSInteger )index{
     CGFloat textH = 0;
        textH = [[self msgForItems:index] boundingRectWithSize:CGSizeMake(173-15, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:13]} context:nil].size.height;
    CGFloat height = 30 + textH;
    return height;
}

/*  获取下方的view的高度 */
-(CGFloat )bottomIndexForItems:(NSInteger )index{
//    CGFloat textH = 0;
   // || [[self nameForItems:index] isEqualToString:@"盼⃝夏⃝の「物⃝以⃝類⃝聚⃝」"]
//    if ([[self nameForItems:index] isEqualToString:@"((≡ຶ⚲͜≡ຶ))"]) {
//        textH = 15;
//    }else{
//       textH = [[self nameForItems:index] boundingRectWithSize:CGSizeMake(172-45-10, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:13]} context:nil].size.height;
//    }
//    CGFloat height = textH + 36;
    CGFloat height = 15 + 36;
    return height;
}

/*  获取当前item的高度  */
-(CGFloat )itemsHeightForItems:(NSInteger )index{
    return [self photoHeightForItems:index] + [self topViewForItems:index] + [self bottomIndexForItems:index] + 1;
}

/*  获取当前详细页的ID  */
-(NSString *)IDForItems:(NSInteger )items{
    return [NSString stringWithFormat:@"%.0lf",[self objectListForItems:items].objectListIdentifier];
}

//获取更多
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    [self getDataFromNetCompleteHandle:completionHandle];
}
//刷新
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

//获取数据
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    
    if ([self.type isEqualToString:@"热门图片"]) {
        self.dataTask = [FoundNetManager getDataFormStartPage:_start CompleteHandle:^(FoundModel *model, NSError *error) {
            if (_start == 0) {
                [self.dataArr removeAllObjects];
            }
            FoundDataModel *data = model.data;
            self.start = (NSInteger)data.nextStart;
            [self.dataArr addObjectsFromArray:data.objectList];
            completionHandle(error);
        }];
    }else{
        self.dataTask = [FoundNetManager getHaoWuDataFormStartPage:_start CompleteHandle:^(FoundModel *model, NSError *error) {
            if (self.dataArr == 0) {
                [self.dataArr removeAllObjects];
            }
            FoundDataModel *data = model.data;
            self.start = (NSInteger)data.nextStart;
            [self.dataArr addObjectsFromArray:data.objectList];
            completionHandle(error);
        }];
    }
    
}


@end























