//
//  FRTBaseRequest.m
//  FROSTPlatform
//
//  Created by frost on 16/9/2.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "FRTBaseRequest.h"
#import "FRTNetWorkAgent.h"

@interface FRTBaseRequest ()

/**
 *  清除循环引用
 */
-(void)clearCircularBlock;

@end

@implementation FRTBaseRequest

-(void)startWithCompletionBlockWithSuccess:(FRTRequestCompletionBlock)success failure:(FRTRequestCompletionBlock)failure {
    self.successCompletionBlock = success;
    self.failureCompletionBlock = failure;
}

#pragma mark Private Medthods 

-(void)clearCircularBlock {
    self.successCompletionBlock = nil;
    self.failureCompletionBlock = nil;
}

#pragma mark Can be Overload Medthods

-(void)start {
    [[FRTNetWorkAgent sharedInstance] addRequest:self];
}

-(FRTRequestSerializerType)requestSerializerType {
    return FRTRequestSerializerTypeHTTP;
}

-(FRTRequestMethod)requestMethod {
    return FRTRequestMethod_Get;
}

-(NSString *)domainUrl {
    return nil;
}

-(NSString *)requestUrl {
    return nil;
}

-(id)requestParameters {
    return nil;
}

-(NSDictionary *)requestHttpHeads {
    return nil;
}

-(NSString *)downloadSaveAddress {
    return nil;
}

-(NSTimeInterval)requestTimeoutInterval {
    return 60;
}

@end
