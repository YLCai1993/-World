//
//  AlbumBottomModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class AlbumBottomDataModel,AlbumBottomDataObjectListAlbumModel,AlbumBottomDataObjectListSenderModel,AlbumBottomDataObjectListPhotoModel;

@interface AlbumBottomModel : BaseModel


@property (nonatomic, assign) double status;
@property (nonatomic, strong) AlbumBottomDataModel *data;

@end

@interface AlbumBottomDataModel : BaseModel

@property (nonatomic, assign) double more;
@property (nonatomic, strong) NSArray *objectList;
@property (nonatomic, assign) double nextStart;
@property (nonatomic, assign) double total;
@property (nonatomic, assign) double limit;

@end

@interface AlbumBottomDataObjectListModel : BaseModel

@property (nonatomic, assign) double objectListIdentifier;
@property (nonatomic, assign) double senderId;
@property (nonatomic, strong) AlbumBottomDataObjectListAlbumModel *album;
@property (nonatomic, strong) NSString *addDatetime;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, assign) double favoriteCount;
@property (nonatomic, assign) double buyable;
@property (nonatomic, strong) NSString *addDatetimePretty;
@property (nonatomic, strong) NSString *sourceLink;
@property (nonatomic, assign) double addDatetimeTs;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, strong) NSString *extraType;
@property (nonatomic, assign) double replyCount;
@property (nonatomic, strong) AlbumBottomDataObjectListSenderModel *sender;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) AlbumBottomDataObjectListPhotoModel *photo;

@end

@interface AlbumBottomDataObjectListAlbumModel : BaseModel

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

@interface AlbumBottomDataObjectListSenderModel : BaseModel

@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double senderIdentifier;
@property (nonatomic, strong) NSArray *identity;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) NSString *avatar;

@end

@interface AlbumBottomDataObjectListPhotoModel : BaseModel

@property (nonatomic, assign) double width;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, assign) double height;

@end













