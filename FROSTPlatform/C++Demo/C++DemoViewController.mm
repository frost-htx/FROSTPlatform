//
//  C++DemoViewController.m
//  FROSTPlatform
//
//  Created by frost on 17/6/1.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "C++DemoViewController.h"

#include "Sales_data.hpp"

@interface C__DemoViewController ()

@end

@implementation C__DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Sales::Sales_data data1("12");
    Sales::Sales_data data2("12");
    Sales::Sales_data data3;
    Sales::Sales_data data5(80);
    
    Sales::Sales_data data6(90);
    data5.combineFunction(data6);
    data5.combineFunction(static_cast<Sales::Sales_data>(data1));

    
    string no_book = "1123123";
    
    Sales::Sales_data data4 = no_book;
    
    data3.combineFunction(no_book);
    
    NODefault nodefual ("123");
    StructA structA(nodefual);
    
    
    AggregateClass ball = {0,"123"};
    
    NSString *path = [FileTools getAppDocuments_FilePath:@"123.txt"];
    
    std::string filePath = [path UTF8String];
    
    std::string writeStr = "天天好心情";
    
    FileOperationClass fileClass;
    fileClass.ReadTxTFile(filePath);
    fileClass.GetFileSize(filePath);
    fileClass.WriteFile(filePath,writeStr);
    
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
