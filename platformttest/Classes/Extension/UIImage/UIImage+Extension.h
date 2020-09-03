//
//  UIImage+Extension.h
//  ZMUke
//
//  Created by liqian on 2018/12/8.
//  Copyright © 2018 zmlearn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)

//! 为一张图片加上上下左右padding并返回一张新的图片
- (UIImage *)imageWithSpacingExtensionInsets:(UIEdgeInsets)insets;

//! 为一张图片设置透明度并返回一张新的图片
- (UIImage *)imageWithAlpha:(CGFloat)alpha;

//! 为一张图片tint上一个指定的颜色
- (UIImage *)uke_imageWithTintColor:(UIColor *)tintColor;

//! 通过颜色生成一张图片
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

//! 通过渐变颜色生成一张图片 横向从左到右
+ (UIImage *)imageWithGradientColorFrom:(UIColor *)fromColor toColor:(UIColor *)toColor;
+ (UIImage *)imageWithGradientColorFrom:(UIColor *)fromColor toColor:(UIColor *)toColor size:(CGSize)size;

//! 竖向从上到下
+ (UIImage *)imageWithVerticalGradientColorFrom:(UIColor *)fromColor toColor:(UIColor *)toColor;

+ (UIImage *)imageWithGradientColorFrom:(UIColor *)fromColor
                                toColor:(UIColor *)toColor
                           isHorizontal:(BOOL) isHorizontal
                                   size:(CGSize)size;

+ (UIImage *)imageWithGradientColorFrom:(UIColor *)fromColor
                                toColor:(UIColor *)toColor
                             startPoint:(CGPoint)startPoint
                               endPoint:(CGPoint)endPoint
                                   size:(CGSize)size;

//! 判断图片是否存在alpha通道
- (BOOL)hasAlphaChannel;



/**
 Returns a vertically flipped image. ⥯
 */
- (nullable UIImage *)imageByFlipVertical;

/**
 Returns a horizontally flipped image. ⇋
 */
- (nullable UIImage *)imageByFlipHorizontal;


- (nullable UIImage *)imageByResizeToSize:(CGSize)size;

/**
 将图片变暗
 @param level 改变图片的亮度，范围 0 - 1
 */
- (nullable UIImage *)imageDarkenWithLevel:(CGFloat )level;

+ (UIImage *)imageInBundleWithName:(NSString *)name;

+ (UIImage *)imageInSelfDetectionBundleWithName:(NSString *)name;

+ (UIImage *)imageInLiveCourseBundleWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
