//
//  UIViewController+WSRouter.h
//  Pods-WSRouter_Example
//
//  Created by sw on 2019/4/5.
//

#import <UIKit/UIKit.h>
#import "WSRouterHandler.h"

@interface UIViewController (WSRouter)
/**
 * 在viewWillDisappear时调用
 */
@property(nonatomic, copy) WSRouterResultCallback router_viewWillDisappearCallBack;
/**
 * 在viewDidDisappear时调用
 */
@property(nonatomic, copy) WSRouterResultCallback router_viewDidDisappearCallBack;

/**
 * 设置回传数据给上一个(源)控制器
 * router_callbackData: 要回传的数据
 */
- (void)setRouter_callbackData:(id)router_callbackData;
@end
