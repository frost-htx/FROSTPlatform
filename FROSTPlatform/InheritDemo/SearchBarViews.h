//
//  SearchBarViews.h
//  FROSTPlatform
//
//  Created by frost on 17/1/9.
//  Copyright © 2017年 frost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchLogic.h"

@protocol SearchBarViewsDelegate <NSObject>

-(NSArray *)didSearchAction;

@end

@interface SearchBarViews : UIView

@property (nonatomic,weak) id <SearchBarViewsDelegate> delegate;

-(instancetype)initWithFrame:(CGRect)frame withLogic:(id <SearchProtocol>)logic;

@end
