//
//  CustomModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class CustomDataModel,CustomDataAlbumModel,CustomDataRootAlbumModel,CustomDataShareLinks3Model,CustomDataSenderModel,CustomDataTopCommentsModel,CustomDataPhotoModel,CustomDataRelatedAlbumsUserModel;

@interface CustomModel : BaseModel

@property (nonatomic, assign) double status;
@property (nonatomic, strong) CustomDataModel *data;

@end

@interface CustomDataModel : BaseModel

@property (nonatomic, strong) CustomDataAlbumModel *album;
@property (nonatomic, assign) double isRoot;
@property (nonatomic, strong) NSArray *topLikeUsers;
@property (nonatomic, assign) double senderId;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, assign) double hasFavorited;
@property (nonatomic, strong) NSArray *relatedAlbums;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, assign) double replyCount;
@property (nonatomic, strong) CustomDataRootAlbumModel *rootAlbum;
@property (nonatomic, strong) NSString *addDatetimePretty;
@property (nonatomic, assign) double addDatetimeTs;
@property (nonatomic, assign) double eventCount;
@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, strong) NSString *addDatetime;
@property (nonatomic, strong) CustomDataShareLinks3Model *shareLinks3;
@property (nonatomic, strong) CustomDataSenderModel *sender;
@property (nonatomic, assign) double likeId;
@property (nonatomic, assign) double prevId;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) CustomDataTopCommentsModel *topComments;
@property (nonatomic, assign) double buyable;
@property (nonatomic, strong) CustomDataPhotoModel *photo;
@property (nonatomic, strong) NSString *extraType;
@property (nonatomic, assign) double nextId;
@property (nonatomic, strong) NSString *extraHtml;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, assign) double favoriteCount;

@end

@interface CustomDataRelatedAlbumsModel : BaseModel

@property (nonatomic, strong) NSArray *covers;
@property (nonatomic, assign) double isRoot;
@property (nonatomic, assign) double activedAt;
@property (nonatomic, assign) double relatedAlbumsIdentifier;
@property (nonatomic, assign) double category;
@property (nonatomic, assign) double count;
@property (nonatomic, assign) double favoriteCount;
@property (nonatomic, assign) double favoriteId;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, strong) CustomDataRelatedAlbumsUserModel *user;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *name;

@end

@interface CustomDataRelatedAlbumsUserModel : BaseModel

@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double userIdentifier;
@property (nonatomic, strong) NSArray *identity;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) NSString *avatar;

@end

@interface CustomDatatopLikeUsersModel : BaseModel

@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double topLikeUsersIdentifier;
@property (nonatomic, strong) NSArray *identity;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) NSString *avatar;

@end

@interface CustomDataAlbumModel : BaseModel

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

@interface CustomDataRootAlbumModel : BaseModel

@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSArray *covers;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, assign) double rootAlbumIdentifier;
@property (nonatomic, assign) double category;
@property (nonatomic, assign) double count;
@property (nonatomic, assign) double activedAt;
@property (nonatomic, assign) double favoriteCount;
@property (nonatomic, assign) double favoriteId;
@property (nonatomic, strong) NSString *name;

@end

@interface CustomDataShareLinks3Model : BaseModel

@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *system;
@property (nonatomic, strong) NSString *weibo;
@property (nonatomic, strong) NSString *weixin;
@property (nonatomic, strong) NSString *qzone;
@property (nonatomic, strong) NSString *weixinpengyouquan;

@end

@interface CustomDataSenderModel : BaseModel

@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double senderIdentifier;
@property (nonatomic, strong) NSArray *identity;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) NSString *avatar;

@end

@interface CustomDataTopCommentsModel : BaseModel

@property (nonatomic, strong) NSArray *objectList;
@property (nonatomic, assign) double nextStart;
@property (nonatomic, assign) double more;

@end

@interface CustomDataPhotoModel : BaseModel

@property (nonatomic, assign) double width;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, assign) double height;

@end

@interface CustomDataTopCommentsObjectlistModel : BaseModel

@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) CustomDataSenderModel *sender;
@property (nonatomic, assign) double objectListIdentifier;
@property (nonatomic, strong) NSString *addDatetimeStr;
@property (nonatomic, strong) NSString *statusStr;
@property (nonatomic, strong) NSString *addDatetimePretty;
@property (nonatomic, strong) NSString *addDatetime;
@property (nonatomic, assign) double addDatetimeTs;

@end










































































