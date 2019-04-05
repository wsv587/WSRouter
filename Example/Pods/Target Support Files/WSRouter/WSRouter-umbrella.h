#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSString+WSRouter.h"
#import "WSRouter.h"
#import "WSRouterHandler.h"

FOUNDATION_EXPORT double WSRouterVersionNumber;
FOUNDATION_EXPORT const unsigned char WSRouterVersionString[];

