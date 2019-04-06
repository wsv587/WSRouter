//
//  NSMutableArray+WSExtension.m
//  Pods-VVSBox_Example
//
//  Created by sw on 2019/3/21.
//

#import "NSMutableArray+WSExtension.h"

@implementation NSMutableArray (WSExtension)
- (void)ws_safeAddObject:(id)obj {
    if (!obj) {
        return;
    }
    [self addObject:obj];
}
    
- (void)ws_safeInsertObject:(id)obj atIndex:(NSUInteger)index {
    if (!obj) {
        return;
    }
    if (index > self.count || index < 0) {
        return;
    }
    [self insertObject:obj atIndex:index];
}
    
- (void)ws_safeRemoveObjectAtIndex:(NSInteger)index {
    if (index < 0 || index >= self.count) {
        return;
    }
    [self removeObjectAtIndex:index];
}
    
    /*
     NOT OK:
     
     [arrM addObjectsFromArray:@[@"1",@"2"]];
     NSRange rg = NSMakeRange(3, 0);
     [arrM removeObject:@"1" inRange:rg];
     
     NOT OK:
     [arrM addObjectsFromArray:@[@"1",@"2"]];
     NSRange rg = NSMakeRange(2, 1);
     [arrM removeObject:@"1" inRange:rg];
     
     OK:
     [arrM addObjectsFromArray:@[@"1",@"2"]];
     NSRange rg = NSMakeRange(2, 0);
     [arrM removeObject:@"1" inRange:rg];
     
     OK:
     [arrM addObjectsFromArray:@[@"1",@"2"]];
     NSRange rg = NSMakeRange(1, 1);
     [arrM removeObject:@"1" inRange:rg];
     
     
     */
- (void)ws_safeRemoveObject:(id)obj inRange:(NSRange)range {
    if (!obj ||
        !self.count ||
        !range.length ||
        range.location >= self.count ||
        range.location + range.length > self.count) {
        return;
    }
    [self removeObject:obj inRange:range];
}
    
+ (instancetype)ws_safeArrayWithCapacity:(NSInteger)numItems {
    if (numItems < 0) {
        return [NSMutableArray array];
    }
    return [NSMutableArray arrayWithCapacity:numItems];
}
    
- (void)ws_safeExchangeObjectAtIndex:(NSInteger)idx1 withObjectAtIndex:(NSInteger)idx2 {
    if (idx1 < 0 || idx2 < 0 || idx1 >= self.count || idx2 >= self.count) {
        return;
    }
    [self exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
}
    
#pragma mark - Optional
- (void)ws_safeRemoveObject:(id)obj {
    if (!obj || [self containsObject:obj]) {
        return;
    }
    [self removeObject:obj];
}
    
- (void)ws_safeAddObjectsFromArray:(NSArray *)otherArray {
    if (!otherArray || !otherArray.count || ![otherArray isKindOfClass:[NSArray class]]) {
        return;
    }
    [self addObjectsFromArray:otherArray];
}

@end
