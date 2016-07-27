//
//  EditRootItemView.m
//  FROSTPlatform
//
//  Created by frost on 16/7/19.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "EditRootItemView.h"

@implementation EditRootItemView
@synthesize isSelect = _isSelect;

#pragma mark life cycle

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.zoomSize = 0.4;
        
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognizerAction)];
        [self addGestureRecognizer:tapRecognizer];
    }
    return self;
}

#pragma mark BindViewWithModelProtocol 

-(void)bindViewModel:(RootModel *)viewMode {

}

#pragma mark TapRecognizerProtocol

-(void)tapRecognizerAction {
    [self drawBorderEdge];
}

#pragma mark Private methods

-(CGRect)transformCoordinate:(CGRect)frame {
    frame.origin.x = frame.origin.x * self.zoomSize;
    frame.origin.y = frame.origin.y * self.zoomSize;
    frame.size.width = frame.size.width * self.zoomSize;
    frame.size.height = frame.size.height *self.zoomSize;
    return frame;
}

-(void)drawBorderEdge {
    self.layer.borderColor = [UIColor yellowColor].CGColor;
    self.layer.borderWidth = 1;
}

@end
