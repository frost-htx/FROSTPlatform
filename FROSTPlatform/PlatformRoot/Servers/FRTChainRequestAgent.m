//
//  FRTChainRequestAgent.m
//  FROSTPlatform
//
//  Created by frost on 16/9/19.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "FRTChainRequestAgent.h"

@interface FRTChainRequestAgent ()

/**
 *  keeping chainRequest
 */
@property (nonatomic,strong) NSMutableArray *chainRequestArray;

@end

@implementation FRTChainRequestAgent

#pragma mark life cycle

+(FRTChainRequestAgent *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark Public Methods

-(void)addChainRequest:(FRTChainRequest *)request {
    @synchronized (self) {
        [self.chainRequestArray addObject:request];
    }
}

-(void)removeChainRequest:(FRTChainRequest *)request {
    @synchronized (self) {
        [self.chainRequestArray removeObject:request];
    }
}

#pragma mark Private Methods

-(NSMutableArray *)chainRequestArray {
    if (!_chainRequestArray) {
        _chainRequestArray = [NSMutableArray array];
    }
    return _chainRequestArray;
}

@end
