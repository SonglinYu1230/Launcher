//
//  ViewController.h
//  Launcher
//
//  Created by why001 on 13/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppCollectionViewCell;
@interface ViewController : UICollectionViewController <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong, readonly) AppCollectionViewCell *selectedCell;

@end

