//
//  WSRouterRegister.m
//  WSRouter_Example
//
//  Created by sw on 2019/4/5.
//  Copyright © 2019 nlgb. All rights reserved.
//

#import "WSRouterRegister.h"
#import "WSRouter.h"

#import "WSPushedViewController.h"
#import "WSPresentedViewController.h"

@implementation WSRouterRegister
+ (void)load {
    [self registerFirst];
    [self registerSecond];
}

+ (void)registerFirst {
    NSURL *url = [NSURL URLWithString:@"WS://www.ws.com/first"];
    [WSRouter registerRouterWithPrefixURL:url handler:^UIViewController *(NSURL *URL, UIViewController *sourceViewController) {
        UIViewController *destViewController = [[WSPushedViewController alloc] init];
        [WSRouter transferViewController:destViewController
                      fromViewController:sourceViewController
                              transition:WSTransitionPush];
        return destViewController;
    }];
}

+ (void)registerSecond {
    
    NSURL *url = [NSURL URLWithString:@"WS://www.ws.com/second"];
    [WSRouter registerRouterWithPrefixURL:url handler:^UIViewController *(NSURL *URL, UIViewController *sourceViewController) {
        UIViewController *destViewController = [[WSPresentedViewController alloc] init];
        [WSRouter transferViewController:destViewController
                      fromViewController:sourceViewController
                              transition:WSTransitionPresent];
        return destViewController;
    }];

}

@end
