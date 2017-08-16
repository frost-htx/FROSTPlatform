//
//  AlgorithmViewController.m
//  FROSTPlatform
//
//  Created by frost on 17/8/13.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "AlgorithmViewController.h"
#import "SortingDemo.h"

@interface AlgorithmViewController ()

@end

@implementation AlgorithmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
//    selectionSortingAction();
    InsertionSortingAction();
    ShellSortingAction();
    
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
