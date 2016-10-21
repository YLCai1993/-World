//
//  AlbumViewController.h
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumViewController : UIViewController

-(instancetype)initWithAlbumID:(NSString *)ID;
@property(nonatomic,strong)NSString *albumID;
@property(nonatomic,strong)NSString *titles;



@end
