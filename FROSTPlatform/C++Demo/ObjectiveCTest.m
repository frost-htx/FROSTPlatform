//
//  ObjectiveCTest.m
//  FROSTPlatform
//
//  Created by frost on 2019/10/29.
//  Copyright © 2019 frost. All rights reserved.
//

#import "ObjectiveCTest.h"

@implementation ObjectiveCTest

void dynamicMethodIMP111(id self, SEL _cmd) {
    NSLog(@" >> dynamicMethodIMP");
} 

-(void)test
{
    NSLog(@" >> test");

}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(missMessageTest)) {
        class_addMethod([self class], sel, class_getMethodImplementation(self,@selector(test)), "v@:");
        //        NSLog(@"%s %s %p",meth->sel,meth->types,meth->imp);
        //        class_addMethod(self, sel, meth->imp, meth->types);
        //表示有动态添加方法，这是规范，可以参考官方文档
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

+ (BOOL)resolveClassMethod:(SEL)name
{
    return YES;
}

@end
