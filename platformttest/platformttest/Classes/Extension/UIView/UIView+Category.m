//
//  UIView+Category.m
//  ZMUke
//
//  Created by zhangmen on 2019/9/7.
//  Copyright © 2019 zmlearn. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (void)drawViewCornerRadiusWithCorners:(UIRectCorner)corners radius:(CGFloat)radius
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:(CGSize){radius}];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    self.layer.mask = shapeLayer;
}

@end
