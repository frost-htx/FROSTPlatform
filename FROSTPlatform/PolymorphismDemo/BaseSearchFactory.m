//
//  BaseSearchFactory.m
//  FROSTPlatform
//
//  Created by frost on 17/1/6.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "BaseSearchFactory.h"
#import "ChildrenSearchFactory.h"

@implementation BaseSearchFactory

-(instancetype)init {
    if (self = [super init]) {
        if ([self conformsToProtocol:@protocol(SearchManagerProtocol)]) {
            self.childrenSearch = self;
        } else {
            NSAssert(NO, @"children must conform SearchManangerProtocol");
        }
    }
    return self;
}

-(void)dealloc {
    NSLog(@"[BaseSearchFactory dealloc]");
}

#pragma mark - Public Methods

-(void)searchAction {
    
    NSLog(@"[BaseSearchFactory searchAction]");
    
    if ([self.childrenSearch respondsToSelector:@selector(splitWordsForSearch)]) {
        [self.childrenSearch splitWordsForSearch];
    }
    
    if ([self.childrenSearch respondsToSelector:@selector(overrideSearchAction)]) {
        [self.childrenSearch overrideSearchAction];
    }
    
    if ([self.childrenSearch respondsToSelector:@selector(sortingResuiltsAction)]) {
        [self.childrenSearch sortingResuiltsAction];
    }
    
    if ([self.childrenSearch respondsToSelector:@selector(protocolForSon)]) {
        [self.childrenSearch protocolForSon];
    }
}

@end
