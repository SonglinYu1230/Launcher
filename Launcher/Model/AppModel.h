//
//  AppModel.h
//  Launcher
//
//  Created by why001 on 14/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppModel : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, strong, readonly) UIImage *icon;

+ (AppModel *)modelWithName:(NSString *)name icon:(UIImage *)icon;

@end
