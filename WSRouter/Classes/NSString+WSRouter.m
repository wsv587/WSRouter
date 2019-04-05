//
//  NSString+WSRouter.m
//  Pods-WSRouter_Example
//
//  Created by sw on 2019/4/5.
//

#import "NSString+WSRouter.h"

@implementation NSString (WSRouter)
+ (NSDictionary *)ws_parameterFromURLQuery:(NSString *)URLQuery {
    return [self ws_parameterFromURLQuery:URLQuery decode:YES];
}

+ (NSDictionary *)ws_parameterFromURLQuery:(NSString *)URLQuery decode:(BOOL)decode {
    NSMutableDictionary *paragrmsDict = [NSMutableDictionary dictionaryWithCapacity:0];
    NSArray *queryStringPairs = [URLQuery componentsSeparatedByString:@"&"];
    [queryStringPairs enumerateObjectsUsingBlock:^(NSString *queryStringPair, NSUInteger idx, BOOL *stop) {
        NSRange range = [queryStringPair rangeOfString:@"="];
        if (range.location != NSNotFound) {
            NSString *key = [queryStringPair substringToIndex:range.location];
            NSString *value = [queryStringPair substringFromIndex:range.location + 1];
            if (decode) {
                value = [NSString ws_decode:value];
            }
            [paragrmsDict setValue:value forKey:key];
        }
    }];
    return paragrmsDict;
}

+ (NSString *)ws_decode:(NSString *)obj {
    if (![obj length]) return @"";
    CFStringRef unescapedString = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                          (__bridge CFStringRef)obj,
                                                                                          CFSTR(""),
                                                                                          kCFStringEncodingUTF8);
    return (__bridge_transfer NSString *)unescapedString;
}

@end
