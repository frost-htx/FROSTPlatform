//
//  EditItemImageView.m
//  FROSTPlatform
//
//  Created by frost on 16/7/19.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "EditItemImageView.h"

@implementation EditItemImageView

#pragma mark life cycle

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.editImageView];
    }
    return self;
}

#pragma mark gettes and setters

-(UIImageView *)editImageView {
    if (!_editImageView) {
        _editImageView = [[UIImageView alloc] init];
        _editImageView.userInteractionEnabled = YES;
    }
    return _editImageView;
}

@end
