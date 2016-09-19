//
//  DemoViewModel.h
//  FROSTPlatform
//
//  Created by frost on 16/9/14.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DemoViewModel : NSObject


-(void)demoRequestAPI_ReadRequestCache:(void(^)())cacheData requestSuccessful:(void(^)())successful requestFailure:(void(^)())failure;

-(void)demoRequestAPI_chainRequest:(void(^)())successful requestFailure:(void(^)())failure;

@end
