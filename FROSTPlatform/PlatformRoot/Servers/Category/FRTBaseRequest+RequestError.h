//
//  FRTBaseRequest+RequestError.h
//  FROSTPlatform
//
//  Created by frost on 16/9/20.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "FRTBaseRequest.h"

@interface FRTBaseRequest (RequestError)

/**
 *  请求错误
 */
@property (nonatomic,strong) NSError *requestError;

/**
 *  转化错误信息
 *
 *  @return 返回NSString
 */
-(NSString *)transformErrorInfo;

@end
