//
//  EditViewControllerManager.m
//  FROSTPlatform
//
//  Created by frost on 16/7/27.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "EditViewControllerManager.h"
#import "EditItemImageView.h"
#import "TZImagePickerController.h"
#import "PhotoCuttingViewController.h"
#import <RSKImageCropper/RSKImageCropper.h>

@interface EditViewControllerManager ()<TZImagePickerControllerDelegate,RSKImageCropViewControllerDelegate,RSKImageCropViewControllerDataSource>

/**
 *  当前的EditModel
 */
@property (nonatomic,strong) EditModel *currentEditModel;

/**
 *  当前的EditItemView
 */
@property (nonatomic,strong) EditRootItemView *latestEditItemView;

/**
 *  上一个EditItemView
 */
@property (nonatomic,strong) EditRootItemView *previousEditItemView;

/**
 * 需要裁剪的图片大小
 */
@property (nonatomic,assign) CGSize cropImageSize;

/**
 *  设置当前点击的editview
 *
 *  @param editItemView
 */
-(void)setLatestEditItemView:(EditRootItemView *)editItemView;

@end

@implementation EditViewControllerManager

#pragma mark Create A Single

+(EditViewControllerManager *)shareManager {
    static EditViewControllerManager *shareManager = nil;
    static dispatch_once_t editManager;
    dispatch_once(&editManager, ^{
        shareManager = [[self alloc] init];
    });
    return shareManager;
}

#pragma mark life cycle

-(instancetype)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickOnTheEditItemAction:) name:Edit_ClickOnTheEditItemNotification object:nil];
    }
    return self;
}

#pragma mark NSNotificationObserve

-(void)clickOnTheEditItemAction:(NSNotification *)notification {
    EditRootItemView *editItemView = notification.object;
    [self setLatestEditItemView:editItemView];
    if ([editItemView isKindOfClass:[EditItemImageView class]]) {
        [self popToPhotoViewController:editItemView];
    }
}

#pragma mark TZImagePickerControllerDelegate 

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    
    UIImage *image = [photos firstObject];
    self.cropImageSize = image.size;
    RSKImageCropViewController  *imageCropViewController = [[RSKImageCropViewController alloc] initWithImage:image];
    imageCropViewController.dataSource = self;
    imageCropViewController.delegate = self;
    imageCropViewController.cropMode = RSKImageCropModeCustom;
    [[TheAppDelegate currentNavigation] pushViewController:imageCropViewController animated:YES];
}

#pragma mark RSKImageCropViewControllerDataSource

- (CGRect)imageCropViewControllerCustomMaskRect:(RSKImageCropViewController *)controller {
    return [self calculateCropingArea:CGSizeMake(self.cropImageSize.width/2, self.cropImageSize.height/2) displayImageSize:_latestEditItemView.bounds.size];
}

- (UIBezierPath *)imageCropViewControllerCustomMaskPath:(RSKImageCropViewController *)controller {
    return [UIBezierPath bezierPathWithRect:[self calculateCropingArea:CGSizeMake(self.cropImageSize.width/2, self.cropImageSize.height/2) displayImageSize:_latestEditItemView.bounds.size]];
}

#pragma mark RSKImageCropViewControllerDelegate

- (void)imageCropViewControllerDidCancelCrop:(RSKImageCropViewController *)controller {
    [controller.navigationController popViewControllerAnimated:YES];
}

- (void)imageCropViewController:(RSKImageCropViewController *)controller didCropImage:(UIImage *)croppedImage usingCropRect:(CGRect)cropRect {

}

- (void)imageCropViewController:(RSKImageCropViewController *)controller didCropImage:(UIImage *)croppedImage usingCropRect:(CGRect)cropRect rotationAngle:(CGFloat)rotationAngle {
    EditItemImageView *itemImageView = (EditItemImageView *)self.latestEditItemView;
    itemImageView.editImageView.image = croppedImage;
    [[TheAppDelegate currentNavigation] popViewControllerAnimated:YES];
}

#pragma mark Private Methods

-(void)setCurrentEditModel:(EditModel *)editModel {
    self.currentEditModel = editModel;
}

-(void)popToPhotoViewController:(EditRootItemView *)editModel {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    [[TheAppDelegate currentNavigation] presentViewController:imagePickerVc animated:YES completion:nil];
}

-(CGRect)calculateCropingArea:(CGSize)originImageSize displayImageSize:(CGSize)displayImageSize {
    if (originImageSize.width > originImageSize.height) {
        float zoomSize = originImageSize.height/displayImageSize.height;
        return CGRectMake((kSCREEN_WIDTH - displayImageSize.width * zoomSize)/2, (kScreenHeight - originImageSize.height)/2, displayImageSize.width*zoomSize, originImageSize.height);
    } else {
        float zoomSize = originImageSize.width/displayImageSize.width;
        return CGRectMake((kSCREEN_WIDTH - originImageSize.width)/2, (kScreenHeight - displayImageSize.height * zoomSize)/2, originImageSize.width, displayImageSize.height * zoomSize);
    }
}

#pragma mark getters and setters

-(void)setLatestEditItemView:(EditRootItemView *)latestEditItemView {
    if (_latestEditItemView != latestEditItemView) {
        if (_latestEditItemView) {
            [self setPreviousEditItemView:_latestEditItemView];
        }
        _latestEditItemView = latestEditItemView;
        _latestEditItemView.isSelect = YES;
    }
    
}

-(void)setPreviousEditItemView:(EditRootItemView *)previousEditItemView {
    _previousEditItemView = previousEditItemView;
    _previousEditItemView.isSelect = NO;
}

@end
