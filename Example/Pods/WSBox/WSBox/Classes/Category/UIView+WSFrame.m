

#import "UIView+WSFrame.h"

@implementation UIView (WSFrame)

+ (instancetype)ws_viewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setX_ws:(CGFloat)x_ws
{
    CGRect frame = self.frame;
    frame.origin.x = x_ws;
    self.frame = frame;
}

- (CGFloat)x_ws
{
    return self.frame.origin.x;
}

-(void)setY_ws:(CGFloat)y_ws
{
    CGRect frame = self.frame;
    frame.origin.y = y_ws;
    self.frame = frame;
}

- (CGFloat)y_ws
{
    return self.frame.origin.y;
}

- (void)setWidth_ws:(CGFloat)width_ws
{
    CGRect frame = self.frame;
    frame.size.width = width_ws;
    self.frame = frame;
}

- (CGFloat)width_ws
{
    return self.frame.size.width;
}

- (void)setHeight_ws:(CGFloat)height_ws
{
    CGRect frame = self.frame;
    frame.size.height = height_ws;
    self.frame = frame;
}

- (CGFloat)height_ws
{
    return self.frame.size.height;
}

- (void)setCenterX_ws:(CGFloat)centerX_ws
{
    CGPoint center = self.center;
    center.x = centerX_ws;
    self.center = center;
}

- (CGFloat)centerX_ws
{
    return self.center.x;
}

- (void)setCenterY_Ws:(CGFloat)centerY_Ws
{
    CGPoint center = self.center;
    center.y = centerY_Ws;
    self.center = center;
}

- (CGFloat)centerY_Ws
{
    return self.center.y;
}

@end
