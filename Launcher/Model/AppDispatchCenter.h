//
//  AppDispatchCenter.h
//  Launcher
//
//  Created by why001 on 14/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewcontrolelr;
@interface AppDispatchCenter : NSObject

+ (instancetype)sharedInstance;

- (void)saveApp:(UIViewcontrolelr *)controller;

- (void)destoryApp:(UIViewcontrolelr *)controller;

- (NSArray *)recentApps;

@end
