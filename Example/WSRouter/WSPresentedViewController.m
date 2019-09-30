//
//  WSPresentedViewController.m
//  WSRouter_Example
//
//  Created by sw on 2019/4/5.
//  Copyright © 2019 nlgb. All rights reserved.
//

#import "WSPresentedViewController.h"

@interface WSPresentedViewController ()

@end

@implementation WSPresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 60, 40)];
    [backButton setTitle:@"back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:backButton];
    backButton.center = self.view.center;
    
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
