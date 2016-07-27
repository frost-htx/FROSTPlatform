//
//  EditViewControllerManager.m
//  FROSTPlatform
//
//  Created by frost on 16/7/27.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "EditViewControllerManager.h"

@interface EditViewControllerManager ()

/**
 *  当前的EditModel
 */
@property (nonatomic,strong) EditModel *currentEditModel;

@end

@implementation EditViewControllerManager

#pragma mark Create A Single

+(EditViewControllerManager *)shareManager {
    static EditViewControllerManager *shareManager = nil;
    static dispatch_once_t editManager;
    dispatch_once(&editManager, ^{
        shareManager = [[self alloc] init];
    });
    return shareManager;
}

#pragma mark Private Methods

-(void)setCurrentEditModel:(EditModel *)editModel {
    self.currentEditModel = editModel;
}

@end
