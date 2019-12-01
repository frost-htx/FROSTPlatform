//
//  PhotoSelectSildeView.m
//  FROSTPlatform
//
//  Created by frost on 2019/12/1.
//  Copyright © 2019 frost. All rights reserved.
//

#import "PhotoSelectSildeView.h"
#import "PhotoAlbumCell.h"

static float cellHeight = 80;

@interface PhotoSelectSildeView ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic,strong) UITableView *photoTable;
@property (nonatomic,strong) NSArray *photoArray;

@end

@implementation PhotoSelectSildeView

-(instancetype)initWithFrame:(CGRect)frame withDataSoure:(NSArray *)array {
    
    if (self = [super initWithFrame:frame]) {
        self.photoArray = [NSArray arrayWithArray:array];
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.7;
        [self addSubview:self.photoTable];
        
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tgrClick)];
        tapRecognizer.delegate = self;
        [self addGestureRecognizer:tapRecognizer];

    }
    
    return self;
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.photoArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *mainCell = @"PhotoAlbumCell";
    PhotoAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCell];
    if (cell == nil) {
        cell=[[PhotoAlbumCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:mainCell];
        cell.textLabel.text = self.photoArray[indexPath.row];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *titleName = [_photoArray objectAtIndex:indexPath.row];
    
    if (_delegate && [_delegate respondsToSelector:@selector(photoNameDidSelectCallBack:)]) {
        [_delegate  photoNameDidSelectCallBack:titleName];
    }

}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[PhotoSelectSildeView class]]) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - UITouch Event

-(void)tgrClick
{
    if (_delegate && [_delegate respondsToSelector:@selector(touchHiddenSildeView)]) {
        [_delegate touchHiddenSildeView];
    }
}

#pragma mark - Public Methods

-(void)showSildeView
{
    CGRect rect =  [UIScreen mainScreen].bounds;
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, rect.size.width,rect.size.height);
    
    [UIView animateWithDuration:0.2 animations:^{
        self.photoTable.frame =  CGRectMake(0, 0, rect.size.width,cellHeight * self.photoArray.count);
    }];
    
}

-(void)hiddenSildeView
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 0);

    [UIView animateWithDuration:0.2 animations:^{
        self.photoTable.frame =  CGRectMake(0, 0, self.frame.size.width, 0);
    }];
}

#pragma mark - getters and setters

-(UITableView *)photoTable {
    CGRect rect =  [UIScreen mainScreen].bounds;

    if (!_photoTable) {
        _photoTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, 0)];
        _photoTable.delegate = self;
        _photoTable.dataSource = self;
        _photoTable.backgroundColor = [UIColor grayColor];
        _photoTable.separatorStyle = UITableViewCellEditingStyleNone;
    }
    return _photoTable;
}

@end
