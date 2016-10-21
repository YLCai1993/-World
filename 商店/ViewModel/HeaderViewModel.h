//
//  HeaderViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "StoreNetManager.h"

@interface HeaderViewModel : BaseViewModel

/*  获取图谱安的链接地址 */
-(NSArray *)getIconArr;

/*   获取点进去的链接地址 */
-(NSArray *)clickURLArr;

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle;

@end
