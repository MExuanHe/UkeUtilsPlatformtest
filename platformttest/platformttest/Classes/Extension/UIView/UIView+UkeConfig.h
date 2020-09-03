//
//  UIView+UkeConfig.h
//  ZMUke
//
//  Created by chris.chen on 2019/7/13.
//  Copyright © 2019 zmlearn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 优课项目通用配置 **/
@interface UIView (UkeConfig)

#pragma
#pragma mark - 边框 -

- (void)borderCommonConfigWithColor:(UIColor *)borderColor;//边框为0.5pt

- (void)borderConfigWithColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth;

#pragma
#pragma mark - 阴影 -
- (void)shadowCommonConfigWithColor:(UIColor *)shadowColor;//shadowRadius: 8; shadowOffset:(0, 4)

- (void)shadowConfigWithColor:(UIColor *)shadowColor shadowRadius:(CGFloat)shadowRadius shadowOffset:(CGSize)shadowOffset;


#pragma mark - 圆角
- (void)roundedRectWithRectCorner:(UIRectCorner)rectCorner
                     cornerRadius:(CGFloat)cornerRadius;


#pragma mark - 圆角 8.f & 边框 0.5 0xF6F6F6 & 阴影 0x2E5373(6%)
- (void)addNormalBorderAndShadowAndCornerRadius;

@end

NS_ASSUME_NONNULL_END
