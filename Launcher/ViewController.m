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
    NSArray *names;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    names = @[@"WeChat", @"Email", @"Dictionary", @"Music", @"Gallery", @"Reddit", @"Google", @"Instagram", @"Pinterest", @"Calender", @"Twitter", @"Drive", @"Youtube"];
    
    [self.collectionView registerClass:[AppCollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
}

#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return names.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AppCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.name = names[indexPath.item];
    return cell;
}
@end
