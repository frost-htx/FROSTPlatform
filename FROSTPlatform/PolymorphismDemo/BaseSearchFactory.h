//
//  BaseSearchFactory.h
//  FROSTPlatform
//
//  Created by frost on 17/1/6.
//  Copyright © 2017年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchManagerProtocol.h"

@class ChildrenSearchFactory;

@interface BaseSearchFactory : NSObject

@property (nonatomic,weak) id childrenSearch;

-(void)searchAction;

@end
