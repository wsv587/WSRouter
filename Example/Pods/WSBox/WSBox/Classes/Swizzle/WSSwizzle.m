//
//  WSSwizzle.m
//  Pods
//
//  Created by sw on 2019/4/6.
//

#import "WSSwizzle.h"
#import <objc/runtime.h>

void _ws_swizzleClassMethod(Class clsA, SEL selectorA, Class clsB, SEL selectorB) {
    Method methodA = class_getClassMethod(clsA, selectorA);
    Method methodB = class_getClassMethod(clsB, selectorB);
    if (class_addMethod(objc_getClass(NSStringFromClass(clsA).UTF8String), selectorA, method_getImplementation(methodB), method_getTypeEncoding(methodB))) {
        class_replaceMethod(objc_getClass(NSStringFromClass(clsB).UTF8String), selectorB, method_getImplementation(methodA), method_getTypeEncoding(methodA));
    } else {
        method_exchangeImplementations(methodA, methodB);
    }
}

void _ws_swizzleInstanceMethod(Class clsA, SEL selectorA, Class clsB, SEL selectorB) {
    Method methodA = class_getInstanceMethod(clsA, selectorA);
    Method methodB = class_getInstanceMethod(clsB, selectorB);
    if (class_addMethod(clsA, selectorA, method_getImplementation(methodB), method_getTypeEncoding(methodB))) {
        class_replaceMethod(clsB, selectorB, method_getImplementation(methodA), method_getTypeEncoding(methodA));
    } else {
        method_exchangeImplementations(methodA, methodB);
    }
}


@implementation WSSwizzle



+(void)swizzleClassMethod:(SEL)selectorA ofClass:(Class)clsA withMethod:(SEL)selectorB ofClass:(Class)clsB {
    _ws_swizzleClassMethod(clsA, selectorA, clsB, selectorB);
}

+ (void)swizzleInstanceMethod:(SEL)selectorA ofClass:(Class)clsA withMethod:(SEL)selectorB ofClass:(Class)clsB {
    _ws_swizzleInstanceMethod(clsA, selectorA, clsB, selectorB);
}



@end
