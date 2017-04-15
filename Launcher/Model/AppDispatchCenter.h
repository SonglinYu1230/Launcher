//
//  AppDispatchCenter.h
//  Launcher
//
//  Created by why001 on 14/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewcontrolelr, AppModel;
@interface AppDispatchCenter : NSObject

@property (nonatomic, strong) UIViewcontrolelr *topController;

+ (instancetype)sharedInstance;

- (void)openAppWithAppModel:(AppModel *)model;

- (void)destoryApp:(UIViewcontrolelr *)controller;

- (NSArray *)recentApps;

@end
