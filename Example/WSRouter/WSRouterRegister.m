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
    NSURL *url = [NSURL URLWithString:@"WS://www.ws.com/first?uid=999&bid=666"];
    id query = url.query;               // uid=999&bid=666
    id baseUrl = url.baseURL;
    id scheme = url.scheme;             // WS
    id port = url.port;
    id host = url.host;                 // www.ws.com
    id path = url.path;                 // /first
    id fragemnt = url.fragment;
    id absString = url.absoluteString;  // WS://www.ws.com/first?uid=999&bid=666
    id absUrl = url.absoluteURL;        // WS://www.ws.com/first?uid=999&bid=666
    
    
    [WSRouter registerRouterWithPrefixURL:url handler:^UIViewController *(NSURL *URL, UIViewController *sourceViewController) {
        WSPushedViewController *destViewController = [[WSPushedViewController alloc] init];
        [WSRouter transferViewController:destViewController
                      fromViewController:sourceViewController
                              transition:WSTransitionPush];
        destViewController.params = [NSString ws_parameterFromURLQuery:URL.query];
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
