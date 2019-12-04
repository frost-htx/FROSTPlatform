//
//  DMPhotoPreCollectionViewCell.m
//  FROSTPlatform
//
//  Created by huya on 2019/12/3.
//  Copyright © 2019 frost. All rights reserved.
//

#import "DMPhotoPreCollectionViewCell.h"

@interface DMPhotoPreCollectionViewCell ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIImageView  *photoImageView;

@property (nonatomic,strong) UIScrollView *scalScrollView;

@end

@implementation DMPhotoPreCollectionViewCell

#pragma mark - life cycyle

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.scalScrollView];
        [self.scalScrollView addSubview:self.photoImageView];
        
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
        [self addGestureRecognizer:tap1];
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
        tap2.numberOfTapsRequired = 2;
        [tap1 requireGestureRecognizerToFail:tap2];
        [self addGestureRecognizer:tap2];
    }
    return self;
}

#pragma mark - View Layout

- (void)layoutSubviews {
    [super layoutSubviews];
    self.scalScrollView.frame = CGRectMake(10, 0, self.frame.size.width - 20, self.frame.size.height);
    [self recoverSubviews];
}

#pragma mark - Touch Event

- (void)singleTap:(UITapGestureRecognizer *)tap {
    if (self.singleTapGestureBlock) {
        self.singleTapGestureBlock();
    }
}

- (void)doubleTap:(UITapGestureRecognizer *)tap {
    if (self.scalScrollView.zoomScale > self.scalScrollView.minimumZoomScale) {
        self.scalScrollView.contentInset = UIEdgeInsetsZero;
        [self.scalScrollView setZoomScale:self.scalScrollView.minimumZoomScale animated:YES];
    } else {
        CGPoint touchPoint = [tap locationInView:self.photoImageView];
        CGFloat newZoomScale = self.scalScrollView.maximumZoomScale;
        CGFloat xsize = self.frame.size.width / newZoomScale;
        CGFloat ysize = self.frame.size.height / newZoomScale;
        [self.scalScrollView zoomToRect:CGRectMake(touchPoint.x - xsize/2, touchPoint.y - ysize/2, xsize, ysize) animated:YES];
    }
}

#pragma mark - Public Methods

-(void)setImgaeData:(UIImage *)photo
{
    self.photoImageView.image = photo;
}

-(void)recoverSubviews {
    
    [self.scalScrollView setZoomScale:self.scalScrollView.minimumZoomScale animated:NO];

    UIImage *photoImage = self.photoImageView.image;
    CGFloat height = photoImage.size.height / photoImage.size.width * self.frame.size.width;
    if (height < 1 || isnan(height)) height = self.frame.size.height;
    height = floor(height);
    self.photoImageView.frame = CGRectMake(0, 0, self.frame.size.width, height);
    self.photoImageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.photoImageView;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    scrollView.contentInset = UIEdgeInsetsZero;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self refreshImageContainerViewCenter];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
}

#pragma mark - Privite Methods

- (void)refreshImageContainerViewCenter {
    CGFloat offsetX = (_scalScrollView.frame.size.width > _scalScrollView.contentSize.width) ? ((_scalScrollView.frame.size.width - _scalScrollView.contentSize.width) * 0.5) : 0.0;
    CGFloat offsetY = (_scalScrollView.frame.size.height > _scalScrollView.contentSize.height) ? ((_scalScrollView.frame.size.height - _scalScrollView.contentSize.height) * 0.5) : 0.0;
    self.photoImageView.center = CGPointMake(_scalScrollView.contentSize.width * 0.5 + offsetX, _scalScrollView.contentSize.height * 0.5 + offsetY);
}

#pragma mark - getters and setters

-(UIScrollView *)scalScrollView {
    if (!_scalScrollView) {
        _scalScrollView = [[UIScrollView alloc] init];
        _scalScrollView.bouncesZoom = YES;
        _scalScrollView.maximumZoomScale = 2.5;
        _scalScrollView.minimumZoomScale = 1.0;
        _scalScrollView.multipleTouchEnabled = YES;
        _scalScrollView.delegate = self;
        _scalScrollView.scrollsToTop = NO;
        _scalScrollView.showsHorizontalScrollIndicator = NO;
        _scalScrollView.showsVerticalScrollIndicator = YES;
        _scalScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _scalScrollView.delaysContentTouches = NO;
        _scalScrollView.canCancelContentTouches = YES;
        _scalScrollView.alwaysBounceVertical = NO;
        if (@available(iOS 11, *)) {
            _scalScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _scalScrollView;
}

-(UIImageView *)photoImageView {
    if (!_photoImageView) {
        _photoImageView = [[UIImageView alloc] init];
        _photoImageView.userInteractionEnabled = YES;
        _photoImageView.backgroundColor = [UIColor blueColor];
       _photoImageView.contentMode = UIViewContentModeScaleAspectFill;
        _photoImageView.clipsToBounds = YES;
    }
    return _photoImageView;
}

@end
