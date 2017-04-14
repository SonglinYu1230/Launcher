//
//  ViewController.m
//  Launcher
//
//  Created by why001 on 13/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "ViewController.h"
#import "AppCollectionViewCell.h"
#import "AppModel.h"
#import "AppController.h"
#import "Constant.h"

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
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestureRecognizer:)];
    [self.collectionView addGestureRecognizer:lpgr];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleDoubleTapOnHomeButton) name:kDoubleTapOnHomeButton object:nil];
    
    // test
//    NSString *pointerString = [NSString stringWithFormat:@"%p", self];
//    NSObject *object;
//    sscanf([pointerString cStringUsingEncoding:NSUTF8StringEncoding], "%p", &object);
//    NSLog(@"------------------------end---------------------------");
//    NSLog(@"%@", object);
//    NSLog(@"%@", self);
//    NSLog(@"------------------------end---------------------------");
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _appNames.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AppCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.model = [self appModleAtIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath {
   
}

#pragma mark - UICollectionViewDelegate Methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self presentViewController:[[AppController alloc] initWithAppModel:[self appModleAtIndexPath:indexPath]] animated:YES completion:nil];
}

#pragma mark - private method

- (AppModel *)appModleAtIndexPath:(NSIndexPath *)indexPath {
    return [AppModel modelWithName:_appNames[indexPath.item] icon:[UIImage imageNamed:_appIcons[indexPath.item]]];
}

#pragma mark - gesture response

- (void)handleLongPressGestureRecognizer:(UILongPressGestureRecognizer *)gestureRecognizer {
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan: {
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[gestureRecognizer locationInView:self.collectionView]];
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        }
            
            break;
        case UIGestureRecognizerStateChanged:
            [self.collectionView updateInteractiveMovementTargetPosition:[gestureRecognizer locationInView:self.collectionView]];
            break;
        case UIGestureRecognizerStateEnded:
            [self.collectionView endInteractiveMovement];
            break;
        default:
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}

- (void)handleDoubleTapOnHomeButton {
    
}

@end
