//
//  CustomView.m
//  BaseProject
//
//  Created by YLCai on 16/10/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setSenderAvatarLabel:(UIImageView *)SenderAvatarLabel{
    _SenderAvatarLabel = SenderAvatarLabel;
    _SenderAvatarLabel.layer.cornerRadius = 20;
    _SenderAvatarLabel.layer.masksToBounds = YES;
}
@end
