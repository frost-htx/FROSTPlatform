//
//  DemoRequestAPI2.m
//  FROSTPlatform
//
//  Created by frost on 16/9/19.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "DemoRequestAPI2.h"

@interface DemoRequestAPI2 ()
{
    NSString *_url;
}

@end

@implementation DemoRequestAPI2

#pragma mark life cycle

-(instancetype)initWithUrl:(NSString *)url {
    if ([super init]) {
        _url = url;
    }
    return self;
}

#pragma mark overloading Methods

-(FRTRequestMethod)requestMethod {
    return FRTRequestMethod_Get;
}

-(FRTResponseSerializerType)responseSerializerType {
    return FRTResponseSerializerTypeHTTP;
}

-(NSString *)domainUrl {
    return _url;
}

-(NSString *)downloadSaveAddress {
    return [NSString stringWithFormat:@"%@/Documents/recommendroutes.zip",NSHomeDirectory()];
}

@end
