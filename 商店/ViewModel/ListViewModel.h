//
//  ListViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "StoreNetManager.h"

@interface ListViewModel : BaseViewModel

/* 列表的个数 */
-(NSInteger )rowNumber;

/*  获取显示图片链接  */
-(NSURL *)picURLForRow:(NSInteger )row;

/*  获取下方介绍 */
-(NSString *)descForRow:(NSInteger )row;

/*  获取专场信息 */
-(NSString *)sTitleForRow:(NSInteger )row;

/*  获取点击链接*/
-(NSURL *)clickURLForRow:(NSInteger )row;

@end
