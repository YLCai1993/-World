//
//  PageViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PageViewModel.h"

@interface PageViewModel()

@property(nonatomic,assign)NSInteger start;
@property(nonatomic,strong)PageDataModel *data;

@end

@implementation PageViewModel

/*  返回列表的行数 */
-(NSInteger )rowNumber{
    return self.dataArr.count;
}

/*  返回图片URL  */
-(NSURL *)imageURLForRow:(NSInteger )row{
    PageDataObjectListModel *model = self.dataArr[row];
    return [NSURL URLWithString:model.imageUrl];
}

/* 右侧小星星图片的获取 */
-(NSURL *)xingxingURL{
    PageDataObjectListModel *model = self.dataArr[0];
    return [NSURL URLWithString:model.iconUrl2];
}

/*  返回列表介绍 */
-(NSString *)descForRow:(NSInteger )row{
    PageDataObjectListModel *model = self.dataArr[row];
    return model.desc;
}

/*  返回类型 */
-(NSString *)classForRow:(NSInteger )row{
    PageDataObjectListModel *model = self.dataArr[row];
    return model.contentCategory;
}

/*  返回作者名称  */
-(NSString *)nameForRow:(NSInteger )row{
    PageDataObjectListModel *model = self.dataArr[row];
    return model.nickname;
}

/*  返回关注人数  */
-(NSString *)dynamicForRow:(NSInteger )row{
    PageDataObjectListModel *model = self.dataArr[row];
    return model.dynamicInfo2;
}

/*  是不是文章 */
-(BOOL )isArticleForRow:(NSInteger )row{
    PageDataObjectListModel *model = self.dataArr[row];
    return [model.contentCategory isEqualToString:@"文章"];
}

/*  是不是专辑 */
-(BOOL )isAlnbumForRow:(NSInteger )row{
    PageDataObjectListModel *model = self.dataArr[row];
    return [model.contentCategory isEqualToString:@"专辑"];
}

/*  是不是话题 */
-(BOOL )isTopicForRow:(NSInteger )row{
    PageDataObjectListModel *model = self.dataArr[row];
    return [model.contentCategory isEqualToString:@"话题"];
}

/* 是不是堆糖商店 */
-(BOOL )isStoreForRow:(NSInteger )row{
    PageDataObjectListModel *model = self.dataArr[row];
    return [model.contentCategory isEqualToString:@"堆糖商店"];
}

/* 是不是大图 */
-(BOOL )isBigPicForRow:(NSInteger )row{
    PageDataObjectListModel *model = self.dataArr[row];
    return [model.style isEqualToString:@"large"];
}

/* 获取最后的ID */
-(NSString *)IDForRow:(NSInteger )row{
     PageDataObjectListModel *model = self.dataArr[row];
    NSString *target = model.target;
    NSInteger count = target.length;
    NSString *ID = [target substringFromIndex:count-6];
    return ID;
}

/*  获取链接地址 */
-(NSString *)StoreIDForRow:(NSInteger )row{
    PageDataObjectListModel *model = self.dataArr[row];
    return model.target;
}

/*  获取专辑链接地址 */
-(NSString *)albumIDForRow:(NSInteger )row{
    PageDataObjectListModel *model = self.dataArr[row];
    NSString *target = model.target;
    NSInteger count = target.length;
    NSString *ID = [target substringFromIndex:count-8];
    return ID;
}

/*  返回每个cell的行高  */
-(CGFloat )cellHeightForRow:(NSInteger )row{
    if (![self isBigPicForRow:row]) {
        return 140;
    }else{
        if (row == 0) {
            return 220;
        }else{
            CGFloat textH = [[self descForRow:row] boundingRectWithSize:CGSizeMake(kWindowW - 24, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size.height;
            return 260 + textH + 10;
        }
    }
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [PageNetManager getDataFormStartPage:_start CompleteHandle:^(PageModel *model, NSError *error) {
        PageDataModel *data = model.data;
        self.data = data;
        if (_start == 0) {
            [self.dataArr removeAllObjects];
        }
        
        [self.dataArr addObjectsFromArray:data.objectList];
        completionHandle(error);
     }];
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _start = self.data.nextStart;
    [self getDataFromNetCompleteHandle:completionHandle];
}

@end
