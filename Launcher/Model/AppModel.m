//
//  AppModel.m
//  Launcher
//
//  Created by why001 on 14/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "AppModel.h"

@interface AppModel ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) UIImage *icon;

@end

@implementation AppModel

+ (AppModel *)modelWithName:(NSString *)name icon:(UIImage *)icon {
    AppModel *model = [AppModel new];
    model.name = name;
    model.icon = icon;
    return model;
}

@end
