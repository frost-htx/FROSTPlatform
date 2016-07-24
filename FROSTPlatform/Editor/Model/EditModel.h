//
//  EditModel.h
//  FROSTPlatform
//
//  Created by frost on 16/7/18.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "RootModel.h"

@protocol PageModel @end
@interface EditModel : RootModel

@property (nonatomic,strong) NSMutableArray<PageModel> *json;
@end

@protocol ContentModel @end
@interface PageModel : RootModel

@property (nonatomic, strong) NSString *bgcolor;
@property (nonatomic, strong) NSString *bgpic;
@property (nonatomic, strong) NSMutableArray<ContentModel> *content;
@end

@interface ContentModel : RootModel

@property (nonatomic, strong) NSString *top;
@property (nonatomic, strong) NSString *left;
@property (nonatomic, strong) NSString *w;
@property (nonatomic, strong) NSString *h;
@property (nonatomic, strong) NSString *type;
/*********************image******************/
@property (nonatomic, strong) NSString *picid;
/*********************label******************/
@property (nonatomic, strong) NSString *textalign;
@property (nonatomic, strong) NSString *ftsize;
@property (nonatomic, strong) NSString *ftcolor;
@property (nonatomic, strong) NSString *con;

@end