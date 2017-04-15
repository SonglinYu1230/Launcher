//
//  ScaleTransition.h
//  Launcher
//
//  Created by why001 on 14/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ScaleTransitionType) {
    ScaleTransitionTypeEnlarge = 1,
    ScaleTransitionTypeShrink,
};

@interface ScaleTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, readonly) ScaleTransitionType scaleType;

- (instancetype)initWithScaleTransitionType:(ScaleTransitionType)scaleType;

@end
