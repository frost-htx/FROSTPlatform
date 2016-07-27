//
//  EditItemImageView.m
//  FROSTPlatform
//
//  Created by frost on 16/7/19.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "EditItemImageView.h"

@implementation EditItemImageView

#pragma mark life cycle

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.editImageView];
    }
    return self;
}

#pragma mark BindViewWithModelProtocol

-(void)bindViewModel:(RootModel *)viewModel {
    WS(weakSelf, self);
    
    ContentModel *contentModel = (ContentModel *)viewModel;
    CGRect frame = CGRectMake([contentModel.left floatValue], [contentModel.top floatValue],[contentModel.w floatValue], [contentModel.h floatValue]);
    CGRect imageFrame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
    self.frame = [self transformCoordinate:frame];
    self.editImageView.frame = [self transformCoordinate:imageFrame];
    [RACObserve(contentModel, picid) subscribeNext:^(NSString * picid) {
        [weakSelf.editImageView setImageWithURL:[NSURL URLWithString:ImageServerPath(picid)] placeholder:nil];
    }];
}

#pragma mark EditItemRecognizerProtocol

-(void)tapRecognizerAction {
    self.isSelect = YES;
    [super tapRecognizerAction];
}

#pragma mark gettes and setters

-(UIImageView *)editImageView {
    if (!_editImageView) {
        _editImageView = [[UIImageView alloc] init];
        _editImageView.contentMode = UIViewContentModeScaleAspectFit;
        _editImageView.clipsToBounds = YES;
        _editImageView.userInteractionEnabled = YES;
    }
    return _editImageView;
}

@end
