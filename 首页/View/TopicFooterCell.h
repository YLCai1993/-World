//
//  TopicFooterCell.h
//  BaseProject
//
//  Created by YLCai on 16/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicFooterCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *UserHeadView;

@property (weak, nonatomic) IBOutlet UIButton *userNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *topicContentLabel;

@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UILabel *dateTimeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *topicImageView;

/*  评论喜欢的视图 */
@property (weak, nonatomic) IBOutlet UIView *commentLikeView;

@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (weak, nonatomic) IBOutlet UILabel *likeLabel;

@property (weak, nonatomic) IBOutlet UIButton *answerNameLabel;

@property (weak, nonatomic) IBOutlet UIButton *answeredLabel;

@property (weak, nonatomic) IBOutlet UILabel *answerContenrLabel;

@property (weak, nonatomic) IBOutlet UIView *commentBackView;

@end


























