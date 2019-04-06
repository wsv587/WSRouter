//
//  NSArray+WSExtension.m
//  Pods-VVSBox_Example
//
//  Created by sw on 2019/3/21.
//

#import "NSArray+WSExtension.h"

@implementation NSArray (WSExtension)
- (id)ws_safeObjectAtIndex:(NSUInteger)index {
    if (index < 0 || index >= [self count]) {
        return nil;
    }
    return [self objectAtIndex:index];
}
    
- (NSInteger)ws_safeIndexOfObject:(NSObject *)obj {
    if (obj == nil || ![self containsObject:obj]) {
        return -1;
    }
    return [self indexOfObject:obj];
}
    
+ (BOOL)ws_isArray:(NSArray *)obj {
    if (!obj || ![obj isKindOfClass:[NSArray class]]) {
        return NO;
    }
    return YES;
}
    
+ (BOOL)ws_isNotEmptyArray:(NSArray *)obj {
    if (!obj || ![obj isKindOfClass:[NSArray class]] || [obj count] <= 0) {
        return NO;
    }
    return YES;
}

@end
