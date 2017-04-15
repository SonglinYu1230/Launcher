//
//  AppController.h
//  Launcher
//
//  Created by why001 on 14/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppModel, AppCollectionViewCell;
@interface AppController : UIViewController

@property (nonatomic, strong) UIView *snapView;

- (instancetype)initWithAppModel:(AppModel *)model;

@end
