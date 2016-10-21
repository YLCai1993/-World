//
//  DetailArticleViewController.h
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailArticleViewController : UIViewController

-(instancetype)initWithURL:(NSURL *)url;
@property(nonatomic,strong)NSURL *url;


@end
