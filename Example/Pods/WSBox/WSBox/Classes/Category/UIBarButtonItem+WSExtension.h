//
//  UIBarButtonItem+AliyunSalesBarButtonItem.h
//  AliyunSales
//
//  Created by wangsong on 16/4/20.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WSExtension)
/**
 *  自定义导航条两端按钮的title
 *
 *  @param title  title
 *  @param target target
 *  @param action action
 *
 *  @return 返回一个配置好的UIBarButtonItem
 */
+ (UIBarButtonItem *)ws_itemWithTitle:(NSString *)title
                            target:(id)target
                            action:(SEL)action;

+ (UIBarButtonItem *)ws_itemWithNormalTitle:(NSString *)normalTitle
                           selectedTitle:(NSString *)selectedTitle
                                  target:(id)target
                                  action:(SEL)action;

/**
 *  自定义导航条两端按钮的image
 *
 *  @param normalImageName    normal状态下的图片的名字
 *  @param highLightImageName highLight状态下的图片的名字
 *  @param target             target
 *  @param action             action
 *
 *  @return 返回一个配置好的UIBarButtonItem
 */
+ (UIBarButtonItem *)ws_itemWithNormalImageName:(NSString *)normalImageName
                          highLightImageName:(NSString *)highLightImageName
                                      target:(id)target
                                      action:(SEL)action;

/**
 *  自定义导航条两端按钮的button
 *
 *  @param button             button
 *  @param target             target
 *  @param action             action
 *
 *  @return 根据button返回一个配置好的UIBarButtonItem
 */
+ (UIBarButtonItem *)ws_itemWithButton:(UIButton *)button
                             target:(id)target
                             action:(SEL)action;

@end
