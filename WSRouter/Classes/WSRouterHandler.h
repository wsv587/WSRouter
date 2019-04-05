//
//  WSRouterHandler.h
//  Pods-WSRouter_Example
//
//  Created by sw on 2019/4/5.
//

#ifndef WSRouterHandler_h
#define WSRouterHandler_h
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WSTransitionType) {
    WSTransitionPush,
    WSTransitionPushWithoutAnimation,
    WSTransitionPresent,
    WSTransitionPresentWithoutAnimation
};

typedef UIViewController * (^WSRouterHandler)(NSURL *URL, UIViewController *sourceViewController);

typedef void (^WSRouterTransferCompletionHandler)(UIViewController * destViewController);

typedef void (^WSRouterResultCallback)(UIViewController *destViewController, id data);

#endif /* WSRouterHandler_h */
