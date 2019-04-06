//
//  AliyunSalesWSTimeConversions.h
//  AliyunSales
//
//  Created by wangsong on 16/5/18.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSTimeConversion : NSObject
// 这是一个时间换算的单例工具类

/**
 *  单例方法:获取字典实例
 *
 *  @return 返回实例
 */
+ (instancetype)shareInstance;

/**
 *  根据服务器返回的时间number换算成字符串。格式： yyyy-MM-dd HH-mm-ss
 *
 *  @param timerNumber NSTimeInterval类型
 *
 *  @return 时间字符串
 */
+ (NSString *)getTimeWithNumber:(NSTimeInterval)timerNumber;
/**
 *  根据服务器返回的时间换算成 年/月/日
 *
 *  @param timerNumber NSTimerInterval类型
 *
 *  @return 年/月/日
 */
+ (NSString *)getYMdWithNumber:(NSTimeInterval)timerNumber;
/**
 *  根据服务器返回的时间换算成 时:分:秒
 *
 *  @param timerNumber NSTimerInterval类型
 *
 *  @return 时:分:秒
 */
+ (NSString *)getHmsWithNumber:(NSTimeInterval)timerNumber;
/**
 *  获取本地时间
 *
 *  @return 返回本地时间 NSDate类型
 */
+ (NSDate *)getLocalDate;
/**
 *  根据开始时间获取时间间隔 时间间隔以秒为单位
 *
 *  @param startDate 开始时间
 *
 *  @return 返回时间间隔 秒 不是四舍五入 小数全舍
 */
+ (NSInteger)getSecondDurationWithStartDate:(NSDate *)startDate;
/**
 *  根据开始时间获取时间间隔 时间间隔以秒为单位
 *
 *  @param startDate 开始时间
 *
 *  @return 返回时间间隔字符串 秒 不是四舍五入 小数全舍
 */
+ (NSString *)getSecondDurationStringWithStartDate:(NSDate *)startDate;
/**
 *  根据服务器返回的时间number换算成字符串。格式： yyyy-MM-dd HH:mm:ss
 *
 *  @param date NSDate类型 date为nil代表当前时间
 *
 *  @return 时间字符串
 */
+ (NSString *)getTimeStringWithDate:(NSDate *)date;
/**
 *  获取时间戳字符串
 *
 *  @return 时间戳字符串
 */
+ (NSString *)getTimeStamp;

@end
