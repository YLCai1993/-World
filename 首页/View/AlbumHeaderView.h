//
//  AlbumHeaderView.h
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumHeaderView : UIView


@property (weak, nonatomic) IBOutlet UIImageView *bgIMgaeView;

@property (weak, nonatomic) IBOutlet UILabel *titleLbael;

@property (weak, nonatomic) IBOutlet UILabel *imageCountLabel;

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


/*  左边按钮 */
@property (weak, nonatomic) IBOutlet UIButton *leftButton;

/*  右边按钮 */
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end


























