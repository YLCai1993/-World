//
//  FoundModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"
@class FoundDataModel,FoundDataObjectListAlbumModel,FoundDataObjectLisPhototModel,FoundDataObjectListSenderModel,FoundDataObjectListItemModel;

@interface FoundModel : BaseModel

@property (nonatomic, assign) double status;
@property (nonatomic, strong) FoundDataModel *data;


@end

@interface FoundDataModel : BaseModel

@property (nonatomic, strong) NSArray *objectList;
@property (nonatomic, assign) double more;
@property (nonatomic, assign) double nextStart;

@end

@interface FoundDataObjectListModel : BaseModel

@property (nonatomic, assign) double objectListIdentifier;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) FoundDataObjectListAlbumModel *album;
@property (nonatomic, strong) FoundDataObjectLisPhototModel *photo;
@property (nonatomic, strong) FoundDataObjectListSenderModel *sender;
@property (nonatomic, assign) double favoriteCount;
@property (nonatomic, assign) double buyable;
@property (nonatomic, strong) FoundDataObjectListItemModel *item;
@property (nonatomic, strong) NSString *sourceLink;
@property (nonatomic, assign) double addDatetimeTs;
@property (nonatomic, strong) NSString *addDatetimePretty;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, assign) double replyCount;
@property (nonatomic, assign) double senderId;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) NSString *addDatetime;

@end

@interface FoundDataObjectListAlbumModel : BaseModel

@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSArray *covers;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, assign) double albumIdentifier;
@property (nonatomic, assign) double category;
@property (nonatomic, assign) double count;
@property (nonatomic, assign) double activedAt;
@property (nonatomic, assign) double favoriteCount;
@property (nonatomic, assign) double favoriteId;
@property (nonatomic, strong) NSString *name;

@end

@interface FoundDataObjectLisPhototModel : BaseModel

@property (nonatomic, assign) double width;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, assign) double height;

@end

@interface FoundDataObjectListSenderModel : BaseModel

@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double senderIdentifier;
@property (nonatomic, strong) NSArray *identity;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) NSString *avatar;

@end

@interface FoundDataObjectListItemModel : BaseModel

@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSString *iconUrl;

@end























