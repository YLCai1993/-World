//
//  CustomCommentView.m
//  BaseProject
//
//  Created by YLCai on 16/10/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CustomCommentView.h"

@implementation CustomCommentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setCommentAvatarImageView:(UIImageView *)commentAvatarImageView{
    _commentAvatarImageView = commentAvatarImageView;
    _commentAvatarImageView.layer.cornerRadius = 20;
    _commentAvatarImageView.layer.masksToBounds = YES;
}

@end
