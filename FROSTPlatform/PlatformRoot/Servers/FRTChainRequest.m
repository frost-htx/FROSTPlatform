//
//  FRTChainRequest.m
//  FROSTPlatform
//
//  Created by frost on 16/9/12.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "FRTChainRequest.h"
#import "FRTChainRequestAgent.h"

@interface FRTChainRequest ()<FRTBaseRequestDelegate>

/**
 *  chain请求数组
 */
@property (nonatomic,strong) NSMutableArray *baseRequestArray;

/**
 *  chain回调数组
 */
@property (nonatomic,strong) NSMutableArray *chainCallBackArray;

/**
 *  请求数组下标
 */
@property (nonatomic,assign) NSInteger requestIndex;

@end

@implementation FRTChainRequest

#pragma mark lift cycle

-(void)dealloc {
    
}

-(instancetype)init {
    if (self = [super init]) {
        _requestIndex = 0;
    }
    return self;
}

#pragma mark FRTBaseRequestDelegate

-(void)requestFinished:(FRTBaseRequest *)baseRequest {
    NSInteger currentCallBackIndex = _requestIndex - 1;
    if (currentCallBackIndex < [_chainCallBackArray count]) {
        ChainCallBack chainCallBack = [_chainCallBackArray objectAtIndex:currentCallBackIndex];
        if (chainCallBack) {
            chainCallBack(baseRequest,self);
        }
    }
    if (![self startNextRequest]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(chainRequestFinish:)]) {
            [self.delegate chainRequestFinish:self];
            [[FRTChainRequestAgent sharedInstance] removeChainRequest:self];
        }
    }
}

-(void)requestFailed:(FRTBaseRequest *)baseRequest {
    if (self.delegate && [self.delegate respondsToSelector:@selector(chainRequestFailed:baseRequest:)]) {
        [self.delegate chainRequestFailed:self baseRequest:baseRequest];
        [[FRTChainRequestAgent sharedInstance] removeChainRequest:self];
    }
}

#pragma mark Public Methods

-(void)setRequest:(FRTBaseRequest *)baseRequest callBack:(ChainCallBack)callBack {
    if (baseRequest) {
        [self.baseRequestArray addObject:baseRequest];
    }
    if (callBack) {
        [self.chainCallBackArray addObject:callBack];
    }
}

-(void)start {
    if ([_baseRequestArray count] > 0) {
        [self startNextRequest];
        [[FRTChainRequestAgent sharedInstance] addChainRequest:self];
    }
}

-(void)cancel {
    [self clearRequest];
    [[FRTChainRequestAgent sharedInstance] removeChainRequest:self];
}

#pragma mark Private Methods

-(BOOL)startNextRequest {
    if (_requestIndex < [_baseRequestArray count]) {
        FRTBaseRequest *baseRequest = [_baseRequestArray objectAtIndex:_requestIndex];
        _requestIndex ++;
        baseRequest.delegate = self;
        [baseRequest start];
        return YES;
    } else {
        return NO;
    }
}

-(void)clearRequest {
    NSInteger requestIndex = _requestIndex - 1;
    if (requestIndex < [_baseRequestArray count]) {
        FRTBaseRequest *request = _baseRequestArray[requestIndex];
        [request cancel];
    }
    [_baseRequestArray removeAllObjects];
    [_chainCallBackArray removeAllObjects];
}

#pragma mark getters and setters 

-(NSMutableArray *)baseRequestArray {
    if (!_baseRequestArray) {
        _baseRequestArray = [NSMutableArray array];
    }
    return _baseRequestArray;
}

-(NSMutableArray *)chainCallBackArray {
    if (!_chainCallBackArray) {
        _chainCallBackArray = [NSMutableArray array];
    }
    return _chainCallBackArray;
}

@end
