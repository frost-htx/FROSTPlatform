//
//  IOSBaseReviewViewController.m
//  FROSTPlatform
//
//  Created by frost on 2019/10/30.
//  Copyright © 2019 frost. All rights reserved.
//

#import "IOSBaseReviewViewController.h"
#import "Operation/CustomNSOperation.h"
#import "GCD/GCDReview.h"

@interface IOSBaseReviewViewController ()

@end

@implementation IOSBaseReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CustomNSOperation *customOperation = [[CustomNSOperation alloc] init];
//
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperation:customOperation];
//
//    [self performSelector:@selector(testPerformSelector:) withObject:customOperation afterDelay:2];
//
//    NSLog(@"11111111");
    
    GCDReview *gcdReview = [[GCDReview alloc] init];
    [gcdReview GCDReviewTest1];
    [gcdReview GCDReviewTest2];
    
}

-(void)testPerformSelector:(CustomNSOperation *)customNSOperation
{
    [customNSOperation cancel];
    NSLog(@"222222");

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
