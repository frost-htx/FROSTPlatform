//
//  DemoRequestImageAPI.m
//  FROSTPlatform
//
//  Created by frost on 16/9/20.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "DemoRequestImageAPI.h"

@interface DemoRequestImageAPI ()
{
    NSString *_imageID;
}
@end

@implementation DemoRequestImageAPI

#pragma mark life cycle 

-(instancetype)initWithImageId:(NSString *)imageID {
    if ([super init]) {
        self.isIgnoreCache = YES;
        _imageID = imageID;
    }
    return self;
}

#pragma mark overloading methods

-(NSString *)downloadSaveAddress {
    return [NSString stringWithFormat:@"%@/Documents/%@.jpg",NSHomeDirectory(),_imageID];
}

-(NSString *)domainUrl {
    return @"http://img1.maka.im/";
}

-(NSString *)requestUrl {
    return [NSString stringWithFormat:@"gallery/office/%@",_imageID];
}

@end
