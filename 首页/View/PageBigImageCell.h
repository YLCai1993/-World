//
//  PageBigImageCell.h
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageBigImageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet UILabel *topTitle;

@property (weak, nonatomic) IBOutlet UILabel *bottomTitle;

@property (weak, nonatomic) IBOutlet UILabel *classLabel;

@property (weak, nonatomic) IBOutlet UILabel *nikeNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *lickeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *likeImage;

@end
