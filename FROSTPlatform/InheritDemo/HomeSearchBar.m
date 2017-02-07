//
//  HomeSearchBar.m
//  FROSTPlatform
//
//  Created by frost on 17/1/9.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "HomeSearchBar.h"
#import "SearchBarViews.h"

@interface HomeSearchBar ()<SearchBarViewsDelegate>

@property (nonatomic,strong)SearchBarViews *searBarView;

@end

@implementation HomeSearchBar

#pragma mark - life cycle

-(instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self addSubview:self.searBarView];
    }
    return self;
}

#pragma mark - SearchBarViewsDelegate

-(NSArray *)didSearchAction {
    return nil;
}

#pragma mark - getters and setters

-(SearchBarViews *)searBarView {
    if (!_searBarView) {
        SearchLogic *logic = [[SearchLogic alloc] initWithStyle:SearchStyle_home];
        _searBarView = [[SearchBarViews alloc] initWithFrame:self.frame withLogic:logic];
        _searBarView.delegate = self;
    }
    return _searBarView;
}

@end
