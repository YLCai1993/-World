//
//  TopicFooterCell.m
//  BaseProject
//
//  Created by YLCai on 16/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicFooterCell.h"

@implementation TopicFooterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setUserHeadView:(UIImageView *)UserHeadView{
    _UserHeadView = UserHeadView;
    _UserHeadView.layer.cornerRadius = 17;
    _UserHeadView.layer.masksToBounds = YES;
}

@end
