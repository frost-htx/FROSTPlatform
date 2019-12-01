//
//  PhotoSelectSildeTableViewController.m
//  FROSTPlatform
//
//  Created by frost on 2019/12/1.
//  Copyright © 2019 frost. All rights reserved.
//

#import "PhotoSelectSildeTableViewController.h"
#import "PhotoSelectSildeView.h"

@interface PhotoSelectSildeTableViewController ()<PhotoDidSelectCallBack>

@property (nonatomic,strong) PhotoSelectSildeView *sildeView;
@property (nonatomic,strong) UIButton *selectButton;
@property (nonatomic,strong) UILabel  *imageLabel;

@end

@implementation PhotoSelectSildeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *array = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    
    self.sildeView = [[PhotoSelectSildeView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 0) withDataSoure:array];
    self.sildeView.delegate = self;
    
    [self.view addSubview:self.sildeView];
    [self.view addSubview:self.selectButton];

}

#pragma mark - PhotoDidSelectCallBack

-(void)photoNameDidSelectCallBack:(NSString *)photoAlbumName
{
    
}

-(void)touchHiddenSildeView
{
    [self selectButtonAction:_selectButton];
}

#pragma mark - UIEvent touch action

-(void)selectButtonAction:(UIButton *)button
{
    if (button.tag == 0) {
        [self.sildeView showSildeView];
        button.tag = 1;
    } else if (button.tag == 1){
        [self.sildeView hiddenSildeView];
        button.tag = 0;
    }
}

#pragma mark - setters and getters

- (UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectButton.backgroundColor = [UIColor grayColor];
        _selectButton.frame = CGRectMake(100, 500, 100, 100);
        [_selectButton addTarget:self action:@selector(selectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectButton;
}


@end
