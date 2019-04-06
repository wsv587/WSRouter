//
//  NSFileManager+WSExtension.h
//  AliyunSales
//
//  Created by wangsong on 16/7/13.
//  Copyright © 2016年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (WSExtension)
/**
 *  移除Documents文件夹下指定后缀的文件
 *
 *  @param postfix 后缀名
 *
 *  @return 移除文件的个数
 */
+ (NSInteger)ws_removeItemFromCachesWithPostfix:(NSString *)postfix;
/**
 *  移除documents文件夹下的指定文件
 *
 *  @param fileName 文件名
 *
 *  @return 是否移除成功
 */
+ (BOOL)ws_removeItemFromCachesWithFileName:(NSString *)fileName;

@end
