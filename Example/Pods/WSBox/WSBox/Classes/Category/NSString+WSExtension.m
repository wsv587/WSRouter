//
//  NSString+WSExtension.m
//  AliyunSales
//
//  Created by wangsong on 16/7/15.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import "NSString+WSExtension.h"

@implementation NSString (WSExtension)
+ (NSString *)ws_getDocumentsPath {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return path;
}

+ (NSString *)ws_getCachesPath {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return path;
}

+ (NSString *)ws_getCachesPathWithFileName:(NSString *)fileName {
    NSString *fullPath =[[self ws_getCachesPath] stringByAppendingPathComponent:fileName.lastPathComponent];
    return fullPath;
}

#pragma mark - URL编码解码
- (NSDictionary *)ws_dictionaryByParseInURLParameterFormatWithDecoding:(BOOL)decode
{
    NSMutableDictionary *paragrmsDict = [NSMutableDictionary dictionaryWithCapacity:0];
    NSArray *queryStringPairs = [self componentsSeparatedByString:@"&"];
    [queryStringPairs enumerateObjectsUsingBlock:^(NSString *queryStringPair, NSUInteger idx, BOOL *stop) {
        NSRange range = [queryStringPair rangeOfString:@"="];
        if (range.location != NSNotFound) {
            NSString *key = [queryStringPair substringToIndex:range.location];
            NSString *value = [queryStringPair substringFromIndex:range.location + 1];
            if (decode) {
                value = [value ws_urlDecode];
            }
            [paragrmsDict setValue:value forKey:key];
        }
    }];
    return paragrmsDict;
}

- (NSString *)ws_urlDecode {
    if (![self length]) return @"";
    CFStringRef unescapedString = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                          (__bridge CFStringRef)self,
                                                                                          CFSTR(""),
                                                                                          kCFStringEncodingUTF8);
    return (__bridge_transfer NSString *)unescapedString;
}

- (NSString *)ws_urlEncode {
    if (![self length]) return @"";
    CFStringRef static const charsToEscape = CFSTR("!*'();:@&=+$,/?%#[]");
    CFStringRef escapedString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                        (__bridge CFStringRef)self,
                                                                        NULL,
                                                                        charsToEscape,
                                                                        kCFStringEncodingUTF8);
    return (__bridge_transfer NSString *)escapedString;
}
@end
