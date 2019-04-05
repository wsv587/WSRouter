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

@property (weak, nonatomic) IBOutlet UIButton *presentButton;
- (IBAction)push:(id)sender;
- (IBAction)present:(id)sender;

@end

@implementation WSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)push:(id)sender {
    [WSRouter transferFromViewController:self toURL:[NSURL URLWithString:@"WS://www.ws.com/first?uid=666"]];
}

- (IBAction)present:(id)sender {
    [WSRouter transferFromViewController:self toURL:[NSURL URLWithString:@"WS://www.ws.com/second?uid=999"]];
}
@end
