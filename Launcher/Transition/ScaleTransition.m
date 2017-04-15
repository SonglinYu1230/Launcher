//
//  ScaleTransition.m
//  Launcher
//
//  Created by why001 on 14/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "ScaleTransition.h"
#import "ViewController.h"
#import "AppController.h"
#import "AppCollectionViewCell.h"

static NSTimeInterval const kAnimationDuration = 0.6f;

@interface ScaleTransition ()

@property (nonatomic, assign) ScaleTransitionType scaleType;

@end

@implementation ScaleTransition

- (instancetype)initWithScaleTransitionType:(ScaleTransitionType)scaleType {
    if (self = [super init]) {
        _scaleType = scaleType;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return kAnimationDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = transitionContext.containerView;
    
    switch (_scaleType) {
        case ScaleTransitionTypeEnlarge:
            [self enlargeAnimateWithTransition:transitionContext fromController:fromController toController:toController fromView:fromView toView:toView containerView:containerView];
            break;
        case ScaleTransitionTypeShrink:
            [self shrinkAnimateWithTransition:transitionContext fromController:fromController toController:toController fromView:fromView toView:toView containerView:containerView];
            break;
            
        default:
            break;
    }
 
//
//    UIView *snapView = [toView snapshotViewAfterScreenUpdates:YES];
//    [containerView addSubview:snapView];
//    [containerView addSubview:fromView];
//    NSTimeInterval duration = [self transitionDuration:transitionContext];
//    [UIView animateWithDuration:duration animations:^{
//        fromView.center = destPoint;
//        fromView.transform = CGAffineTransformMakeScale(1/300.0f, 1/270.0f);
//    } completion:^(BOOL finished) {
//        BOOL wasCancelled = [transitionContext transitionWasCancelled];
//        if (wasCancelled) {
//            [fromView removeFromSuperview];
//        }
//        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
//    }];
}

- (void)enlargeAnimateWithTransition:(id<UIViewControllerContextTransitioning>)transitionContext
                fromController:(UIViewController *)fromController
                     toController:(UIViewController *)toController
                         fromView:(UIView *)fromView
                           toView:(UIView *)toView
                    containerView:(UIView *)containerView {
    ViewController *vc = (ViewController *)fromController;
    AppController *appVC = (AppController *)toController;
    
    AppCollectionViewCell *cell = vc.selectedCell;
    UIView *snapView = [cell snapshotViewAfterScreenUpdates:YES];
    [containerView addSubview:fromView];
    
    [containerView addSubview:toView];
    [containerView addSubview:snapView];
    
    toView.alpha = 0.f;
    snapView.frame = cell.frame;
    cell.hidden = YES;
    [UIView animateWithDuration:kAnimationDuration animations:^{
        toView.alpha = 1.0;
        fromView.alpha = 0.f;
        snapView.center = containerView.center;
    } completion:^(BOOL finished) {
        BOOL success = ![transitionContext transitionWasCancelled];
        if (success) {
            [fromView removeFromSuperview];
            appVC.snapView = snapView;
        }
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

- (void)shrinkAnimateWithTransition:(id<UIViewControllerContextTransitioning>)transitionContext
                         fromController:(UIViewController *)fromController
                            toController:(UIViewController *)toController
                                fromView:(UIView *)fromView
                                  toView:(UIView *)toView
                           containerView:(UIView *)containerView {
    AppController *appVC = (AppController *)fromController;
    ViewController *vc = (ViewController *)toController;
    
    [containerView addSubview:toView];
    [containerView addSubview:fromView];

    UIView *snapView = [appVC.snapView snapshotViewAfterScreenUpdates:YES];
    [containerView addSubview:snapView];
    snapView.center = containerView.center;
    
    appVC.snapView.hidden = YES;
    toView.alpha = 0.f;
    AppCollectionViewCell *cell = vc.selectedCell;
    [UIView animateWithDuration:kAnimationDuration animations:^{
        toView.alpha = 1.f;
        fromView.alpha = 0.f;
        snapView.frame = cell.frame;
    } completion:^(BOOL finished) {
        BOOL success = ![transitionContext transitionWasCancelled];
        if (success) {
            cell.hidden = NO;
        }
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];

}

@end
