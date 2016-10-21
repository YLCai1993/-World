//
//  TopicViewController.h
//  BaseProject
//
//  Created by YLCai on 16/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicViewController : UIViewController

-(instancetype)initWithTopicID:(NSString *)topicID;
@property(nonatomic,strong)NSString *topicID;

@end
