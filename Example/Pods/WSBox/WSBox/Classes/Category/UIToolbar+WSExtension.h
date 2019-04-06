//
//  UIToolbar+AliyunSalesInputAccessoryView.h
//  YunFu
//
//  Created by ws on 16/12/29.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIToolbar (WSExtension)
/**
 * title 按钮的标题
 * target 消息接受者/方法调用方
 * action 发送的消息/调用的方法
 */
+ (instancetype)ws_inputAccessoryViewWithTitle:(NSString *)title
                                        target:(id)target
                                        action:(SEL)action;

@end
