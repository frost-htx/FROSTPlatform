//
//  ChildrenSearchFactory.m
//  FROSTPlatform
//
//  Created by frost on 17/1/6.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "ChildrenSearchFactory.h"

@implementation ChildrenSearchFactory

#pragma mark - life cycle

-(instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

-(void)dealloc {
    NSLog(@"[ChildrenSearchFactory dealloc]");
}

#pragma mark SearchManagerProtocol - @required

-(void)overrideSearchAction {
    NSLog(@"[ChildrenSearchFactory overrideSearchAction]");
}

#pragma mark SearchManagerProtocol - @optional

-(void)splitWordsForSearch {
    NSLog(@"[ChildrenSearchFactory splitWordsForSearch]");
}

-(void)sortingResuiltsAction {
    NSLog(@"[ChildrenSearchFactory sortingResuiltsAction]");
}
@end
