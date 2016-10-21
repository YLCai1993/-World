//
//  ArticleViewController.h
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleViewController : UIViewController

@property(nonatomic,strong)NSString *ID;
/*  是否为文章 */
@property(nonatomic,assign,getter=isArticle)BOOL article;
/*  导航栏标题  */
@property(nonatomic,strong)NSString *title1;




@end
