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

@interface EditRootItemView : UIView<BindViewWithModelProtocol>

@property (nonatomic, assign) CGFloat   zoomSize;

-(CGRect)transformCoordinate:(CGRect)frame;

@end
