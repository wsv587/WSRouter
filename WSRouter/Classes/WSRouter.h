//
//  WSRouter.h
//  Pods-WSRouter_Example
//
//  Created by sw on 2019/4/5.
//

#import <Foundation/Foundation.h>
#import "WSRouterHandler.h"

@interface WSRouter : NSObject
/** 注册跳转URL
 *
 */
+ (void)registerRouterWithPrefixURL:(NSURL *)prefixURL
                            handler:(WSRouterHandler)handler;

+ (void)unRegisterRouterWithPrefixURL:(NSURL *)prefixURL;

+ (void)transferFromViewController:(UIViewController *)sourceViewController
                             toURL:(NSURL *)URL;

+ (void)transferFromViewController:(UIViewController *)sourceViewController
                             toURL:(NSURL *)URL
                        complation:(WSRouterTransferCompletionHandler)completionHandler;

+ (void)transferFromViewController:(UIViewController *)sourceViewController
                             toURL:(NSURL *)URL
                        complation:(WSRouterTransferCompletionHandler)completionHandler
                    resultCallback:(WSRouterResultCallback)resultCallback;

+ (void)transferViewController:(UIViewController *)destinationViewController
            fromViewController:(UIViewController *)sourceViewController
                    transition:(WSTransitionType)transitionType;

@end
