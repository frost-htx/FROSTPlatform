//
//  EditMainViewController.m
//  FROSTPlatform
//
//  Created by frost on 16/7/17.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "EditMainViewController.h"
#import "EditMainCollectionCell.h"
#import "EditCollectionView.h"
#import "EditViewModel.h"

NSString * const KEditMainCollectionCellID = @"KEditMainCollectionCellID";
static CGFloat CellMargin = 60;
static CGFloat CellSpaing = 10;

@interface EditMainViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) EditCollectionView  *editCollectionView;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) EditViewModel *editViewModel;
@end

@implementation EditMainViewController

#pragma mark life cycle

-(void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.editCollectionView];
    [self requsetTemplateDate];
}

#pragma mark UIScrollViewDelegate

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
}

#pragma mark UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, CellMargin, 0, CellMargin);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return CellSpaing;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((kSCREEN_WIDTH - CellMargin*2), kSCREEN_HEIGHT_NO_NAV);
}

#pragma mark  UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EditMainCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KEditMainCollectionCellID forIndexPath:indexPath];
    return cell;
}

#pragma mark Event Response

- (void)handleSwipes:(UISwipeGestureRecognizer *)gesture {
    if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        if (_editCollectionView.contentOffset.x >= (kSCREEN_WIDTH-(CellMargin*2-CellSpaing)) *9) {
            [_editCollectionView setContentOffset:CGPointMake((kSCREEN_WIDTH-((CellMargin)*2-CellSpaing))*9,0) animated:YES];

        } else {
            self.currentIndex++;
            [_editCollectionView setContentOffset:CGPointMake((kSCREEN_WIDTH-((CellMargin)*2-CellSpaing))*self.currentIndex,0) animated:YES];
        }
    }
    
    if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        if (_editCollectionView.contentOffset.x <= 0) {
            [_editCollectionView setContentOffset:CGPointMake(0, 0) animated:YES];
        } else {
            self.currentIndex--;
            [_editCollectionView setContentOffset:CGPointMake((kSCREEN_WIDTH-(CellMargin*2-CellSpaing))*self.currentIndex,0) animated:YES];
            
        }
    }

}

#pragma mark private methods

-(void)requsetTemplateDate {
    [self.editViewModel requestTemplateData:^{
        
    } withSuccessful:^{
        
    } withFailed:^{
        
    }];
}

#pragma mark getters and setters 

-(UICollectionView *)editCollectionView {
    if (!_editCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _editCollectionView = [[EditCollectionView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kSCREEN_HEIGHT_NO_NAV) collectionViewLayout:flowLayout];
        _editCollectionView.backgroundColor = KCOLOR_BACKGROUNG;
        _editCollectionView.delegate = self;
        _editCollectionView.dataSource = self;
        _editCollectionView.scrollEnabled = NO;
        [_editCollectionView registerClass:[EditMainCollectionCell class] forCellWithReuseIdentifier:KEditMainCollectionCellID];
        UISwipeGestureRecognizer *leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
        UISwipeGestureRecognizer *rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
        
        leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
        rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
        [_editCollectionView addGestureRecognizer:leftSwipeGestureRecognizer];
        [_editCollectionView addGestureRecognizer:rightSwipeGestureRecognizer];
    }
    return _editCollectionView;
}

-(EditViewModel *)editViewModel {
    if (!_editViewModel) {
        _editViewModel = [[EditViewModel alloc] init];
    }
    return _editViewModel;
}
@end
