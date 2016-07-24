//
//  BindCellDataProtocol.h
//  FROSTPlatform
//
//  Created by frost on 16/7/23.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "RootModel.h"

#ifndef BindCellDataProtocol_h
#define BindCellDataProtocol_h

@protocol BindViewWithModelProtocol <NSObject>

-(void)bindViewModel:(RootModel *)viewModel;

@end

#endif /* BindCellDataProtocol_h */
