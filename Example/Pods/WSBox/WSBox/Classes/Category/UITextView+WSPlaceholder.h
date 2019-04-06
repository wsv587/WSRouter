//
//  UITextView+WSPlaceholder.h
//  AliyunSales
//
//  Created by wangsong on 16/6/28.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (WSPlaceholder)
/**
 *  返回一个带占位文字的textView
 *
 *  @param placeholder 占位文字
 *
 *  @return textView实例对象
 */
+ (UITextView *)ws_textViewWithPlaceholder:(NSString *)placeholder;

- (UITextView *)ws_setupTextViewWithPlaceholder:(NSString *)placeholder;

@end
