//
//  SearchBarViews.m
//  FROSTPlatform
//
//  Created by frost on 17/1/9.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "SearchBarViews.h"

@interface SearchBarViews ()<UITextFieldDelegate,SearchLogicDelegate>

@property (nonatomic,strong) UITextField *textField;

@property (nonatomic,strong) SearchLogic *searchLogic;

@end

@implementation SearchBarViews

#pragma mark - life cycle

-(instancetype)initWithFrame:(CGRect)frame withLogic:(id <SearchProtocol>)logic {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.textField];
        self.searchLogic = logic;
        self.searchLogic.delegate = self;
    }
    return self;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSArray *resultArray = [self.searchLogic searchAction];
    return YES;
}

#pragma mark - SearchLogicDelegate 

-(void)dataForPrompt {

}

#pragma mark - getters and setters

-(UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:self.frame];
        _textField.delegate = self;
    }
    return _textField;
}

@end
