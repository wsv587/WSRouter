
#import <UIKit/UIKit.h>

@interface UIView (WSFrame)
@property (nonatomic, assign) CGFloat x_ws;
@property (nonatomic, assign) CGFloat y_ws;
@property (nonatomic, assign) CGFloat width_ws;
@property (nonatomic, assign) CGFloat height_ws;
@property (nonatomic, assign) CGFloat centerX_ws;
@property (nonatomic, assign) CGFloat centerY_Ws;

/** 从xib中创建一个控件 */
+ (instancetype)ws_viewFromXib;
@end
