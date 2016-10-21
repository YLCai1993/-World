//
//  TopicBottomModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class TopicBottomDataModel,TopicBottomDataObjectListSenderModel,TopicBottomDataObjectListRepliesRecipientModel;

@interface TopicBottomModel : BaseModel

@property (nonatomic, assign) double status;
@property (nonatomic, strong) TopicBottomDataModel *data;

@end

@interface TopicBottomDataModel : BaseModel

@property (nonatomic, strong) NSArray *objectList;
@property (nonatomic, assign) double nextStart;
@property (nonatomic, assign) double more;

@end

@interface TopicBottomDataObjectListModel : BaseModel

@property (nonatomic, assign) double objectListIdentifier;
@property (nonatomic, strong) NSString *statusStr;
@property (nonatomic, assign) double topicId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) double addDatetimeTs;
@property (nonatomic, strong) NSString *addDatetimeStr;
@property (nonatomic, assign) double hasLiked;
@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) NSArray *replies;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, assign) double replyCount;
@property (nonatomic, strong) TopicBottomDataObjectListSenderModel *sender;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *content;

@end

@interface TopicBottomDataObjectListPhotosModel : BaseModel

@property (nonatomic, assign) double width;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, assign) double height;


@end

@interface TopicBottomDataObjectListRepliesModel : BaseModel

@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) TopicBottomDataObjectListSenderModel *sender;
@property (nonatomic, assign) double repliesIdentifier;
@property (nonatomic, strong) NSString *addDatetimeStr;
@property (nonatomic, strong) NSString *statusStr;
@property (nonatomic, assign) double tCommentId;
@property (nonatomic, strong) TopicBottomDataObjectListRepliesRecipientModel *recipient;
@property (nonatomic, assign) double addDatetimeTs;

@end

@interface TopicBottomDataObjectListRepliesRecipientModel : BaseModel

@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double recipientIdentifier;
@property (nonatomic, strong) NSArray *identity;
@property (nonatomic, assign) BOOL ID;
@property (nonatomic, strong) NSString *avatar;

@end


@interface TopicBottomDataObjectListSenderModel : BaseModel

@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double ID;
@property (nonatomic, strong) NSArray *identity;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) NSString *avatar;

@end













