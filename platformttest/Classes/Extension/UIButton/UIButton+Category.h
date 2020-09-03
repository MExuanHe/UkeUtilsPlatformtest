//
//  UIButton+Category.h
//  ZMUke
//
//  Created by zhangmen on 2018/11/6.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Category)

#pragma mark - 初始化
// MARK: CommonRed
+ (instancetype)buttonRedWithTarget:(id)target title:(NSString *)title font:(UIFont *)font action:(SEL)action;
// MARK: CommonWhite
+ (instancetype)buttonWhiteWithTarget:(id)target title:(NSString *)title font:(UIFont *)font action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
