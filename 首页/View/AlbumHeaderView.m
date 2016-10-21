//
//  AlbumHeaderView.m
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AlbumHeaderView.h"

@implementation AlbumHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setHeadImageView:(UIImageView *)headImageView{
    _headImageView = headImageView;
    _headImageView.layer.cornerRadius = 20;
    _headImageView.layer.masksToBounds = YES;
}

@end
