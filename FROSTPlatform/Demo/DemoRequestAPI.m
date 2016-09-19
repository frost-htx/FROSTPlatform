//
//  DemoRequestAPI.m
//  FROSTPlatform
//
//  Created by frost on 16/9/14.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "DemoRequestAPI.h"

static NSString *DOMAINURL = @"";

@implementation DemoRequestAPI
{
    NSString *_cateid;
    NSString *_order;
    NSString *_pageNumber;
    NSString *_timestamp;
    NSString *_perPage;
}

#pragma mark life cycle

-(void)dealloc {
    
}

-(instancetype)initWithCateId:(NSString *)cateid order:(NSString *)order pageNumber:(NSString *)pageNumber {
    self = [super init];
    if (self) {
        _cateid = cateid;
        _order = order;
        _pageNumber = pageNumber;
        _perPage = @"20";
        _timestamp = self.currentTime;
        self.isIgnoreCache = NO;
    }
    return self;
}


#pragma mark overloading Methods

-(FRTRequestMethod)requestMethod {
    return FRTRequestMethod_Get;
}

-(void)start {
    [super start];
}

-(NSString *)domainUrl {
    return IMAGEDOMAINURL;
}

-(id)requestParameters {
    return @{@"cateId":_cateid,
             @"order":_order,
             @"pageNumber":_pageNumber,
             @"timestamp":_timestamp};
}

-(NSString *)requestUrl {
    return @"/app/storeTemplates?";
}

@end
