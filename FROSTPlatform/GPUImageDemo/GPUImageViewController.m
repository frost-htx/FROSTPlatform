//
//  GPUImageViewController.m
//  FROSTPlatform
//
//  Created by frost on 2018/7/3.
//  Copyright © 2018年 frost. All rights reserved.
//

#import "GPUImageViewController.h"
#import <GPUImage/GPUImage.h>
#import "GPUImageDemoView.h"

@interface GPUImageViewController ()

@property (nonatomic,strong) UIImageView *mImageView;

@end

@implementation GPUImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    GPUImageDemoView *imagView = [[GPUImageDemoView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 400)];
    imagView.backgroundColor = [UIColor redColor];
    imagView.clipsToBounds = YES;
    
    CATransform3D rotate = CATransform3DMakeRotation(M_PI/3, 1, 0, 0);
    CGFloat disZ = 300;
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f/disZ;
    CATransform3D transform = CATransform3DConcat(rotate, scale);
    
    imagView.layer.transform = rotate;
    
    [self.view addSubview:imagView];
    
    

    
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    [self.view addSubview:imageView];
//    self.mImageView = imageView;
//    [self onCustom];
}

-(void)onCustom {
    GPUImageFilter *filter = [[GPUImageSepiaFilter alloc] init];
    UIImage *image = [UIImage imageNamed:@"wood.jpg"];
    if (image) {
        self.mImageView.image = [filter imageByFilteringImage:image];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
