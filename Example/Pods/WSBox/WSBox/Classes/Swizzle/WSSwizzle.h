//
//  WSSwizzle.h
//  Pods
//
//  Created by sw on 2019/4/6.
//

#import <Foundation/Foundation.h>

#define ws_swizzleClassMethod(class, selectorA, selectorB) \
_ws_swizzleClassMethod(class, selectorA, class, selectorB)

#define ws_swizzleInstanceMethod(class, selectorA, selectorB) \
    _ws_swizzleInstanceMethod(class, selectorA, class, selectorB)

void _ws_swizzleClassMethod(Class clsA, SEL selectorA, Class clsB, SEL selectorB);
void _ws_swizzleInstanceMethod(Class clsA, SEL selectorA, Class clsB, SEL selectorB);


@interface WSSwizzle : NSObject
+ (void)swizzleClassMethod:(SEL)selectorA ofClass:(Class)clsA withMethod:(SEL)selectorB ofClass:(Class)clsB;
+ (void)swizzleInstanceMethod:(SEL)selectorA ofClass:(Class)clsA withMethod:(SEL)selectorB ofClass:(Class)clsB;

@end
