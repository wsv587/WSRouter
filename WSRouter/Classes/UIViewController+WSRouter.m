//
//  UIViewController+WSRouter.m
//  Pods-WSRouter_Example
//
//  Created by sw on 2019/4/5.
//

#import "UIViewController+WSRouter.h"
#import <objc/runtime.h>
#import "WSSwizzle.h"

static char const* router_viewWillDisappearCallbackKey = "router_viewWillDisappearCallbackKey";
static char const* router_viewDidDisappearCallbackKey = "router_viewDidDisappearCallbackKey";
static char const* router_callbackDataKey = "router_callbackDataKey";

@implementation UIViewController (WSRouter)

- (void)setRouter_viewWillDisappearCallBack:(WSRouterResultCallback)router_viewWillDisappearCallBack {
    objc_setAssociatedObject(self, router_viewWillDisappearCallbackKey, router_viewWillDisappearCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (WSRouterResultCallback)router_viewWillDisappearCallBack {
    return objc_getAssociatedObject(self, router_viewWillDisappearCallbackKey);
}

- (void)setRouter_viewDidDisappearCallBack:(WSRouterResultCallback)router_viewDidDisappearCallBack {
    objc_setAssociatedObject(self, router_viewDidDisappearCallbackKey, router_viewDidDisappearCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (WSRouterResultCallback)router_viewDidDisappearCallBack {
    return objc_getAssociatedObject(self, router_viewDidDisappearCallbackKey);
}

- (void)setRouter_callbackData:(id)router_callbackData {
    objc_setAssociatedObject(self, router_callbackDataKey, router_callbackData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)router_callbackData {
    return objc_getAssociatedObject(self, router_callbackDataKey);
}

#pragma mark - Swizzle
- (void)_ws_router_swizzle_viewWillDisappear:(BOOL)animated {
    if ([self isBeingDismissed] || [self isMovingFromParentViewController]) {
        [self _ws_router_viewWillDisappear];
    }

    [self _ws_router_swizzle_viewWillDisappear:animated];
}

- (void)_ws_router_swizzle_viewDidDisappear:(BOOL)animated {
    if ([self isBeingDismissed] || [self isMovingFromParentViewController]) {
        [self _ws_router_viewDidDisappear];
    }
    [self _ws_router_swizzle_viewDidDisappear:animated];
}

- (void)_ws_router_viewWillDisappear {
    if (self.router_viewWillDisappearCallBack) {
        self.router_viewWillDisappearCallBack(self, self.router_callbackData);
    }
}

- (void)_ws_router_viewDidDisappear {
    if (self.router_viewDidDisappearCallBack) {
        self.router_viewDidDisappearCallBack(self, self.router_callbackData);
    }
}

@end

@interface WSSwizzleObject : NSObject

@end

@implementation WSSwizzleObject

+ (void)load {
    ws_swizzleInstanceMethod([UIViewController class], @selector(viewWillDisappear:), @selector(_ws_router_swizzle_viewWillDisappear:));
    ws_swizzleInstanceMethod([UIViewController class], @selector(viewDidDisappear:), @selector(_ws_router_swizzle_viewDidDisappear:));
}

@end
