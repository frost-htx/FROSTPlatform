//
//  DemoRequestAPI1.m
//  FROSTPlatform
//
//  Created by frost on 16/9/19.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "DemoRequestAPI1.h"

@interface DemoRequestAPI1 ()
{
    NSString *_platform;
    NSString *_version;
}
@end

@implementation DemoRequestAPI1

#pragma mark Public Methods

-(instancetype)initWithPlatform:(NSString *)platform version:(NSString *)version {
    if ([super init]) {
        _platform = platform;
        _version = version;
        self.isIgnoreCache = YES;
    }
    return self;
}

-(NSString *)url {
    if (self.responseObject && [self.responseObject isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dataDic = [self.responseObject objectForKey:@"data"];
        NSString *url = [dataDic objectForKey:@"url"];
        return url;
    }
    return nil;
}

#pragma mark overloading Methods

-(FRTRequestMethod)requestMethod {
    return FRTRequestMethod_Get;
}

-(void)start {
    [super start];
}

-(NSString *)domainUrl {
    return @"http://m.zuzuche.com";
}

-(id)requestParameters {
    return @{@"app_t":_platform,
             @"kml_v":_version};
}

-(NSString *)requestUrl {
    return @"/api/poi/get_map_kml.php?";
}

@end
