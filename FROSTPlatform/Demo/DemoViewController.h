//
//  DemoViewController.h
//  FROSTPlatform
//
//  Created by frost on 16/8/16.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "RootViewController.h"

typedef void (^BlockA)(BOOL success);

@protocol DemoViewControllerDelegate <NSObject>

-(void)test;

@end

@interface DemoViewController : RootViewController

@property (nonatomic,strong) id<DemoViewControllerDelegate> delegate;

@property (nonatomic,strong) NSArray *array1;

@property (nonatomic,copy) BlockA blocka;

@end
