//
//  FoundArticleModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class FoundArticleDataModel,FoundArticleDataObjectListCoverModel,FoundArticleDataObjectListSenderModel,FoundArticleDataObjectListClubModel;

@interface FoundArticleModel : BaseModel

@property (nonatomic, assign) double status;
@property (nonatomic, strong) FoundArticleDataModel *data;

@end

@interface FoundArticleDataModel : BaseModel

@property (nonatomic, strong) NSArray *objectList;
@property (nonatomic, assign) double nextStart;
@property (nonatomic, assign) double more;

@end

@interface FoundArticleDataObjectListModel : BaseModel

@property (nonatomic, assign) double favoriteId;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *dynamicInfo2;
@property (nonatomic, strong) NSString *extraUrl;
@property (nonatomic, strong) NSString *dynamicInfo;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, assign) double activeTime;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) FoundArticleDataObjectListCoverModel *cover;
@property (nonatomic, assign) double addDatetimeTs;
@property (nonatomic, assign) double objectListIdentifier;
@property (nonatomic, strong) NSString *iconUrl2;
@property (nonatomic, strong) NSString *contentCategory;
@property (nonatomic, strong) FoundArticleDataObjectListSenderModel *sender;
@property (nonatomic, assign) double likeId;
@property (nonatomic, assign) double visitCount;
@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, strong) NSString *statusStr;
@property (nonatomic, strong) FoundArticleDataObjectListClubModel *club;
@property (nonatomic, assign) double commentCount;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *articleType;

@end

@interface FoundArticleDataObjectListPhotoModel : BaseModel

@property (nonatomic, assign) double width;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, assign) double height;

@end

@interface FoundArticleDataObjectListCoverModel : BaseModel

@property (nonatomic, assign) double coverIdentifier;
@property (nonatomic, strong) NSString *coverDesc;
@property (nonatomic, strong) NSString *photoPath;

@end

@interface FoundArticleDataObjectListSenderModel : BaseModel

@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double senderIdentifier;
@property (nonatomic, strong) NSArray *identity;
@property (nonatomic, assign) BOOL isCertifyUser;
@property (nonatomic, strong) NSString *avatar;

@end

@interface FoundArticleDataObjectListClubModel : BaseModel

@property (nonatomic, strong) NSString *clubIdentifier;

@end





























