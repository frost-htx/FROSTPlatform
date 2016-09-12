//
//  FRTBatchRequest.m
//  FROSTPlatform
//
//  Created by frost on 16/9/12.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "FRTBatchRequest.h"
#import "FRTBaseRequest.h"

@interface FRTBatchRequest ()<FRTBaseRequestDelegate>

/**
 *  批量请求完成标示
 */
@property (nonatomic,assign) NSInteger finishTag;

/**
 *  批量请求数组
 */
@property (nonatomic,strong) NSArray<FRTBaseRequest *> *batchArray;

/**
 *  开始请求
 */
-(void)start;

@end

@implementation FRTBatchRequest

#pragma mark life cycle

-(instancetype)initWithBatchArray:(NSArray *)requests {
    if (self = [super init]) {
        if (requests) {
            self.batchArray = [NSArray arrayWithArray:requests];
        }
    }
    return self;
}

-(void)dealloc {
    [self cancel];
}

#pragma mark FRTBaseRequestDelegate 

-(void)requestFinished:(FRTBaseRequest *)baseRequest {
    self.finishTag ++;
    if (self.finishTag == [self.batchArray count]) {
        if (self.successCompletionBlock) {
            self.successCompletionBlock(self);
        }
        [self clearCircularBlock];
    }
}

-(void)requestFailed:(FRTBaseRequest *)baseRequest {
    self.failedRequest = baseRequest;
    if (self.failureCompletionBlock) {
        self.failureCompletionBlock(self);
    }
    [self cancel];
}

#pragma mark Public Methods

-(void)startWithCompletionBlockWithSuccess:(FRTBatchRequestCompletionBlock)success
                                   failure:(FRTBatchRequestCompletionBlock)failure {
    self.successCompletionBlock = success;
    self.failureCompletionBlock = failure;
    [self start];
}

-(void)cancel {
    for (FRTBaseRequest *baseRequest in _batchArray) {
        [baseRequest cancel];
    }
    [self clearCircularBlock];
}

#pragma mark Private Methods

-(void)start {
    self.failedRequest = nil;
    for (FRTBaseRequest *baseRequest in _batchArray) {
        baseRequest.delegate = self;
        [baseRequest start];
    }
}

-(void)clearCircularBlock {
    self.successCompletionBlock = nil;
    self.failureCompletionBlock = nil;
}


@end
