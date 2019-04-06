//
//  AliyunSalesWSTimeConversions.m
//  AliyunSales
//
//  Created by wangsong on 16/5/18.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WSTimeConversion.h"

@implementation WSTimeConversion
#pragma mark - 单例
+ (instancetype)shareInstance
{
    WSTimeConversion *instance = [[self alloc] init];
    return instance;
}

static WSTimeConversion *_instance = nil;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

-(id)copyWithZone:(NSZone *)zone
{
    // 遵守NSCopying协议
    return _instance;
    
}

#pragma mark - 时间换算方法
+ (NSString *)getTimeWithNumber:(NSTimeInterval)timerNumber
{
    // 避免出现1960-01-01 08:00:00 的情况
    if (timerNumber  == 0) {
        return nil;
    }
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [fmt stringFromDate:[NSDate dateWithTimeIntervalSince1970:timerNumber/1000]];
}

+ (NSString *)getYMdWithNumber:(NSTimeInterval)timerNumber {
    if (timerNumber == 0) {
        return nil;
    }
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy/MM/dd";
    return [fmt stringFromDate:[NSDate dateWithTimeIntervalSince1970:timerNumber/1000]];
}

+ (NSString *)getHmsWithNumber:(NSTimeInterval)timerNumber {
    if (timerNumber == 0) {
        return nil;
    }
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"HH:mm:ss";
    return [fmt stringFromDate:[NSDate dateWithTimeIntervalSince1970:timerNumber/1000]];
}

+ (NSDate *)getLocalDate {
    NSDate *date = [NSDate date];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:date];
    NSDate *localDate = [date dateByAddingTimeInterval:interval];
    return localDate;
}

+ (NSInteger)getSecondDurationWithStartDate:(NSDate *)startDate {
    // 获取结束录音时间
    NSDate *stopDate = [self getLocalDate];
    // 获取时间间隔
    NSTimeInterval interval = [stopDate timeIntervalSinceDate:startDate] + 0.5;
    if (interval < 1.f) {
        return 1;
    }
    return (NSInteger)interval;
}

+ (NSString *)getSecondDurationStringWithStartDate:(NSDate *)startDate {
    NSInteger duration = [self getSecondDurationWithStartDate:startDate];
    return [NSString stringWithFormat:@"%ld",duration];
}

+ (NSString *)getTimeStringWithDate:(NSDate *)date
{
    if (!date) {
        date = [self getLocalDate];
    }
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [fmt stringFromDate:date];

//    // 避免出现1960-01-01 08:00:00 的情况
//    if (timerNumber  == 0) {
//        return nil;
//    }
//    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
//    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
//    return [fmt stringFromDate:[NSDate dateWithTimeIntervalSince1970:timerNumber/1000]];

}

+ (NSString *)getTimeStamp {
    NSDate *date = [self getLocalDate];
    NSTimeInterval interval = [date timeIntervalSince1970];
    NSString *timeStamp = [NSString stringWithFormat:@"%ld",(NSInteger)interval];
    if (!timeStamp) {
        return @"0";
    }
    return timeStamp;
}
@end
