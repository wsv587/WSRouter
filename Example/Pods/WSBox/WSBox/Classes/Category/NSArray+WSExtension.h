//
//  NSArray+WSExtension.h
//  Pods-VVSBox_Example
//
//  Created by sw on 2019/3/21.
//

#import <Foundation/Foundation.h>

@interface NSArray (WSExtension)
- (id)ws_safeObjectAtIndex:(NSUInteger)index;
- (NSInteger)ws_safeIndexOfObject:(NSObject *)obj;
+ (BOOL)ws_isArray:(NSArray *)obj;
+ (BOOL)ws_isNotEmptyArray:(NSArray *)obj;
@end
