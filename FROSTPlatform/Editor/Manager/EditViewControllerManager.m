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

/**
 *  当前的EditItemView
 */
@property (nonatomic,strong) EditRootItemView *latestEditItemView;

/**
 *  上一个EditItemView
 */
@property (nonatomic,strong) EditRootItemView *previousEditItemView;

/**
 *  设置当前点击的editview
 *
 *  @param editItemView
 */
-(void)setLatestEditItemView:(EditRootItemView *)editItemView;

/**
 *  设置当前点击的editview
 *
 *  @param editItemView
 */
-(void)setLatestEditItemView:(EditRootItemView *)editItemView;

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

#pragma mark life cycle

-(instancetype)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickOnTheEditItemAction:) name:Edit_ClickOnTheEditItemNotification object:nil];
    }
    return self;
}

#pragma mark NSNotificationObserve

-(void)clickOnTheEditItemAction:(NSNotification *)notification {
    EditRootItemView *editItemView = notification.object;
    [self setLatestEditItemView:editItemView];
}

#pragma mark Private Methods

-(void)setCurrentEditModel:(EditModel *)editModel {
    self.currentEditModel = editModel;
}


#pragma mark getters and setters

-(void)setLatestEditItemView:(EditRootItemView *)latestEditItemView {
    if (_latestEditItemView != latestEditItemView) {
        if (_latestEditItemView) {
            [self setPreviousEditItemView:_latestEditItemView];
        }
        _latestEditItemView = latestEditItemView;
        _latestEditItemView.isSelect = YES;
    }
    
}

-(void)setPreviousEditItemView:(EditRootItemView *)previousEditItemView {
    _previousEditItemView = previousEditItemView;
    _previousEditItemView.isSelect = NO;
}

@end
