//
//  WSPushedViewController.m
//  WSRouter_Example
//
//  Created by sw on 2019/4/5.
//  Copyright © 2019 nlgb. All rights reserved.
//

#import "WSPushedViewController.h"
#import "WSRouter.h"

@interface WSPushedViewController ()

@end

@implementation WSPushedViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.router_callbackData = @"callback_DATA";
    [self setupUI];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"will Disappear");
}

- (void)dealloc {
    
    NSLog(@"dealloc");
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor redColor];
}

@end
