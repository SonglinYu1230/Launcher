//
//  AppDelegate.m
//  Launcher
//
//  Created by why001 on 13/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "AppDelegate.h"
#import "Constant.h"

@interface AppDelegate ()

@property (nonatomic, strong) UIView *homeView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    if (!_homeView) {
        CGFloat viewWH = 60.f;
        _homeView = [[UIView alloc] initWithFrame:CGRectMake((CGRectGetWidth([[UIScreen mainScreen] bounds]) - viewWH)/2.f, CGRectGetHeight([[UIScreen mainScreen] bounds]) - viewWH, viewWH, viewWH)];
        _homeView.layer.cornerRadius = viewWH/2.f;
        _homeView.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.6];
        [_window addSubview:_homeView];
        
        UITapGestureRecognizer *singleTapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGestureRecognizer:)];
        [_homeView addGestureRecognizer:singleTapGR];
        
        
        UITapGestureRecognizer *doubleTapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapGestureRecognizer:)];
        doubleTapGR.numberOfTapsRequired = 2;
        [_homeView addGestureRecognizer:doubleTapGR];
        
        [singleTapGR requireGestureRecognizerToFail:doubleTapGR];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - private method

- (UIViewController *)rootViewController {
    return [_window rootViewController];
}

#pragma mark - gesture response

- (void)handleSingleTapGestureRecognizer:(UITapGestureRecognizer *)gestureRecognizer {
    [[NSNotificationCenter defaultCenter] postNotificationName:kSingleTapOnHomeButton object:nil];
}

- (void)handleDoubleTapGestureRecognizer:(UITapGestureRecognizer *)gestureRecognizer {
    [[NSNotificationCenter defaultCenter] postNotificationName:kDoubleTapOnHomeButton object:nil];
}

@end
