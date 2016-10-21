//
//  TopicModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class TopicDataModel,TopicDataSenderModel,TopicDataShareLinks3Model,TopicDataClubModel,TopicDataShareLinksModel;

@interface TopicModel : BaseModel

@property (nonatomic, assign) double status;
@property (nonatomic, strong) TopicDataModel *data;

@end

@interface TopicDataModel : BaseModel

@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *dynamicInfo2;
@property (nonatomic, strong) TopicDataClubModel *club;
@property (nonatomic, assign) double commentCount;
@property (nonatomic, strong) TopicDataShareLinksModel *shareLinks;
@property (nonatomic, strong) NSString *statusStr;
@property (nonatomic, assign) double likeId;
@property (nonatomic, assign) double favoriteId;
@property (nonatomic, assign) double activeTime;
@property (nonatomic, assign) double addDatetimeTs;
@property (nonatomic, assign) double visitCount;
@property (nonatomic, strong) TopicDataShareLinks3Model *shareLinks3;
@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) TopicDataSenderModel *sender;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *content;
@property(nonatomic,assign)double ID;

@end

@interface TopicDataPhotoModel : BaseModel

@property (nonatomic, assign) double width;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, assign) double height;

@end

@interface TopicDataSenderModel : BaseModel

@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double senderIdentifier;
@property (nonatomic, strong) NSArray *identity;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) NSString *avatar;

@end

@interface TopicDataShareLinks3Model : BaseModel

@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *system;
@property (nonatomic, strong) NSString *weibo;
@property (nonatomic, strong) NSString *weixin;
@property (nonatomic, strong) NSString *qzone;
@property (nonatomic, strong) NSString *weixinpengyouquan;

@end

@interface TopicDataShareLinksModel : BaseModel

@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *system;
@property (nonatomic, strong) NSString *weibo;
@property (nonatomic, strong) NSString *weixin;
@property (nonatomic, strong) NSString *qzone;
@property (nonatomic, strong) NSString *weixinpengyouquan;

@end

@interface TopicDataClubModel : BaseModel

@property (nonatomic, strong) NSString *clubIdentifier;
@property (nonatomic, strong) NSString *name;

@end






























