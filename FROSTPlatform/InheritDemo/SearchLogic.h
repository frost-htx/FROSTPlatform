//
//  SearchLogic.h
//  FROSTPlatform
//
//  Created by frost on 17/1/9.
//  Copyright © 2017年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchProtocol.h"

@protocol SearchLogicDelegate <NSObject>

-(void)dataForPrompt;

@end

typedef NS_ENUM(NSInteger,SearchStyle) {
    SearchStyle_home = 0,
    SearchStyle_Page,
    SearchStyle_Local
};

@interface SearchLogic : NSObject<SearchProtocol>

@property (nonatomic,weak) id <SearchLogicDelegate> delegate;

-(instancetype)initWithStyle:(SearchStyle)style;

@end
