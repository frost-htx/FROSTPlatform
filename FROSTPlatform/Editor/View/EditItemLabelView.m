//
//  EditItemLabelView.m
//  FROSTPlatform
//
//  Created by frost on 16/7/19.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "EditItemLabelView.h"


@implementation EditItemLabelView

#pragma mark life cycle

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.editLabel];
    }
    return self;
}

#pragma mark BindViewWithModelProtocol

-(void)bindViewModel:(RootModel *)viewModel {
    
    WS(weakSelf, self);
    ContentModel *contentModel = (ContentModel *)viewModel;
    CGRect frame = CGRectMake([contentModel.left floatValue], [contentModel.top floatValue],[contentModel.w floatValue], [contentModel.h floatValue]);
    CGRect labelFrame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
    self.frame = [self transformCoordinate:frame];
    self.editLabel.frame = [self transformCoordinate:labelFrame];
    
    [RACObserve(contentModel, textalign) subscribeNext:^(NSString *textalign) {
        weakSelf.editLabel.textAlignment = [weakSelf transformStrToAlignment:textalign];
    }];
    
    [RACObserve(contentModel, ftsize) subscribeNext:^(NSString *ftsize) {
        weakSelf.editLabel.font = [UIFont systemFontOfSize:[weakSelf transformFontSize:[ftsize floatValue]]];
    }];
    
    [RACObserve(contentModel, con) subscribeNext:^(NSString *con) {
        weakSelf.editLabel.text = con;
    }];

}

#pragma mark Private Methods

-(NSTextAlignment)transformStrToAlignment:(NSString *)string {
    if ([string isEqualToString:@"left"]) {
        return NSTextAlignmentLeft;
    }
    else if ([string isEqualToString:@"center"]) {
        return NSTextAlignmentCenter;
    }
    else if ([string isEqualToString:@"right"]) {
        return NSTextAlignmentRight;
    } else {
        return NSTextAlignmentCenter;
    }
}

-(CGFloat)transformFontSize:(CGFloat)fontSize {
    return fontSize * self.zoomSize;
}

#pragma mark getters and setters

-(YYLabel *)editLabel {
    if (!_editLabel) {
        _editLabel = [[YYLabel alloc] init];
    }
    return _editLabel;
}
@end
