//
//  main.m
//  FROSTPlatform
//
//  Created by frost on 16/7/17.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#if DEBUG
#import <FBAllocationTracker/FBAllocationTrackerManager.h>
#endif

int main(int argc, char * argv[]) {
    @autoreleasepool {
#if DEBUG
        [[FBAllocationTrackerManager sharedManager] startTrackingAllocations];
        [[FBAllocationTrackerManager sharedManager] enableGenerations];
        LoggerStart(LoggerGetDefaultLogger());
#endif
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
