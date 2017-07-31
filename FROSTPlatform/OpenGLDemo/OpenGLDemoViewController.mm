//
//  OpenGLDemoViewController.m
//  FROSTPlatform
//
//  Created by frost on 17/5/8.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "OpenGLDemoViewController.h"
#import "OpenGLView.h"


@interface OpenGLDemoViewController ()

@property (nonatomic,strong) OpenGLView *openGLView;


@end

@implementation OpenGLDemoViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view = [[OpenGLView alloc] initWithFrame:self.view.bounds];

    
}

@end
