//
//  EditMainCollectionCell.h
//  FROSTPlatform
//
//  Created by frost on 16/7/18.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditItemImageView.h"
#import "EditItemLabelView.h"
#import "BindViewWithModelProtocol.h"

@interface EditMainCollectionCell : UICollectionViewCell<BindViewWithModelProtocol>

@property (nonatomic, strong) UIImageView  *backGroungView;
@end
