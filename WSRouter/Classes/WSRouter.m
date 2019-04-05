//
//  WSRouter.m
//  Pods-WSRouter_Example
//
//  Created by sw on 2019/4/5.
//

#import "WSRouter.h"

@implementation WSRouter
NS_INLINE NSString *keyFromURL(NSURL *URL) {
    return URL ? [NSString stringWithFormat:@"%@://%@%@",URL.scheme, URL.host,URL.path] : nil;
}

static NSString * const kDefaultRouterKey = @"defaultRouterKey";
static NSMutableDictionary<NSString *, NSMutableArray *> *RouterMap = nil;

#pragma mark - Register
+ (void)registerRouterWithPrefixURL:(NSURL *)prefixURL handler:(WSRouterHandler)handler {
    NSAssert([prefixURL.scheme length] > 0, @"url无有效scheme");
    NSAssert([prefixURL.host length] > 0, @"url无有效host");
    [self p_registerRouterWithHandler:handler forKey:keyFromURL(prefixURL)];
}

+ (void)p_registerRouterWithHandler:(WSRouterHandler)handler forKey:(NSString *)key {
    NSParameterAssert(handler);
    NSString *realKey = key ?: kDefaultRouterKey;
    if (RouterMap[realKey]) {
        [RouterMap[realKey] addObject:handler];
    } else {
        RouterMap[realKey] = [NSMutableArray arrayWithObject:handler];
    }
}

+ (void)unRegisterRouterWithPrefixURL:(NSURL *)prefixURL {
    NSAssert(prefixURL, @"prefixURL can not be nil");
    NSAssert([prefixURL.scheme length] > 0, @"prefixURL.scheme can not be nil");
    NSAssert([prefixURL.host length] > 0, @"prefixURL.host can not be nil");
    if (!prefixURL || [prefixURL.scheme length] <= 0 || [prefixURL.host length] <= 0) {
        return;
    }
    [self p_unRegisterRouterForKey:keyFromURL(prefixURL)];
}

+ (void)p_unRegisterRouterForKey:(NSString *)key {
    if (RouterMap[key]) {
        [RouterMap removeObjectForKey:key];
    }
}

#pragma mark - Transfer
+ (void)transferFromViewController:(UIViewController *)sourceViewController toURL:(NSURL *)URL {
    [self transferFromViewController:sourceViewController toURL:URL complation:nil];
}

+ (void)transferFromViewController:(UIViewController *)sourceViewController toURL:(NSURL *)URL complation:(WSRouterTransferCompletionHandler)completionHandler {
    [self transferFromViewController:sourceViewController toURL:URL complation:completionHandler resultCallback:nil];
}

+ (void)transferFromViewController:(UIViewController *)sourceViewController toURL:(NSURL *)URL complation:(WSRouterTransferCompletionHandler)completionHandler resultCallback:(WSRouterResultCallback)resultCallback {
    NSParameterAssert(URL);
    NSParameterAssert([URL isKindOfClass:[NSURL class]]);
    NSParameterAssert(![URL.absoluteString isEqualToString:@""]);
    NSAssert([NSThread isMainThread], @"This method must be called on the UI Thread");
    
    if (!URL ||
        ![URL isKindOfClass:[NSURL class]] ||
        [URL.absoluteString isEqualToString:@""] ||
        ![NSThread isMainThread]) {
        return;
    }
    
    UIViewController *sourceController = sourceViewController ?: [self topViewController];
    [self p_transferFromViewController:sourceController toURL:URL completion:completionHandler];
}

+ (UIViewController *)p_transferFromViewController:(UIViewController *)sourceViewController
                                             toURL:(NSURL *)URL
                                        completion:(WSRouterTransferCompletionHandler)completionHandler {
    if (!URL) {
        return nil;
    }
    
    // 生成需要查找的key
    NSMutableArray<NSArray *>* keysPool = [NSMutableArray array];
    NSString *hotestKey = keyFromURL(URL);
    if (hotestKey) {
        [keysPool addObject:@[hotestKey]];
    }
    
    __block UIViewController *destViewController;
    [keysPool enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *handlers = [self p_handlersWithKeys:obj];
        destViewController = [self p_destViewControllerWithHandlers:handlers toURL:URL sourceViewController:sourceViewController];
        *stop = !!destViewController;
    }];
    if (!destViewController) {
        return nil;
    }
    if (completionHandler) {
        completionHandler(destViewController);
    }
    return destViewController;
}

+ (NSArray *)p_handlersWithKeys:(NSArray *)keys {
    if (!keys || ![keys count]) {
        return nil;
    }
    
    NSMutableArray *handlers = [NSMutableArray array];
    for (NSString *key in keys) {
        if(RouterMap[key] && [RouterMap[key] count] > 0) {
            [handlers addObjectsFromArray: RouterMap[key]];
        }
    }
    return handlers;
}

+ (UIViewController *)p_destViewControllerWithHandlers:(NSArray *)handlers
                                                 toURL:(NSURL *)URL
                                  sourceViewController:(UIViewController *)sourceViewController {
    
    if (!handlers || ![handlers count]) {
        return nil;
    }
    
    __block UIViewController *destViewController = nil;
    [handlers enumerateObjectsUsingBlock:^(WSRouterHandler  _Nonnull handler, NSUInteger idx, BOOL * _Nonnull stop) {
        if (handler) {
            destViewController = handler(URL, sourceViewController);
        }
        *stop = !!destViewController;
    }];
    
    return destViewController;
}

+ (void)transferViewController:(UIViewController *)destinationViewController
            fromViewController:(UIViewController *)sourceViewController
                    transition:(WSTransitionType)transitionType {
    switch (transitionType) {
        case WSTransitionPush:
            [sourceViewController.navigationController pushViewController:destinationViewController animated:YES];
            break;
        case WSTransitionPushWithoutAnimation:
            [sourceViewController.navigationController pushViewController:destinationViewController animated:NO];
            break;
        case WSTransitionPresent:
            [sourceViewController presentViewController:destinationViewController animated:YES completion:nil];
            break;
        case WSTransitionPresentWithoutAnimation:
            [sourceViewController presentViewController:destinationViewController animated:NO completion:nil];
            break;
    }
}
#pragma mark - Override
+ (void)initialize {
    if (self == [WSRouter self]) {
        RouterMap = [NSMutableDictionary dictionary];
    }
}


#pragma mark - Helper
+ (UIViewController *)topViewController {
    return [self topViewControllerForRootViewController:[UIApplication sharedApplication].delegate.window.rootViewController];
}

+ (UIViewController *)topViewControllerForRootViewController:(UIViewController *)rootViewController {
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        return [self topViewControllerForRootViewController:navigationController.viewControllers.lastObject];
    }
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self topViewControllerForRootViewController:tabBarController.selectedViewController];
    }
    if (rootViewController.presentedViewController) {
        return [self topViewControllerForRootViewController:rootViewController.presentedViewController];
    }
    if ([rootViewController isViewLoaded] && rootViewController.view.window) {
        return rootViewController;
    }
    return nil;
}
@end
