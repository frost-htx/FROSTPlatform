//
//  FRTBaseRequest+RequestCache.m
//  FROSTPlatform
//
//  Created by frost on 16/9/13.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "FRTBaseRequest+RequestCache.h"

static const void *cacheDataKey = &cacheDataKey;
static const void *isIgnoreCacheKey = &isIgnoreCacheKey;

static NSString *requestCacheName = @"requestCache";


@implementation FRTBaseRequest (RequestCache)

#pragma mark Public Methods

-(void)writeCacheResponseData {
    YYCache *yycache = [[YYCache alloc] initWithName:requestCacheName];
    [yycache setObject:self.responseObject forKey:[self buildCachePath]];
}

-(id)readCacheResponseData {
    YYCache *yycache = [[YYCache alloc] initWithName:requestCacheName];
    return [yycache objectForKey:[self buildCachePath]];
}

#pragma mark Private Methods

-(NSString *)buildCachePath {
    NSString *buildStr = [NSString stringWithFormat:@"RequestUrl:%@ AppVersion:%@",[self buildRequesttUrl],[[FRTConfigTools sharedInstance] appVersionString]];
    return [[FRTConfigTools sharedInstance] md5StringFromString:buildStr];
}

-(NSString *)buildRequesttUrl {
    if (self.domainUrl && self.requestUrl) {
        return [NSString stringWithFormat:@"%@%@",self.domainUrl,self.requestUrl];
    } else {
        return @"";
    }
}

#pragma mark getters and setters

-(id)cacheData {
    return objc_getAssociatedObject(self, cacheDataKey);
}

-(void)setCacheData:(id)cacheData {
    objc_setAssociatedObject(self, cacheDataKey, cacheData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)isIgnoreCache {
    NSNumber *number = objc_getAssociatedObject(self, isIgnoreCacheKey);
    return [number boolValue];
}

-(void)setIsIgnoreCache:(BOOL)isIgnoreCache {
    objc_setAssociatedObject(self, isIgnoreCacheKey, @(isIgnoreCache), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
