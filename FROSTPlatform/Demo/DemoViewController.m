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


- (void)loadData:(void (^)(BOOL success))finished;
@end

@implementation DemoViewController

#pragma mark life cycle

-(void)dealloc {
    
}

-(void)viewDidLoad {
    
    self.demoModel = [[DemoModel alloc] init];
//    LoggerView(1,@"DemoViewController 自带的view :%@,%d,%s",self.view,__LINE__,__FUNCTION__);
//    LogImageData(<#NSString *domain#>, 1, <#int width#>, <#int height#>, <#NSData *data#>)
//    LogMessageF_va(__FILE__, __LINE__, __FUNCTION__, @"???", 1, @"123",nil);
    
    [self loadData:^(BOOL success) {
//        LoggerModel(1,@"this DemoViewController model :%@",self.demoModel);
    }];
}

- (void)loadData:(void (^)(BOOL success))finished {
    self.blocka = finished;
    finished(YES);
}
@end
