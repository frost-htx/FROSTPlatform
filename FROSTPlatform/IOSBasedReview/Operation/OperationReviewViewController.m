//
//  OperationReviewViewController.m
//  FROSTPlatform
//
//  Created by frost on 2019/11/4.
//  Copyright © 2019 frost. All rights reserved.
//

#import "OperationReviewViewController.h"
#import "CustomNSOperation.h"

@interface OperationReviewViewController ()

@end

@implementation OperationReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   CustomNSOperation *customOperation = [[CustomNSOperation alloc] init];

    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:customOperation];

    [self performSelector:@selector(testPerformSelector:) withObject:customOperation afterDelay:2];

    NSLog(@"11111111");
}

-(void)testPerformSelector:(CustomNSOperation *)customNSOperation
{
    [customNSOperation cancel];
    NSLog(@"222222");

}

@end
