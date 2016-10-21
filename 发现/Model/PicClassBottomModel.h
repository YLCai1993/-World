//
//  PicClassBottomModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class PicClassBottomDataObjectListPhotoModel,PicClassBottomDataObjectListSenderModel,PicClassBottomDataObjectListAlbumModel,PicClassBottomDataModel;

@interface PicClassBottomModel : BaseModel

@property (nonatomic, assign) double status;
@property (nonatomic, strong) PicClassBottomDataModel *data;

@end


@interface PicClassBottomDataModel : BaseModel

@property (nonatomic, strong) NSArray *objectList;
@property (nonatomic, assign) double nextStart;
@property (nonatomic, assign) double more;

@end

@interface PicClassBottomDataObjectListModel : BaseModel

@property (nonatomic, assign) double objectListIdentifier;
@property (nonatomic, assign) double senderId;
@property (nonatomic, strong) PicClassBottomDataObjectListAlbumModel *album;
@property (nonatomic, strong) NSString *addDatetime;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, assign) double favoriteCount;
@property (nonatomic, assign) double buyable;
@property (nonatomic, strong) NSString *addDatetimePretty;
@property (nonatomic, strong) NSString *sourceLink;
@property (nonatomic, assign) double addDatetimeTs;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, assign) double replyCount;
@property (nonatomic, strong) PicClassBottomDataObjectListSenderModel *sender;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) PicClassBottomDataObjectListPhotoModel *photo;

@end

@interface PicClassBottomDataObjectListAlbumModel : BaseModel

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

@interface PicClassBottomDataObjectListSenderModel : BaseModel

@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double senderIdentifier;
@property (nonatomic, strong) NSArray *identity;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) NSString *avatar;

@end

@interface PicClassBottomDataObjectListPhotoModel : BaseModel

@property (nonatomic, assign) double width;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, assign) double height;

@end

















