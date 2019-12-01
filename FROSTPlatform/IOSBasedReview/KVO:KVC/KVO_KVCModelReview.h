//
//  KVO_KVCModelReview.h
//  FROSTPlatform
//
//  Created by frost on 2019/11/4.
//  Copyright © 2019 frost. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KVO_KVCModelReview : NSObject

@property (nonatomic) double lComponent;
@property (nonatomic) double aComponent;
@property (nonatomic) double bComponent;

@property (nonatomic, readonly) double redComponent;
@property (nonatomic, readonly) double greenComponent;
@property (nonatomic, readonly) double blueComponent;

@property (nonatomic, strong, readonly) UIColor *color;

@end

NS_ASSUME_NONNULL_END
