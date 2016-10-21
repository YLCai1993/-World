//
//  ArticleViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "FoundNetManager.h"

@interface ArticleViewModel : BaseViewModel

/* 获取行数 */
-(NSInteger )rowNumber;

/* 获取详情链接 */
-(NSURL *)extraURLForRow:(NSInteger )row;

/* 获取文章内容 */
-(NSString *)contentForRow:(NSInteger )row;

/* 获取图片路径 */
-(NSURL *)urlForRow:(NSInteger )row;

/* 获取cell的类型  */
-(NSString *)classForRow:(NSInteger )row;

/* 获取作者名称 */
-(NSString *)userNameForRow:(NSInteger )row;

/* 获取喜欢的人数 */
-(NSString *)favoCountForRow:(NSInteger )row;

/* 获取星星图片 */
-(NSURL *)XingUrlForRow:(NSInteger )row;

@end
