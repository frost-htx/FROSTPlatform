//
//  GCDReviewViewController.m
//  FROSTPlatform
//
//  Created by frost on 2019/11/4.
//  Copyright © 2019 frost. All rights reserved.
//

#import "GCDReviewViewController.h"
#import "GCDReview.h"

@interface GCDReviewViewController ()

@end

@implementation GCDReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GCDReview *gcdReview = [[GCDReview alloc] init];
    [gcdReview GCDReviewTest1];
    [gcdReview GCDReviewTest2];
    [gcdReview GCDReviewTest3];

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
