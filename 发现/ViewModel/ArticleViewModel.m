//
//  ArticleViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ArticleViewModel.h"

@interface ArticleViewModel()

@property(nonatomic,assign)NSInteger start;

@end

@implementation ArticleViewModel

-(FoundArticleDataObjectListModel *)objectForRow:(NSInteger )row{
    return self.dataArr[row];
    
}

/* 获取行数 */
-(NSInteger )rowNumber;{
   return self.dataArr.count;
}

/* 获取详情链接 */
-(NSURL *)extraURLForRow:(NSInteger )row{
    return [NSURL URLWithString:[self objectForRow:row].extraUrl];
}

/* 获取文章内容 */
-(NSString *)contentForRow:(NSInteger )row{
    return [self objectForRow:row].title;
}

/* 获取图片路径 */
-(NSURL *)urlForRow:(NSInteger )row{
    FoundArticleDataObjectListCoverModel *cover = [self objectForRow:row].cover;
    return [NSURL URLWithString:cover.photoPath];
}

/* 获取cell的类型  */
-(NSString *)classForRow:(NSInteger )row{
    return [self objectForRow:row].contentCategory;
}

/* 获取作者名称 */
-(NSString *)userNameForRow:(NSInteger )row{
    FoundArticleDataObjectListSenderModel *sender = [self objectForRow:row].sender;
    return sender.username;
}

/* 获取喜欢的人数 */
-(NSString *)favoCountForRow:(NSInteger )row{
    return [NSString stringWithFormat:@"%.0lf",[self objectForRow:row].likeId];
}

/* 获取星星图片 */
-(NSURL *)XingUrlForRow:(NSInteger )row{
    return [NSURL URLWithString:[self objectForRow:row].iconUrl2];
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.start = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [FoundNetManager getArticleDataFormStartPage:_start CompleteHandle:^(FoundArticleModel *model, NSError *error) {
        if (_start == 0) {
            [self.dataArr removeAllObjects];
        }
        FoundArticleDataModel *data = model.data;
        [self.dataArr addObjectsFromArray:data.objectList];
        self.start = data.nextStart;
        completionHandle(error);
    }];
}

@end


























