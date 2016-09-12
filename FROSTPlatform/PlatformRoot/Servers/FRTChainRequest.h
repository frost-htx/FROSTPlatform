//
//  FRTChainRequest.h
//  FROSTPlatform
//
//  Created by frost on 16/9/12.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRTBaseRequest.h"

@class FRTChainRequest;

typedef void (^ChainCallBack)(FRTBaseRequest *baseRequest,FRTChainRequest *chainRequest);

@protocol FRTChainRequestDeleate <NSObject>

/**
 *  chain请求全部完成
 *
 *  @param chainRequest FRTChainRequest
 */
-(void)chainRequestFinish:(FRTChainRequest *)chainRequest;

/**
 *  chain 请求某一条请求失败
 *
 *  @param chainRequest FRTChainRequest
 *  @param baseRequest  FRTBaseRequest
 */
-(void)chainRequestFailed:(FRTChainRequest *)chainRequest baseRequest:(FRTBaseRequest *)baseRequest;

@end

@interface FRTChainRequest : NSObject

/**
 * Chain start
 */
-(void)start;

/**
 * Chain cancel
 */
-(void)cancel;

/**
 *  添加Chain请求和Chain请求回调
 *
 *  @param baseRequest Chain 请求
 *  @param callBack    Chain 回调
 */
-(void)setRequest:(FRTBaseRequest *)baseRequest callBack:(ChainCallBack)callBack;

/**
 * Chain请求回调
 */
@property (nonatomic,copy) ChainCallBack chainCallBack;

/**
 *  Chain delegate
 */
@property (nonatomic,weak) id<FRTChainRequestDeleate> delegate;

@end
