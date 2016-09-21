//
//  FRTBatchRequestAgent.h
//  FROSTPlatform
//
//  Created by frost on 16/9/20.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRTBatchRequest.h"

@interface FRTBatchRequestAgent : NSObject

/**
 *  创建单例
 *
 *  @return FRTBatchRequestAgent
 */
+(FRTBatchRequestAgent *)sharedInstance;

/**
 *  添加请求
 *
 *  @param request FRTBatchRequest
 */
-(void)addBatchRequest:(FRTBatchRequest *)request;

/**
 *  删除请求
 *
 *  @param request FRTBatchRequest
 */
-(void)removeBatchRequest:(FRTBatchRequest *)request;

@end
