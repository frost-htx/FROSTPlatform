//
//  FRTRequestError.h
//  FROSTPlatform
//
//  Created by frost on 16/9/2.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FRTRequestError : NSObject

/**
 *  请求返回错误
 */
@property (nonatomic,strong) NSError *error;

@end
