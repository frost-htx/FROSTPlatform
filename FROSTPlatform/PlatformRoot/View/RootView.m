//
//  RootView.m
//  FROSTPlatform
//
//  Created by frost on 16/7/18.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "RootView.h"

@implementation RootView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    return view;
}


@end
