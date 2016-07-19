//
//  RootViewModel.m
//  FROSTPlatform
//
//  Created by frost on 16/7/18.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "RootViewModel.h"

@implementation RootViewModel

-(NSDictionary *)readLocalJson:(NSString *)fileName fileType:(NSString *)fileType {
    NSString *strPath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
    NSString *parseJason = [[NSString alloc] initWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *dic = [JsonUtil jsonStringToObject:parseJason];
    return dic;
}

@end
