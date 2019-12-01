//
//  KVOHelp.h
//  FROSTPlatform
//
//  Created by frost on 2019/11/4.
//  Copyright © 2019 frost. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KVOHelp : NSObject

- (id)initWithObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options;

@end

NS_ASSUME_NONNULL_END
