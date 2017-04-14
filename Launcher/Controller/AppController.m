//
//  AppController.m
//  Launcher
//
//  Created by why001 on 14/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "AppController.h"
#import "Constant.h"

@interface AppController ()

@end

@implementation AppController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleSingleTapOnHomeButton) name:kSingleTapOnHomeButton object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleDoubleTapOnHomeButton) name:kDoubleTapOnHomeButton object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)handleSingleTapOnHomeButton {
    
}

- (void)handleDoubleTapOnHomeButton {
    
}

@end
