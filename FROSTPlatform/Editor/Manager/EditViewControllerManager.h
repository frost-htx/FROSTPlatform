//
//  EditViewControllerManager.h
//  FROSTPlatform
//
//  Created by frost on 16/7/27.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EditRootItemView.h"
#import "EditModel.h"

@interface EditViewControllerManager : NSObject

/**
 *  创建EditManager单例
 *
 *  @return 单例
 */
+(EditViewControllerManager *)shareManager;

/**
 *  设置当前的EditModel
 *
 *  @param editModel
 */
-(void)setCurrentEditModel:(EditModel *)editModel;

@end
