//
//  DMPhotoPreviewViewController.m
//  FROSTPlatform
//
//  Created by huya on 2019/12/3.
//  Copyright © 2019 frost. All rights reserved.
//

#import "DMPhotoPreviewViewController.h"
#import "DMPhotoPreCollectionViewCell.h"

@interface DMPhotoPreviewViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) UICollectionView *photoCollectionView;

@property (nonatomic,strong) UICollectionViewFlowLayout *layout;

@property (nonatomic,strong) NSMutableArray *photoArray;

@property (nonatomic,strong) UIView   *naviBar;
@property (nonatomic,strong) UIView   *backButton;
@end

@implementation DMPhotoPreviewViewController

#pragma mark - life cycle

-(instancetype)initWithPhotoArray:(NSArray *)photoArray {
    if (self = [super init]) {
        self.photoArray = [NSMutableArray arrayWithArray:photoArray];
    }
    return self;
}

- (void)viewDidLoad {
    
    UIImage *image1 = [UIImage imageNamed:@"photoTest1.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"photoTest2.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"photoTest3.jpg"];

    self.photoArray = [NSMutableArray arrayWithObjects:image1,image2,image3,nil];
    
    [super viewDidLoad];
    [self.view addSubview:self.photoCollectionView];
    [self.view addSubview:self.naviBar];

}

#pragma mark - View Layout

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.layout.itemSize = CGSizeMake(self.view.frame.size.width + 20, self.view.frame.size.height);
    self.layout.minimumInteritemSpacing = 0;
    self.layout.minimumLineSpacing = 0;
    self.photoCollectionView.frame = CGRectMake(-10, 0, self.view.frame.size.width + 20, self.view.size.height);
    [self.photoCollectionView setCollectionViewLayout:self.layout];
    
    CGFloat naviBarHeight = [self statusBarHeight] +44;
    CGFloat statusBarHeight = [self statusBarHeight];
    self.naviBar.frame = CGRectMake(0, 0, self.view.size.width, naviBarHeight);
    self.backButton.frame = CGRectMake(10, statusBarHeight, 44, 44);

}
#pragma mark - Touch Event

-(void)backButtonClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionViewDataSource && Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photoArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DMPhotoPreCollectionViewCell *cell;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DMPhotoPreCollectionViewCell" forIndexPath:indexPath];
    [cell setImgaeData:self.photoArray[indexPath.row]];
    
    __weak typeof(self) weakSelf = self;

    [cell setSingleTapGestureBlock:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf didTapPreviewCell];
    }];

    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[DMPhotoPreCollectionViewCell class]]) {
        [(DMPhotoPreCollectionViewCell *)cell recoverSubviews];
    }
}

#pragma mark - Private Methods

- (BOOL)isIPhoneX {
    return (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375, 812)) ||
            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(812, 375)) ||
            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(414, 896)) ||
            CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(896, 414)));
}

- (CGFloat)statusBarHeight {
    return [self isIPhoneX] ? 44 : 20;
}

-(void)didTapPreviewCell{
    self.self.naviBar.hidden = !self.naviBar.hidden;
}

#pragma mark - getters and setters

-(UICollectionView *)photoCollectionView {
    if (!_photoCollectionView) {
        self.layout = [[UICollectionViewFlowLayout alloc] init];
        self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _photoCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _photoCollectionView.backgroundColor = [UIColor blackColor];
        _photoCollectionView.dataSource = self;
        _photoCollectionView.delegate = self;
        _photoCollectionView.pagingEnabled = YES;
        _photoCollectionView.scrollsToTop = NO;
        _photoCollectionView.showsHorizontalScrollIndicator = NO;
        _photoCollectionView.contentOffset = CGPointMake(0, 0);
        _photoCollectionView.contentSize = CGSizeMake(self.photoArray.count * (self.view.size.width + 20), 0);
        [_photoCollectionView registerClass:[DMPhotoPreCollectionViewCell class] forCellWithReuseIdentifier:@"DMPhotoPreCollectionViewCell"];
//        [_collectionView registerClass:[TZGifPreviewCell class] forCellWithReuseIdentifier:@"TZGifPreviewCell"];
    }
    return _photoCollectionView;
}

-(UIView *)naviBar {
    if (!_naviBar) {
        _naviBar = [[UIView alloc] initWithFrame:CGRectZero];
        _naviBar.backgroundColor = [UIColor colorWithRed:(34/255.0) green:(34/255.0)  blue:(34/255.0) alpha:0.7];

        UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectZero];
//        [backButton setImage:[UIImage imageNamed:@"navi_back"] forState:UIControlStateNormal];
        backButton.backgroundColor = [UIColor redColor];
        [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
        self.backButton = backButton;
        [_naviBar addSubview:backButton];
    }
    return _naviBar;
}

@end
