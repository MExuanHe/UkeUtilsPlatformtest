//
//  UIView+UkeConfig.m
//  ZMUke
//
//  Created by chris.chen on 2019/7/13.
//  Copyright © 2019 zmlearn. All rights reserved.
//

#import "UIView+UkeConfig.h"
#import "UkeColorAdaptor.h"
@implementation UIView (UkeConfig)

- (void)borderCommonConfigWithColor:(UIColor *)borderColor{
    
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = borderColor.CGColor;
}

- (void)borderConfigWithColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth{
    
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.cornerRadius = cornerRadius;
}

- (void)shadowCommonConfigWithColor:(UIColor *)shadowColor{
    
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowRadius = 8.0;
    self.layer.shadowOffset = CGSizeMake(0, 4);
}

- (void)shadowConfigWithColor:(UIColor *)shadowColor shadowRadius:(CGFloat)shadowRadius shadowOffset:(CGSize)shadowOffset {
    
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowRadius = shadowRadius;
    self.layer.shadowOffset = shadowOffset;
}

- (void)roundedRectWithRectCorner:(UIRectCorner)rectCorner
                     cornerRadius:(CGFloat)cornerRadius {
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
}

- (void)addNormalBorderAndShadowAndCornerRadius {
    
    [self borderConfigWithColor:[UkeColorAdaptor uke_dynamicColorWithLightColor:[self colorWithHex:(0xEEEEEE) alpha:1.0] darkColor:UIColor.clearColor] cornerRadius:8.f borderWidth:1.f];
    [self shadowConfigWithColor:[UkeColorAdaptor uke_dynamicColorWithLightColor:[self colorWithHex:(0x2E5373) alpha:0.1f] darkColor:UIColor.clearColor] shadowRadius:6.f shadowOffset:CGSizeMake(0, 3.f)];
    [self.layer setShouldRasterize:true];
    [self.layer setRasterizationScale:[UIScreen mainScreen].scale];
}

- (UIColor *)colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha {

    CGFloat red   = (CGFloat) ((hex & 0xff0000) >> 16) / 255.0f;
    CGFloat green = (CGFloat) ((hex & 0x00ff00) >> 8)  / 255.0f;
    CGFloat blue  = (CGFloat)  (hex & 0x0000ff)        / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
