//
//  DemoViewController.m
//  FROSTPlatform
//
//  Created by frost on 16/8/16.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "DemoViewController.h"
#import "DemoModel.h"

@interface DemoViewController ()
{
    id <DemoViewControllerDelegate> datasoure;
}

@property (nonatomic,strong) DemoModel *demoModel;

@property (nonatomic,strong) UITableView *tableView;


@end

@implementation DemoViewController

#pragma mark life cycle

-(void)dealloc {
    
}

-(void)viewDidLoad {
    
    [self loadData:^(BOOL success) {
        LoggerModel(1,@"this DemoViewController model :%@",self.demoModel);
    }];
}

- (void)loadData:(void (^)(BOOL success))finished {
    self.blocka = finished;
    finished(YES);
}
@end
