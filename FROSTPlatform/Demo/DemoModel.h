//
//  DemoModel.h
//  FROSTPlatform
//
//  Created by frost on 16/8/19.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DataList;
@interface DemoModel : NSObject

@property (nonatomic,strong) NSString *cateId;
@property (nonatomic,strong) NSString *perPage;
@property (nonatomic,strong) NSArray<DataList *> *dataList;

@end

@interface DataList : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *price;
@property (nonatomic,strong) NSString *discount;
@property (nonatomic,strong) NSString *author;
@property (nonatomic,strong) NSString *firstImg;

@end