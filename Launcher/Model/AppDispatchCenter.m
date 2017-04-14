//
//  AppDispatchCenter.m
//  Launcher
//
//  Created by why001 on 14/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "AppDispatchCenter.h"

@implementation AppDispatchCenter

+ (instancetype)sharedInstance {
    static AppDispatchCenter *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [AppDispatchCenter new];
    });
    
    return _sharedInstance;
}

@end
