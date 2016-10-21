//
//  PicClassModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class PicClassDataModel;

@interface PicClassModel : BaseModel

@property (nonatomic, assign) double status;
@property (nonatomic, strong) PicClassDataModel *data;

@end


@interface PicClassDataModel : BaseModel

@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) NSString *sp;
@property (nonatomic, strong) NSString *selectionAlbumTarget;
@property (nonatomic, strong) NSArray *subCates;
@property (nonatomic, assign) double isShowPrice;
@property (nonatomic, strong) NSString *shortName;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *desc;

@end

@interface PicClassDataSubCatesModel : BaseModel

@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *subCatesIdentifier;
@property (nonatomic, strong) NSString *themeName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *target;

@end


























