//
//  AlbumModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class AlbumDataModel,AlbumDataShareLinks3Model,AlbumDataUserModel;

@interface AlbumModel : BaseModel

@property (nonatomic, assign) double status;
@property (nonatomic, strong) AlbumDataModel *data;

@end

@interface AlbumDataModel : BaseModel

@property (nonatomic, strong) NSArray *covers;
@property (nonatomic, assign) double activedAt;
@property (nonatomic, assign) double dataIdentifier;
@property (nonatomic, assign) double category;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double favoriteCount;
@property (nonatomic, assign) double favoriteId;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) AlbumDataShareLinks3Model *shareLinks3;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, strong) AlbumDataUserModel *user;
@property (nonatomic, assign) double status;
@property (nonatomic, assign) double likeId;

@end

@interface AlbumDataShareLinks3Model : BaseModel

@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *system;
@property (nonatomic, strong) NSString *weibo;
@property (nonatomic, strong) NSString *weixin;
@property (nonatomic, strong) NSString *qzone;
@property (nonatomic, strong) NSString *weixinpengyouquan;

@end


@interface AlbumDataUserModel : BaseModel

@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double userIdentifier;
@property (nonatomic, strong) NSArray *identity;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) NSString *avatar;

@end

@interface AlbumDataTagsModel : BaseModel

@property (nonatomic, assign) double tagId;
@property (nonatomic, assign) double tagsIdentifier;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *target;
@end