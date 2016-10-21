//
//  HotPictureCell.m
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HotPictureCell.h"

@implementation HotPictureCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setUserImageView:(UIImageView *)userImageView{
    _userImageView = userImageView;
    _userImageView.layer.cornerRadius = 15;
    _userImageView.layer.masksToBounds = YES;
}


@end
