//
//  ViewController.m
//  Launcher
//
//  Created by why001 on 13/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "ViewController.h"
#import "AppCollectionViewCell.h"

static NSString *kCellIdentifier = @"Cell Identifier";

@interface ViewController ()

@end

@implementation ViewController {
    NSArray *_appNames;
    NSArray *_appIcons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _appNames = @[@"WeChat", @"Email", @"Dictionary", @"Music", @"dribble", @"Reddit", @"Google", @"Instagram", @"Pinterest", @"Calender", @"Twitter", @"Facebook", @"Youtube"];
    _appIcons = @[@"UMS_wechat_icon", @"UMS_email_icon", @"dictionary", @"music", @"dribble", @"reddit", @"google", @"UMS_instagram", @"UMS_pinterest_icon", @"calender", @"UMS_twitter_icon", @"facebook", @"youtube"];
    [self.collectionView registerClass:[AppCollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
}

#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _appNames.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AppCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.name = _appNames[indexPath.item];
    cell.image = [UIImage imageNamed:_appIcons[indexPath.item]];
    return cell;
}
@end
