//
//  ListViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ListViewModel.h"

@interface ListViewModel()

@property(nonatomic,strong)NSMutableArray *arr;

@end

@implementation ListViewModel

-(NSMutableArray *)arr{
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}

/* 列表的个数 */
-(NSInteger )rowNumber{
    return self.arr.count;
}

-(PageDataObjectListModel *)objectForRow:(NSInteger )row{
    return self.arr[row];
}

/*  获取显示图片链接  */
-(NSURL *)picURLForRow:(NSInteger )row{
    return [NSURL URLWithString:[self objectForRow:row].imageUrl];
}

/*  获取下方介绍 */
-(NSString *)descForRow:(NSInteger )row{
    return [self objectForRow:row].desc;
}

/*  获取专场信息 */
-(NSString *)sTitleForRow:(NSInteger )row{
    return [NSString stringWithFormat:@"%@>",[self objectForRow:row].stitle];
}

/*  获取点击链接*/
-(NSURL *)clickURLForRow:(NSInteger )row{
    return [NSURL URLWithString:[self objectForRow:row].target];
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [StoreNetManager getListDataFromCompleteHandle:^(PageModel *model, NSError *error) {
        PageDataModel *data = model.data;
        [self.arr addObjectsFromArray:data.objectList];
        completionHandle(error);
    }];
}


@end




































