//
//  KVOHelp.m
//  FROSTPlatform
//
//  Created by frost on 2019/11/4.
//  Copyright © 2019 frost. All rights reserved.
//

#import "KVOHelp.h"

@interface KVOHelp ()

@property (nonatomic, weak) id          observedObject;
@property (nonatomic, copy) NSString*   keyPath;
@property (nonatomic, weak) id          target;
@property (nonatomic) SEL               selector;

@end

@implementation KVOHelp

- (id)initWithObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options;
{
    if (self = [super init]) {
        self.target = target;
        self.selector = selector;
        self.observedObject = object;
        self.keyPath = keyPath;
        [object addObserver:self forKeyPath:keyPath options:options context:nil];
    }
    return self;
}

#pragma mark - NSKeyValueObserving

- (void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context
{
   [self didChange:change];
}

- (void)didChange:(NSDictionary *)change;
{
    id strongTarget = self.target;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [strongTarget performSelector:self.selector withObject:change];
#pragma clang diagnostic pop
}

@end
