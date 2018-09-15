//
//  GPUImageView.m
//  FROSTPlatform
//
//  Created by frost on 2018/7/13.
//  Copyright © 2018年 frost. All rights reserved.
//

#import "GPUImageDemoView.h"

@implementation GPUImageDemoView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:frame];
        image.image = [UIImage imageNamed:@"wood.jpg"];
//        image.centerX = (image.width+100)/2;
//        image.width = image.width+100;
        CATransform3D rotate = CATransform3DMakeRotation(M_PI/6, 1, 0, 0);
        CGFloat disZ = 500;
        CATransform3D scale = CATransform3DIdentity;
        scale.m34 = -1.0f/disZ;
        CATransform3D transform = CATransform3DConcat(rotate, scale);
        image.layer.transform = transform;
        
        [self addSubview:image];
    }
    return self;
}

//- (void)drawRect:(CGRect)rect {
//
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//
//}

@end
