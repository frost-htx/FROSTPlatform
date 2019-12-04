//
//  DMPhotoPreCollectionViewCell.h
//  FROSTPlatform
//
//  Created by huya on 2019/12/3.
//  Copyright © 2019 frost. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DMPhotoPreCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) void (^singleTapGestureBlock)(void);


-(void)setImgaeData:(UIImage *)photo;
-(void)recoverSubviews;


@end

NS_ASSUME_NONNULL_END
