//
//  FRTBatchRequestAgent.m
//  FROSTPlatform
//
//  Created by frost on 16/9/20.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "FRTBatchRequestAgent.h"

@interface FRTBatchRequestAgent ()

/**
 *  装载batchReques
 */
@property (nonatomic,strong) NSMutableArray *batchRequestArray;

@end

@implementation FRTBatchRequestAgent

#pragma mark life cycle

+(FRTBatchRequestAgent *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark Public Methods

-(void)addBatchRequest:(FRTBatchRequest *)request {
    @synchronized (self) {
        [self.batchRequestArray addObject:request];
    }
}

-(void)removeBatchRequest:(FRTBatchRequest *)request {
    @synchronized (self) {
        [self.batchRequestArray removeObject:request];
    }
}

#pragma mark getters and setters 

-(NSMutableArray *)batchRequestArray {
    if (!_batchRequestArray) {
        _batchRequestArray = [NSMutableArray array];
    }
    return _batchRequestArray;
}

@end
