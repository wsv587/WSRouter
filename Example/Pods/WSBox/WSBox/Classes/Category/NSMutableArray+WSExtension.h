//
//  NSMutableArray+WSExtension.h
//  Pods-VVSBox_Example
//
//  Created by sw on 2019/3/21.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (WSExtension)
/** 添加对象前判空
 * obj: 被添加的对象
 */
- (void)ws_safeAddObject:(id)obj;
/** 插入对象前判空 判越界
 * obj: 被添加的对象
 * index: 插入的位置
 */
- (void)ws_safeInsertObject:(id)obj atIndex:(NSUInteger)index;
/** 移除对象前判空 判越界
 * object: 被移除的对象
 * index: 移除的位置
 */
- (void)ws_safeRemoveObjectAtIndex:(NSInteger)index;
/** 移除对象前判空 判越界
 * object: 被移除的对象
 * index: 移除的范围
 */
- (void)ws_safeRemoveObject:(id)obj inRange:(NSRange)range;
/** 交换两个对象
 * idx1: 对象1索引
 * idx2: 对象2索引
 */
- (void)ws_safeExchangeObjectAtIndex:(NSInteger)idx1 withObjectAtIndex:(NSInteger)idx2;
/** 初始化一个数组对象
 * numItems: 数组容量
 * 虽然系统方法的capacity是NSUInteger，但是很难保证在运行时传入的数字就一定>= 0，所以重写该方法还是很有必要的。否则容易出现如下crash: Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[__NSPlaceholderArray initWithCapacity:]: capacity (18446744073709551615) is ridiculous'
 */
+ (instancetype)ws_safeArrayWithCapacity:(NSInteger)numItems;

#pragma mark - Optional
// 可以移除一个nil对象或者一个不存在数组中的对象，所以如下方法是可选的。
/** 移除对象前判空
 * obj: 被移除的对象
 */
- (void)ws_safeRemoveObject:(id)obj;
/** 把一个源数组中的对象添加到目标数组
 * otherArray: 源数组
 */
- (void)ws_safeAddObjectsFromArray:(NSArray *)otherArray;
@end
