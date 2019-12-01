//
//  KVO_KVCViewReview.h
//  FROSTPlatform
//
//  Created by frost on 2019/11/4.
//  Copyright © 2019 frost. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UISliderActionDelegate <NSObject>

-(void)sliderButtonAction:(UISlider *)slider;

@end

@interface KVO_KVCViewReview : UIView

@property (strong,nonatomic) UISlider   *lSlider;
@property (strong,nonatomic) UISlider   *aSlider;
@property (strong,nonatomic) UISlider   *bSlider;
@property (strong,nonatomic) UIView     *colorView;

@property (weak,nonatomic) id <UISliderActionDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
