//
//  AppController.m
//  Launcher
//
//  Created by why001 on 14/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "AppController.h"
#import "AppModel.h"

@interface AppController ()

@property (nonatomic, strong) AppModel *model;

@end

@implementation AppController

- (instancetype)initWithAppModel:(AppModel *)model {
    NSAssert(model != nil, @"model can't be nil");
    if (self = [super init]) {
        _model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    imageView.image = _model.icon;
    [self.view addSubview:imageView];
    imageView.center = self.view.center;
}

@end
