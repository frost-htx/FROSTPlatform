//
//  GPUImageViewController.m
//  FROSTPlatform
//
//  Created by frost on 2018/7/3.
//  Copyright © 2018年 frost. All rights reserved.
//

#import "GPUImageViewController.h"
#import <GPUImage/GPUImage.h>

@interface GPUImageViewController ()

@property (nonatomic,strong) UIImageView *mImageView;

@end

@implementation GPUImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    self.mImageView = imageView;
    [self onCustom];
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
