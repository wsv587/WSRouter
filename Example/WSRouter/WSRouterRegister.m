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
#import "WSWebViewController.h"

@implementation WSRouterRegister
+ (void)load {
    [self registerPush];
    [self registerModal];
}

+ (void)registerPush {
    NSURL *url = [NSURL URLWithString:@"ws://www.ws.com/first?uid=999&bid=666"];
    
    [WSRouter registerRouterWithPrefixURL:url handler:^UIViewController *(NSURL *URL, UIViewController *sourceViewController) {
        WSPushedViewController *destViewController = [[WSPushedViewController alloc] init];
        [WSRouter transferViewController:destViewController
                      fromViewController:sourceViewController
                              transition:WSTransitionPush];
        destViewController.params = [NSString ws_parameterFromURLQuery:URL.query];
        return destViewController;
        
    }];
}

+ (void)registerModal {
    
    NSURL *url = [NSURL URLWithString:@"ws://www.ws.com/second"];
    [WSRouter registerRouterWithPrefixURL:url handler:^UIViewController *(NSURL *URL, UIViewController *sourceViewController) {
        UIViewController *destViewController = [[WSPresentedViewController alloc] init];
        [WSRouter transferViewController:destViewController
                      fromViewController:sourceViewController
                              transition:WSTransitionPresent];
        return destViewController;
    }];
}

//NSURL *url = [NSURL URLWithString:@"ws://www.ws.com/first?uid=999&bid=666"];
//id query = url.query;               // uid=999&bid=666
//id scheme = url.scheme;             // WS
//id host = url.host;                 // www.ws.com
//id path = url.path;                 // /first
//id absString = url.absoluteString;  // WS://www.ws.com/first?uid=999&bid=666
//id absUrl = url.absoluteURL;        // WS://www.ws.com/first?uid=999&bid=666

@end
