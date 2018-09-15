//
//  MYTestObject+Category.m
//  FROSTPlatform
//
//  Created by frost on 2018/9/15.
//  Copyright © 2018年 frost. All rights reserved.
//

#import "MYTestObject+Category.h"

@implementation MYTestObject (Category)

static const char *key = "testName";


- (NSString *)testName
{
    return objc_getAssociatedObject(self, key);
}

- (void)setTestName:(NSString *)testName
{
    objc_setAssociatedObject(self, key, testName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
