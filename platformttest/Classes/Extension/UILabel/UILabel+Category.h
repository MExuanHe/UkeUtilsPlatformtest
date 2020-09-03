//
//  UILabel+Category.h
//  ZMUke
//
//  Created by zhangmen on 2018/11/6.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Category)

#pragma mark - 初始化(base)
+ (instancetype)labeltWithColor:(UIColor *)color font:(UIFont *)font;

+ (instancetype)labeltWithTitle:(nullable NSString *)title color:(UIColor *)color font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
