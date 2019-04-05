//
//  NSString+WSRouter.h
//  Pods-WSRouter_Example
//
//  Created by sw on 2019/4/5.
//

#import <Foundation/Foundation.h>

@interface NSString (WSRouter)
+ (NSDictionary *)ws_parameterFromURLQuery:(NSString *)URLQuery;
+ (NSDictionary *)ws_parameterFromURLQuery:(NSString *)URLQuery decode:(BOOL)decode;
@end
