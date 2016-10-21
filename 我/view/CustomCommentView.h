//
//  CustomCommentView.h
//  BaseProject
//
//  Created by YLCai on 16/10/20.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCommentView : UIView


@property (weak, nonatomic) IBOutlet UILabel *commentCount;

@property (weak, nonatomic) IBOutlet UIImageView *commentAvatarImageView;

@property (weak, nonatomic) IBOutlet UIButton *CommentUserNameButton;

@property (weak, nonatomic) IBOutlet UILabel *CommentContentLabel;

@property (weak, nonatomic) IBOutlet UILabel *addDateTimeLabel;

@end
