//
//  PhotoAlbumCell.m
//  FROSTPlatform
//
//  Created by frost on 2019/12/1.
//  Copyright © 2019 frost. All rights reserved.
//

#import "PhotoAlbumCell.h"

@interface PhotoAlbumCell ()

@property (nonatomic,strong) UIImageView *photoImage;
@property (nonatomic,strong) UILabel     *photoImageName;

@end

@implementation PhotoAlbumCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.backgroundColor = [UIColor whiteColor];    
    [self.contentView addSubview:self.photoImage];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.photoImage.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - getters and setters

-(UIImageView *)photoImage {
    if (!_photoImage) {
        _photoImage = [[UIImageView alloc] init];
        _photoImage.backgroundColor = [UIColor redColor];
    }
    return _photoImage;
}

@end
