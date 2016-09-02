//
//  FRTNetWorkAgent.h
//  FROSTPlatform
//
//  Created by frost on 16/9/2.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRTBaseRequest.h"

@interface FRTNetWorkAgent : NSObject

/**
 *  创建单例
 *
 *  @return FRTNetWorkAgent
 */
+(FRTNetWorkAgent *)sharedInstance;

/**
 *  添加请求
 *
 *  @param request FRTBaseRequest
 */
-(void)addRequest:(FRTBaseRequest *)request;

/**
 *  清除请求
 *
 *  @param request FRTBaseRequest
 */
-(void)cancelRequest:(FRTBaseRequest *)request;

@end
