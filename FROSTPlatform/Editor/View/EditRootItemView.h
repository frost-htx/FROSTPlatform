//
//  EditRootItemView.h
//  FROSTPlatform
//
//  Created by frost on 16/7/19.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BindViewWithModelProtocol.h"
#import "EditModel.h"
#import "EditItemRecognizerProtocol.h"

@interface EditRootItemView : UIView<BindViewWithModelProtocol,EditItemRecognizerProtocol>

/**
 *  缩放比例
 */
@property (nonatomic, assign) CGFloat   zoomSize;

/**
 *  坐标转换
 *
 *  @param frame 转换前的坐标
 *
 *  @return 转换后的坐标
 */
-(CGRect)transformCoordinate:(CGRect)frame;

@end
