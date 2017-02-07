//
//  SearchProtocol.h
//  FROSTPlatform
//
//  Created by frost on 17/1/6.
//  Copyright © 2017年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SearchManagerProtocol <NSObject>

@required

-(void)overrideSearchAction;

@optional

-(void)splitWordsForSearch;

-(void)sortingResuiltsAction;

-(void)protocolForSon;

@end
