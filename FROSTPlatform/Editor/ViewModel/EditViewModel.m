//
//  EditViewModel.m
//  FROSTPlatform
//
//  Created by frost on 16/7/18.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "EditViewModel.h"

@implementation EditViewModel


- (void)requestTemplateData:(void(^)())readCacheBlock withSuccessful:(void(^)())successful withFailed:(void (^)(void))failed {
    NSDictionary *dic = [self readLocalJson:@"Template" fileType:@"geojson"];
    
    NSError __autoreleasing *error;
    self.editModel = [[EditModel alloc] initWithDictionary:dic error:&error];
    readCacheBlock();
}

@end
