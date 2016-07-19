//
//  EditViewModel.h
//  FROSTPlatform
//
//  Created by frost on 16/7/18.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "RootViewModel.h"
#import "EditModel.h"

@interface EditViewModel : RootViewModel

@property (nonatomic, strong) NSMutableArray *editArray;
@property (nonatomic, strong) EditModel *editModel;

- (void)requestTemplateData:(void(^)())readCacheBlock withSuccessful:(void(^)())successful withFailed:(void (^)(void))failed;

@end
