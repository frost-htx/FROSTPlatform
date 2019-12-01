//
//  PhotoSelectSildeView.h
//  FROSTPlatform
//
//  Created by frost on 2019/12/1.
//  Copyright © 2019 frost. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PhotoDidSelectCallBack <NSObject>

@required

-(void)photoNameDidSelectCallBack:(NSString *)photoAlbumName;

-(void)touchHiddenSildeView;


@end

@interface PhotoSelectSildeView : UIView

@property (nonatomic,weak) id<PhotoDidSelectCallBack> delegate;

-(instancetype)initWithFrame:(CGRect)frame withDataSoure:(NSArray *)array;

-(void)showSildeView;

-(void)hiddenSildeView;

@end

NS_ASSUME_NONNULL_END
