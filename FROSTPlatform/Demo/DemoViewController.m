//
//  DemoViewController.m
//  FROSTPlatform
//
//  Created by frost on 16/8/16.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "DemoViewController.h"
#import "DemoViewModel.h"
#import "ChildrenSearchFactory.h"

@interface DemoViewController ()
//{
//    
//    id <DemoViewControllerDelegate> datasoure;
//}

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) DemoViewModel *demoViewModel;

@property (nonatomic,strong) NSMutableString *s_Str;
@property (nonatomic,copy)   NSMutableString *c_Str;



@end

@implementation DemoViewController

#pragma mark life cycle

-(void)dealloc {
    self.delegate = nil;
}

-(void)viewDidLoad {
    
    ChildrenSearchFactory *search = [[ChildrenSearchFactory alloc] init];
    [search searchAction];
    
//    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(dispatch_get_global_queue(0,0), ^{
//        NSLog(@"1"); // 任务2
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"3"); // 任务3
//        });
//        NSLog(@"2"); // 任务4
//    });
    
//    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"1"); // 任务1
//    dispatch_async(queue, ^{
//        NSLog(@"2"); // 任务2
//        dispatch_sync(queue, ^{
//            NSLog(@"3"); // 任务3
//        });
//        NSLog(@"4"); // 任务4
//    });
//    NSLog(@"5"); // 任务5
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"1"); // 任务1
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"2"); // 任务2
//            
//        });
//        NSLog(@"3"); // 任务3
//    });
//    NSLog(@"4"); // 任务4
//    while (1) {
//    }
//    NSLog(@"5"); // 任务5
    
//    dispatch_sync(dispatch_get_global_queue(0,0),^{
//        NSLog(@"%@",[NSThread currentThread]);
//        NSLog(@"1");
//    });
//    NSLog(@"2");
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        dispatch_sync(dispatch_get_global_queue(0,0),^{
//            NSLog(@"%@",[NSThread currentThread]);
//            NSLog(@"3");
//        });
//        NSLog(@"%@",[NSThread currentThread]);
//        NSLog(@"1");
//        NSLog(@"1");

//    });
//    NSLog(@"2");

//    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);
//
//    NSLog(@"1"); // 任务1
//    dispatch_async(queue, ^{
//        NSLog(@"2"); // 任务2
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"3"); // 任务3
//        });
//        NSLog(@"4"); // 任务4
//    });
//    NSLog(@"5"); // 任务5

//    [self.demoViewModel demoRequestAPI_ReadRequestCache:^() {
//        
//    } requestSuccessful:^{
//        
//    } requestFailure:^{
//        
//    }];
//    [self.demoViewModel demoRequestAPI_chainRequest:^{
//        
//    } requestFailure:^{
//        
//    }];
//    
//    [self.demoViewModel demoRequestAPI_BatchRequest:^{
//        
//    } requestFailure:^{
//        
//    }];
    
    NSString *mut_str = @"123";
    NSLog(@"mut_str --------> %p",mut_str);
    self.s_Str = mut_str;
    NSLog(@"s_Str --------> %p",self.s_Str);
    self.c_Str = mut_str;
    NSLog(@"c_Str --------> %p",self.c_Str);
    
    mut_str = @"321";
    NSLog(@"mut_str --------> %p",mut_str);
    NSLog(@"s_Str --------> %p",self.s_Str);
    NSLog(@"c_Str --------> %p",self.c_Str);

    

}

#pragma mark Public Methods

- (void)loadData:(void (^)(BOOL success))finished {
//    self.blocka = finished;
//    finished(YES);
}

#pragma mark getters and setters 

-(DemoViewModel *)demoViewModel {
    if (!_demoViewModel) {
        _demoViewModel = [[DemoViewModel alloc] init];
    }
    return _demoViewModel;
}



@end
