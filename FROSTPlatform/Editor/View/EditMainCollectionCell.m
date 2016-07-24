//
//  EditMainCollectionCell.m
//  FROSTPlatform
//
//  Created by frost on 16/7/18.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "EditMainCollectionCell.h"
#import "EditModel.h"

@implementation EditMainCollectionCell

#pragma mark lift cycle

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.backGroungView];
        
        WS(weakSelf, self);
        [_backGroungView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return self;
}

#pragma mark BindCellDataProtocol

-(void)bindViewModel:(RootModel *)viewModel {
    
    WS(weakSelf, self);
    PageModel *page = (PageModel *)viewModel;
    [RACObserve(page, bgpic) subscribeNext:^(NSString *url) {
        [weakSelf.backGroungView setImageWithURL:[NSURL URLWithString:url] placeholder:nil];
    }];
    
    for (ContentModel *contenModel in page.content) {
        [self loadItemViews:contenModel];
    }
}


#pragma mark Prvate Methods

-(void)loadItemViews:(ContentModel *)contenModel {
    if ([contenModel.type isEqualToString:@"pic"]) {
        EditItemImageView *itemImage = [[EditItemImageView alloc] init];
        [itemImage bindViewModel:contenModel];
        [self addSubview:itemImage];
    } else if([contenModel.type isEqualToString:@"ptext"]) {
        EditItemLabelView *itemLabel = [[EditItemLabelView alloc] init];
        [itemLabel bindViewModel:contenModel];
        [self addSubview:itemLabel];
    }
}

#pragma mark getters and setters

-(UIImageView *)backGroungView {
    if (!_backGroungView) {
        _backGroungView = [[UIImageView alloc] init];
        _backGroungView.backgroundColor = [UIColor grayColor];
        _backGroungView.userInteractionEnabled = YES;
    }
    return _backGroungView;
}

@end
