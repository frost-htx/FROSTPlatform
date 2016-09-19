//
//  FRTChainRequestAgent.h
//  FROSTPlatform
//
//  Created by frost on 16/9/19.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRTChainRequest.h"

@interface FRTChainRequestAgent : NSObject

/**
 *  创建单例
 *
 *  @return FRTChainRequestAgent
 */
+(FRTChainRequestAgent *)sharedInstance;


/**
 *  添加请求
 *
 *  @param request FRTChainRequest
 */
-(void)addChainRequest:(FRTChainRequest *)request;

/**
 *  删除请求
 *
 *  @param request FRTChainRequest
 */
-(void)removeChainRequest:(FRTChainRequest *)request;

@end
