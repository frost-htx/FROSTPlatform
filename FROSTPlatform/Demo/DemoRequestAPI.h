//
//  DemoRequestAPI.h
//  FROSTPlatform
//
//  Created by frost on 16/9/14.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "FRTBaseRequest.h"

@interface DemoRequestAPI : FRTBaseRequest

-(instancetype)initWithCateId:(NSString *)cateid order:(NSString *)order pageNumber:(NSString *)pageNumber;

@end
