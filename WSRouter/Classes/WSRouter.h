//
//  WSRouter.h
//  Pods-WSRouter_Example
//
//  Created by sw on 2019/4/5.
//

#import <Foundation/Foundation.h>
#import "WSRouterHandler.h"
#import "NSString+WSRouter.h"

@interface WSRouter : NSObject
/** 注册URL
 *  prefixURL: 注册的URL
 *  handler: 执行页面跳转的handler
 */
+ (void)registerRouterWithPrefixURL:(NSURL *)prefixURL
                            handler:(WSRouterHandler)handler;
/** 解除注册的URL
 *  prefixURL: 注册的URL
 */
+ (void)unRegisterRouterWithPrefixURL:(NSURL *)prefixURL;

/** 执行页面跳转
 *  sourceViewController: 源控制器
 *  URL: 目的页面对应的URL
 */
+ (void)transferFromViewController:(UIViewController *)sourceViewController
                             toURL:(NSURL *)URL;

/** 执行页面跳转
 *  sourceViewController: 源控制器
 *  URL: 目的页面对应的URL
 *  completionHandler: 页面跳转完成的handler
 */
+ (void)transferFromViewController:(UIViewController *)sourceViewController
                             toURL:(NSURL *)URL
                        complation:(WSRouterTransferCompletionHandler)completionHandler;

/** 执行页面跳转
 *  sourceViewController: 源控制器
 *  URL: 目的页面对应的URL
 *  completionHandler: 页面跳转完成的handler
 *  resultCallback: 目标页面将要消失的handler
 */

+ (void)transferFromViewController:(UIViewController *)sourceViewController
                             toURL:(NSURL *)URL
                        complation:(WSRouterTransferCompletionHandler)completionHandler
                    resultCallback:(WSRouterResultCallback)resultCallback;
/** 执行页面跳转
 *  destinationViewController: 目标控制器
 *  sourceViewController: 源控制器
 *  transitionType: 转场方式
 */
+ (void)transferViewController:(UIViewController *)destinationViewController
            fromViewController:(UIViewController *)sourceViewController
                    transition:(WSTransitionType)transitionType;

@end
