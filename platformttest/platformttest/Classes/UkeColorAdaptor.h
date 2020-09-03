//
//  UkeColorAdaptor.h
//  ZMUke
//
//  Created by DengFeng.Su on 2020/3/26.
//  Copyright © 2020 zmlearn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UkeColorAdaptor : NSObject

/**
 使用 -[UIColor colorNamed:]获取颜色，该API只支持iOS 11以上的系统
 */
+ (nullable UIColor *)uke_colorWithName:(NSString *)colorName  API_AVAILABLE(ios(11.0));

/**
 使用hex数值获取颜色
 @param hex 颜色的十六进制值，0x000000 0xFFFFEE
 @param alpha 颜色透明度, default is 1, between with 0 and 1
 */
+ (nullable UIColor *)uke_colorWithHex:(UInt64)hex;
+ (nullable UIColor *)uke_colorWithHex:(UInt64)hex alpha:(CGFloat)alpha;

/**
 获取到动态颜色值，iOS 13之后使用的是动态颜色值，iOS 13之前获取到的是lightColorHex颜色值
 */
+ (nullable UIColor *)uke_colorWithLightColorHex:(UInt64)lightColorHex darkColorHex:(UInt64)darkColorHex;
+ (nullable UIColor *)uke_colorWithLightColorHex:(UInt64)lightColorHex lightAlpha:(CGFloat)lightAlpha
                           darkColorHex:(UInt64)darkColorHex darkAlpha:(CGFloat)darkAlpha;
 
/**
 使用两个静态颜色合为一个动态颜色, iOS 13之前获取到的还是静态颜色
 */
+ (nullable UIColor *)uke_dynamicColorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;

/**
 使用block生成动态图片
 */
+ (nullable UIColor *)uke_dynamicColorWithLightColorBlock:(UIColor *(^)())lightColorBlock darkColorBlock:(UIColor *(^)())darkColorBlock;

/** 返回动态颜色 */
+ (nullable UIColor *(^)(UIColor *lightColor, UIColor *darkColor))uke_dynamicColor;
+ (nullable UIColor *(^)(UInt64 lightColorHex, UInt64 darkColorHex))uke_dynamicColorByHex;

@end


@interface UIColor (Uke_DarkMode)

/** 返回动态颜色，传入参数为深色模式下的颜色 */
- (UIColor *(^)(UIColor *))uke_darkColor;
- (UIColor *(^)(UInt64 ))uke_darkColorByHex;

@end

NS_ASSUME_NONNULL_END
