//
//  PicClassViewController.h
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PicClassViewController : UIViewController

-(instancetype)initWithPicID:(NSString *)ID andTitleName:(NSString *)name;
@property(nonatomic,strong)NSString *picID;
@property(nonatomic,strong)NSString *titleName;

@end
