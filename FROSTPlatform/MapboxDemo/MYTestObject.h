//
//  MYTestObject.h
//  FROSTPlatform
//
//  Created by frost on 2018/9/15.
//  Copyright © 2018年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MYTestObjectProtocl <NSObject>

@property (nonatomic,copy) NSString *name;

@end

@interface MYTestObject : NSObject<MYTestObjectProtocl>

@end
