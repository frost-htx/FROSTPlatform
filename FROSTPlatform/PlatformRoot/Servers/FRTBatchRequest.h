//
//  FRTBatchRequest.h
//  FROSTPlatform
//
//  Created by frost on 16/9/12.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRTBaseRequest.h"

@class FRTBatchRequest;
typedef void(^FRTBatchRequestCompletionBlock)(__kindof FRTBatchRequest *batchRequest);

@interface FRTBatchRequest : NSObject

/**
 *  批量请求成功
 */
@property (nonatomic,copy) FRTBatchRequestCompletionBlock successCompletionBlock;

/**
 *  批量请求失败
 */
@property (nonatomic,copy) FRTBatchRequestCompletionBlock failureCompletionBlock;

/**
 *  失败的请求
 */
@property (nonatomic,strong) FRTBaseRequest *failedRequest;

/**
 *  初始化批量请求
 *
 *  @param requests 请求数组
 *
 *  @return 批量请求
 */
-(instancetype)initWithBatchArray:(NSArray *)requests;

/**
 *  开始批量请求
 *
 *  @param success 批量请求成功
 *  @param failure 批量请求失败
 */
-(void)startWithCompletionBlockWithSuccess:(FRTBatchRequestCompletionBlock)success
                                   failure:(FRTBatchRequestCompletionBlock)failure;

/**
 *  取消请求
 */
-(void)cancel;
@end
