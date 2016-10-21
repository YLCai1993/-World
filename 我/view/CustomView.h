//
//  CustomView.h
//  BaseProject
//
//  Created by YLCai on 16/10/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (weak, nonatomic) IBOutlet UILabel *msgLabel;

@property (weak, nonatomic) IBOutlet UIImageView *SenderAvatarLabel;

@property (weak, nonatomic) IBOutlet UIButton *SenderButton;

@property (weak, nonatomic) IBOutlet UILabel *SenderUserLabel;

@property (weak, nonatomic) IBOutlet UILabel *AdddateTimeLabel;

@property (weak, nonatomic) IBOutlet UIView *TopView;


@end
