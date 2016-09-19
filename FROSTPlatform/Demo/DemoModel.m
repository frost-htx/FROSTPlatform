//
//  DemoModel.m
//  FROSTPlatform
//
//  Created by frost on 16/8/19.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "DemoModel.h"

@class DataList;
@implementation DemoModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"dataList" : [DataList class]};
}

@end

@implementation DataList


@end