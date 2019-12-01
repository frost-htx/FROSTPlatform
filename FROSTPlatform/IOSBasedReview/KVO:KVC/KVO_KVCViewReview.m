//
//  KVO_KVCViewReview.m
//  FROSTPlatform
//
//  Created by frost on 2019/11/4.
//  Copyright © 2019 frost. All rights reserved.
//

#import "KVO_KVCViewReview.h"

@interface KVO_KVCViewReview ()

@end

@implementation KVO_KVCViewReview

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.lSlider];
        [self addSubview:self.aSlider];
        [self addSubview:self.bSlider];
        [self addSubview:self.colorView];
    }
    return self;
}


-(void)sliderValueChangeAction:(UISlider *)slider {
    if (_delegate) {
        [_delegate sliderButtonAction:slider];
    }
}

-(UISlider *)lSlider {
    if (!_lSlider) {
        _lSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 100, 100, 20)];
        _lSlider.tag = 101;
        [_lSlider addTarget:self action:@selector(sliderValueChangeAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _lSlider;
}

-(UISlider *)aSlider {
    if (!_aSlider) {
        _aSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_lSlider.frame)+30, 100, 20)];
        _aSlider.tag = 102;
        [_aSlider addTarget:self action:@selector(sliderValueChangeAction:) forControlEvents:UIControlEventValueChanged];

    }
    return _aSlider;
}

-(UISlider *)bSlider {
    if (!_bSlider) {
        _bSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_aSlider.frame)+30, 100, 20)];
        _bSlider.tag = 103;
        [_bSlider addTarget:self action:@selector(sliderValueChangeAction:) forControlEvents:UIControlEventValueChanged];

    }
    return _bSlider;
}

-(UIView *)colorView {
    if (!_colorView) {
        _colorView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_bSlider.frame)+30, 200, 200)];
    }
    return _colorView;
}

@end
