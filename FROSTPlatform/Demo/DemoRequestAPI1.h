//
//  DemoRequestAPI1.h
//  FROSTPlatform
//
//  Created by frost on 16/9/19.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "FRTBaseRequest.h"

@interface DemoRequestAPI1 : FRTBaseRequest

-(instancetype)initWithPlatform:(NSString *)platform version:(NSString *)version;

-(NSString *)url;

@end
