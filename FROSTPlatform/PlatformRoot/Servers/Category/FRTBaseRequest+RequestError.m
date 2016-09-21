//
//  FRTBaseRequest+RequestError.m
//  FROSTPlatform
//
//  Created by frost on 16/9/20.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "FRTBaseRequest+RequestError.h"

static const void *requestErrorKey = &requestErrorKey;

@implementation FRTBaseRequest (RequestError)

#pragma mark Public Methods

-(NSString *)transformErrorInfo {
    return [self transformToString:self.requestError];
}

#pragma mark Private Methods

-(NSString *)transformToString:(NSError *)error {
    switch (error.code) {
        case 200:
            return nil;
            break;
        case 404:
            return @"";
            break;
        default:
            break;
    }
    return @"网络请求失败";
}

#pragma mark getters and setters

-(NSError *)requestError {
    return objc_getAssociatedObject(self, requestErrorKey);
}

-(void)setRequestError:(NSError *)requestError {
    objc_setAssociatedObject(self, requestErrorKey, requestError, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (requestError) {
        NSDictionary *dic = requestError.userInfo;
        NSLog(@"URL = %@, errorInfo = %@",[dic objectForKey:@"NSErrorFailingURLKey"],[dic objectForKey:@"NSLocalizedDescription"]);
    }

}
@end
