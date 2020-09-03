//
//  UILabel+Category.m
//  ZMUke
//
//  Created by zhangmen on 2018/11/6.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

#pragma mark - 初始化(base)
+ (instancetype)labeltWithColor:(UIColor *)color font:(UIFont *)font {
    return [UILabel labeltWithTitle:nil color:color font:font];
}

+ (instancetype)labeltWithTitle:(nullable NSString *)title color:(UIColor *)color font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = color;
    label.font = font;
    label.text = title;
    [label sizeToFit];
    return label;
}

@end
