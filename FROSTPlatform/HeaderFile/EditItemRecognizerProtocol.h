//
//  EditItemRecognizerProtocol.h
//  FROSTPlatform
//
//  Created by frost on 16/7/27.
//  Copyright © 2016年 frost. All rights reserved.
//

#ifndef EditItemRecognizerProtocol_h
#define EditItemRecognizerProtocol_h

@protocol EditItemRecognizerProtocol <NSObject>

/**
 *  是否被选择
 */
@property (nonatomic,assign) BOOL isSelect;

/**
 *  点击事件
 */
-(void)tapRecognizerAction;

@end

#endif /* EditItemRecognizerProtocol_h */
