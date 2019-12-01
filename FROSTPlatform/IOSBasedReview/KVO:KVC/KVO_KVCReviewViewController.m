//
//  KVO_KVCReviewViewController.m
//  FROSTPlatform
//
//  Created by frost on 2019/11/4.
//  Copyright © 2019 frost. All rights reserved.
//

#import "KVO_KVCReviewViewController.h"
#import "KVO_KVCViewReview.h"
#import "KVO_KVCModelReview.h"
#import "KVOHelp.h"
@interface KVO_KVCReviewViewController ()<UISliderActionDelegate>

@property (strong,nonatomic) KVO_KVCModelReview *modelReview;

@property (strong,nonatomic) KVO_KVCViewReview *viewReview;

@property (strong,nonatomic) KVOHelp *kvoHelp;
@end

@implementation KVO_KVCReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.kvoHelp = [[KVOHelp alloc] initWithObject:self.modelReview keyPath:@"color" target:self selector:@selector(colorDidChange:) options:NSKeyValueObservingOptionInitial];
    [self.view addSubview:self.viewReview];

}


#pragma mark - UISliderActionDelegate

-(void)sliderButtonAction:(UISlider *)slider
{
    if (slider.tag == 101) {
        _modelReview.lComponent = slider.value;
    } else if(slider.tag == 102) {
        _modelReview.aComponent = slider.value;
    } else if (slider.tag == 103) {
        _modelReview.bComponent = slider.value;
    }
}

- (KVO_KVCViewReview *)viewReview {
    
    if (!_viewReview) {
        _viewReview = [[KVO_KVCViewReview alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _viewReview.delegate = self;
        _viewReview.lSlider.value = self.modelReview.lComponent;
        _viewReview.aSlider.value = self.modelReview.aComponent;
        _viewReview.bSlider.value = self.modelReview.bComponent;
    }
    return _viewReview;
}

- (KVO_KVCModelReview *)modelReview {
    
    if (!_modelReview) {
        _modelReview = [[KVO_KVCModelReview alloc] init];
        _modelReview.lComponent = 0.5;
        _modelReview.aComponent = 0.5;
        _modelReview.bComponent = 0.5;

    }
    return _modelReview;
}

-(void)colorDidChange:(NSDictionary *)change {
    _viewReview.colorView.backgroundColor = _modelReview.color;
}

@end
