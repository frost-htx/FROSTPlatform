//
//  GCDReview.m
//  FROSTPlatform
//
//  Created by frost on 2019/10/30.
//  Copyright © 2019 frost. All rights reserved.
//

#import "GCDReview.h"

@implementation GCDReview

-(void)GCDReviewTest1
{
    
    NSThread  *newThread= [[NSThread alloc] initWithBlock:^{
        
        NSLog(@"7");
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"8");
        });
        
        NSLog(@"9");
    }];
    [newThread start];
    
//    dispatch_queue_t queue = dispatch_queue_create("tk.bourne.testQueue",DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t queue = dispatch_queue_create("tk.bourne.testQueue",DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_async(queue, ^{ //DISPATCH_QUEUE_SERIAL死锁，DISPATCH_QUEUE_CONCURRENT正常执行
        NSLog(@"3"); // 任务3
    });

    
//    dispatch_async(queue, ^{
//        NSLog(@"2"); // 任务2
//        dispatch_sync(queue, ^{ //DISPATCH_QUEUE_SERIAL死锁，DISPATCH_QUEUE_CONCURRENT正常执行
//            NSLog(@"3"); // 任务3
//        });
//        NSLog(@"4"); // 任务4
//    });

    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"5"); //本次runloop结束以后调用，异步并一定会新开线程，只代表不阻塞当前线程，同步代表会阻塞当前线程
    });
    
    NSLog(@"6");
    
}

-(void)GCDReviewTest2
{
    if ([[NSThread currentThread] isMainThread]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"4");
        });
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"5");
        });
        
        [self performSelector:@selector(test2)];
        
        [self performSelector:@selector(test3) withObject:nil afterDelay:0];
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"6");
        });
        
        [self test1];
    }
}

-(void)GCDReviewTest3
{
    dispatch_queue_t queue = dispatch_queue_create("tk.bourne.testQueue",DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        NSLog(@"3"); // 任务3
    });


}

-(void)test1
{
    NSLog(@"1");
}

-(void)test2
{
    NSLog(@"2");
}

-(void)test3
{
    NSLog(@"3");
}



@end
