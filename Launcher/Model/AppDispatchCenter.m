//
//  AppDispatchCenter.m
//  Launcher
//
//  Created by why001 on 14/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "AppDispatchCenter.h"
#import "Constant.h"
#import "AppDelegate.h"
#import "AppController.h"
#import "AppModel.h"

@interface AppDispatchCenter ()

@property (nonatomic, strong) NSMutableDictionary *appInfo;

@end

@implementation AppDispatchCenter

+ (void)load {
    [AppDispatchCenter sharedInstance];
}

+ (instancetype)sharedInstance {
    static AppDispatchCenter *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [AppDispatchCenter new];
    });
    
    return _sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        _appInfo = [NSMutableDictionary new];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleSingleTapOnHomeButton) name:kSingleTapOnHomeButton object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleDoubleTapOnHomeButton) name:kDoubleTapOnHomeButton object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)openAppWithAppModel:(AppModel *)model {
    NSString *appAddress = _appInfo[model.name];
    BOOL isInMemory = NO;
//    if (appAddress) {
//        NSObject *object;
//        sscanf([appAddress cStringUsingEncoding:NSUTF8StringEncoding], "%p", &object);
//        if ([object isKindOfClass:[AppController class]]) {
//            isInMemory = YES;
//            [[self rootViewController] presentViewController:(AppController *)object animated:YES completion:nil];
//        }
//    }
    if (!isInMemory) {
        AppController *controller = [[AppController alloc] initWithAppModel:model];
        controller.modalTransitionStyle = UIModalPresentationCustom;
        controller.transitioningDelegate = [self rootViewController];
        [[self rootViewController] presentViewController:controller animated:YES completion:nil];
        
        appAddress = [NSString stringWithFormat:@"%p", controller];
        [self saveAppWithAppName:model.name appAddress:appAddress];
    }
}

- (void)saveApp:(UIViewcontrolelr *)controller {
    NSString *addr = [NSString stringWithFormat:@"%p", controller];
    _appInfo[addr] = controller;
}

- (void)saveAppWithAppName:(NSString *)name appAddress:(NSString *)appAddress {
    _appInfo[name] = appAddress;
}

- (void)destoryApp:(UIViewcontrolelr *)controller {
    NSString *addr = [NSString stringWithFormat:@"%p", controller];
    [_appInfo removeObjectForKey:addr];
}

- (NSArray *)recentApps {
    return _appInfo;
}

#pragma mark - private method

- (UIViewController *)rootViewController {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return [appDelegate rootViewController];
}

- (void)handleSingleTapOnHomeButton {
    [[self rootViewController] dismissViewControllerAnimated:YES completion:nil];
}

- (void)handleDoubleTapOnHomeButton {
    
}

@end
