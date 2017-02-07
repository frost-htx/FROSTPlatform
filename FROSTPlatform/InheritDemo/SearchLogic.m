//
//  SearchLogic.m
//  FROSTPlatform
//
//  Created by frost on 17/1/9.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "SearchLogic.h"

@interface SearchLogic ()

@property (nonatomic,assign) SearchStyle searchStyle;

@end

@implementation SearchLogic

#pragma mark - life cycyle

-(instancetype)initWithStyle:(SearchStyle)style {
    if (self = [super init]) {
        self.searchStyle = style;
    }
    return self;
}

#pragma mark - SearchProtocol

-(NSArray *)searchAction {
    if (self.searchStyle == SearchStyle_home) {
        return @[@"homeSearch"];
    } else if(self.searchStyle == SearchStyle_Page) {
        return @[@"pageSearch"];
    } else {
        return @[@"localSearch"];
    }
}

@end
