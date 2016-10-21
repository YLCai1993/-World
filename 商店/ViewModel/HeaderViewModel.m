//
//  HeaderViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeaderViewModel.h"

@implementation HeaderViewModel

/*  获取图谱安的链接地址 */
-(NSArray *)getIconArr{
    NSMutableArray *arr = [NSMutableArray new];
    for (PageDataObjectListModel *object in self.dataArr) {
        [arr addObject:[NSURL URLWithString:object.imageUrl]];
    }
    return [arr copy];
}

/*   获取点进去的链接地址 */
-(NSArray *)clickURLArr{
    NSMutableArray *arr = [NSMutableArray new];
    for (PageDataObjectListModel *object in self.dataArr) {
        [arr addObject:[NSURL URLWithString:object.target]];
    }
    return [arr copy];
}


-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [StoreNetManager getAdsDataFromCompleteHandle:^(PageModel *model, NSError *error) {
        PageDataModel *data = model.data;
        [self.dataArr addObjectsFromArray:data.objectList];
        completionHandle(error);
    }];
}

@end
