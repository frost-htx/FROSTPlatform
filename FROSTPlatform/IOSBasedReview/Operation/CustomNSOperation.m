//
//  CustomNSOperation.m
//  FROSTPlatform
//
//  Created by frost on 2019/10/30.
//  Copyright © 2019 frost. All rights reserved.
//

#import "CustomNSOperation.h"

@implementation CustomNSOperation

- (void)main
{
    for (int i = 0; i < 3; i ++) {
        if (self.cancelled) {
            return;
        }
        sleep(1);
        NSLog(@"%d",i);
    }
}

@end
