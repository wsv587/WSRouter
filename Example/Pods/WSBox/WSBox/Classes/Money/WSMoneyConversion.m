//
//  AliyunSalesWSMoneyConversions.m
//  YunFu
//
//  Created by ws on 16/12/26.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "WSMoneyConversion.h"

@interface WSMoneyConversion ()<NSDecimalNumberBehaviors>

@end

@implementation WSMoneyConversion
+ (instancetype)shareInstance {
    return [[self alloc] init];
}

static WSMoneyConversion *_instance = nil;
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (NSString *)convertMoney:(id)money {
    if ([money isKindOfClass:[NSString class]]) {
        return [self private_convertMoneyWithString:money];
    }else if ([money isKindOfClass:[NSNumber class]]) {
        return [self private_convertMoneyWithNumber:money];
    } else {
        NSAssert([money isKindOfClass:[NSString class]] || [money isKindOfClass:[NSNumber class]], @"货币类型必须是NSString或NSNumber!");
    }
    return nil;
}

+ (NSString *)private_convertMoneyWithString:(NSString *)string {
    
    NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithString:string];
    WSMoneyConversion *instance = [self shareInstance];
    NSDecimalNumber *decimalNumber = [number decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"0.01"] withBehavior:instance];
    if ([decimalNumber compare:@10000] == NSOrderedAscending) { // 小于10000元 RMB
        return [NSString stringWithFormat:@"%@元",decimalNumber];
    }
    
    decimalNumber = [decimalNumber decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"0.0001"] withBehavior:instance];

    if ([decimalNumber compare:@10000] == NSOrderedAscending) { // 小于10000万 RMB（1亿）
        return [NSString stringWithFormat:@"%@万",decimalNumber];
    }
                                                                // 大于等于一亿 RMB
    decimalNumber = [decimalNumber decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"0.0001"] withBehavior:instance];
    return [NSString stringWithFormat:@"%@亿",decimalNumber];
}

+ (NSString *)private_convertMoneyWithNumber:(NSNumber *)number {
    return [self private_convertMoneyWithString:[number stringValue]];
}

#pragma mark - NSDecimalNumberBehaviors
// 多余位数直接舍弃，不采用四舍五入的方式
- (NSRoundingMode)roundingMode {
    return NSRoundDown;
}

// 精确到小数点后2位
- (short)scale {
    return 2;
}

- (nullable NSDecimalNumber *)exceptionDuringOperation:(SEL)operation error:(NSCalculationError)error leftOperand:(NSDecimalNumber *)leftOperand rightOperand:(nullable NSDecimalNumber *)rightOperand {
    return nil;
}
@end
