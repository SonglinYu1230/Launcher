//
//  AppCollectionViewCell.m
//  Launcher
//
//  Created by why001 on 13/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "AppCollectionViewCell.h"

@interface AppCollectionViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation AppCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    selectedBackgroundView.backgroundColor = [UIColor cyanColor];
    self.selectedBackgroundView = selectedBackgroundView;

    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imageView.backgroundColor = [UIColor grayColor];
    _imageView.layer.cornerRadius = 5.f;
    [self.contentView addSubview:_imageView];
    
    _nameLabel = [UILabel new];
    _nameLabel.font = [UIFont systemFontOfSize:13.f];
    [self.contentView addSubview:_nameLabel];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat padding = 5.f;
    CGFloat imageViewWH = CGRectGetWidth(self.frame) - 2 * padding;
    _imageView.frame = CGRectMake(padding, padding, imageViewWH, imageViewWH);
    
    [_nameLabel sizeToFit];
    CGSize size = _nameLabel.frame.size;
    _nameLabel.frame = CGRectMake((CGRectGetWidth(self.frame) - size.width)/2.f, CGRectGetHeight(self.frame) - size.height, size.width, size.height);
}

- (void)setName:(NSString *)name {
    _nameLabel.text = name;
}

- (void)setImage:(UIImage *)image {
    if (image) {
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.image = image;
    }
}

@end
