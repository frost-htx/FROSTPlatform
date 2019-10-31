//
//  C++DemoViewController.h
//  FROSTPlatform
//
//  Created by frost on 17/6/1.
//  Copyright © 2017年 frost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "ObjectiveCTest.h"

@interface MonthArray : NSArray

+ monthArray;
- (unsigned)count;
- (id)objectAtIndex:(unsigned)index;

@end

@interface C__DemoViewController : UIViewController

-(void)AlgorithmFourth;

@end
