//
//  NSString+WSExtension.h
//  AliyunSales
//
//  Created by wangsong on 16/7/15.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WSExtension)
/**
 *  获取沙盒document的路径
 *
 *  @return 返回路径字符串
 */
+ (NSString *)ws_getDocumentsPath;
/**
 *  获取沙盒caches的路径
 *
 *  @return 返回路径字符串
 */
+ (NSString *)ws_getCachesPath;
/**
 *  caches的路径后面拼接文件名
 *
 *  @return 返回路径字符串
 */
+ (NSString *)ws_getCachesPathWithFileName:(NSString *)fileName;

#pragma mark - URL编码解码
/**
 *  将一个URL字符串的参数解析到一个字典并返回
 *  decode：是否需要解码
 *  @return 返回一个包含URL所有参数的字典
 */
- (NSDictionary *)ws_dictionaryByParseInURLParameterFormatWithDecoding:(BOOL)decode;
/**
 *  将一个URL字符串解码
 *  @return 返回一个解码后的URL字符串
 */
- (NSString *)ws_urlDecode;
/**
 *  将一个URL字符串编码
 *  @return 返回一个编码后的URL字符串
 */
- (NSString *)ws_urlEncode;

@end
