//
//  SonSearchFactory.m
//  FROSTPlatform
//
//  Created by frost on 17/1/6.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "SonSearchFactory.h"

@implementation SonSearchFactory

#pragma mark SearchManagerProtocol - @required

-(void)overrideSearchAction {
    NSLog(@"[SonSearchFactory overrideSearchAction]");
}

#pragma mark SearchManagerProtocol - @optional

-(void)splitWordsForSearch {
    NSLog(@"[SonSearchFactory splitWordsForSearch]");
}

-(void)sortingResuiltsAction {
    NSLog(@"[SonSearchFactory sortingResuiltsAction]");
}

-(void)protocolForSon {
    NSLog(@"[SonSearchFactory protocolForSon]");
}

@end
