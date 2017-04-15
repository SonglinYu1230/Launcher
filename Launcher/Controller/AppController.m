//
//  AppController.m
//  Launcher
//
//  Created by why001 on 14/04/2017.
//  Copyright © 2017 why001. All rights reserved.
//

#import "AppController.h"
#import "AppModel.h"
#import "YYCategories.h"
#import "AppCollectionViewCell.h"

@interface AppController ()

@property (nonatomic, strong) AppModel *model;

@end

@implementation AppController

- (instancetype)initWithAppModel:(AppModel *)model {
    NSAssert(model != nil, @"model can't be nil");
    if (self = [super init]) {
        _model = model;
        _snapView = [UIView new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor colorWithHexString:@"#3B99D8"] colorWithAlphaComponent:0.7];
    [self.view addSubview:_snapView];
    _snapView.center = self.view.center;
}

@end
