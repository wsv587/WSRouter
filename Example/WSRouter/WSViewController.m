//
//  WSViewController.m
//  WSRouter
//
//  Created by nlgb on 04/05/2019.
//  Copyright (c) 2019 nlgb. All rights reserved.
//

#import "WSViewController.h"
#import "WSRouter.h"

@interface WSViewController ()
@property (weak, nonatomic) IBOutlet UIButton *pushButton;
@property (weak, nonatomic) IBOutlet UIButton *pushWithCallBackButton;

@property (weak, nonatomic) IBOutlet UIButton *presentButton;
- (IBAction)push:(id)sender;
- (IBAction)pushWithCallback:(id)sender;

- (IBAction)present:(id)sender;

@end

@implementation WSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    NSLog(@"disappear__");
}

- (IBAction)push:(id)sender {
    [WSRouter transferFromViewController:self
                                   toURL:[NSURL URLWithString:@"ws://www.ws.com/first?uid=666?title=title"]];
}

- (IBAction)pushWithCallback:(id)sender {
    [WSRouter transferFromViewController:self
                                   toURL:[NSURL URLWithString:@"ws://www.ws.com/first?uid=666"]
               viewWillDisappearCallBack:^(UIViewController *destViewController, id callbackData) {
                   NSLog(@"%@",callbackData);
               }];
}

- (IBAction)present:(id)sender {
    [WSRouter transferFromViewController:self toURL:[NSURL URLWithString:@"ws://www.ws.com/second?uid=999"]];
}
@end
