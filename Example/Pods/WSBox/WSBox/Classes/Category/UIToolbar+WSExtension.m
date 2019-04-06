//
//  UIToolbar+AliyunSalesInputAccessoryView.m
//  YunFu
//
//  Created by ws on 16/12/29.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "UIToolbar+WSExtension.h"

@interface UIToolbar ()

@end

@implementation UIToolbar (AliyunSalesInputAccessoryView)
+ (instancetype)ws_inputAccessoryViewWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    if (!title || !target || !action) {
        return nil;
    }
    // 键盘处理
    UIToolbar *inputAccessoryView = [[UIToolbar alloc] initWithFrame:CGRectMake(0.f, 0.f, [UIScreen mainScreen].bounds.size.width, 30.f)];
    inputAccessoryView.barStyle = UIBarStyleDefault;
    UIBarButtonItem *btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleDone target:target action:action];
    
    // 文字颜色
    [doneButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:58.0/255.0 green:54.0/255.0 blue:127.0/255.0 alpha:1.0],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    
    NSArray *buttons = [NSArray arrayWithObjects:btnSpace,doneButton, nil];
    inputAccessoryView.items = buttons;

    return inputAccessoryView;
}

@end
