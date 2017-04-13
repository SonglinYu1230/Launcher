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
    selectedBackgroundView.backgroundColor = [UIColor orangeColor];
    self.selectedBackgroundView = selectedBackgroundView;
    
    CGFloat redValue = (arc4random() % 255) / 255.0f;
    CGFloat blueValue = (arc4random() % 255) / 255.0f;
    CGFloat greenValue = (arc4random() % 255) / 255.0f;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imageView.backgroundColor = [UIColor blackColor];
    _imageView.layer.cornerRadius = 5.f;
    _imageView.backgroundColor = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f];
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

@end
