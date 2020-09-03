//
//  UIButton+Category.m
//  ZMUke
//
//  Created by zhangmen on 2018/11/6.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import "UIButton+Category.h"
#import "UkeColorDefine.h"
#import "UkeGlobalDefines.h"
#import "UIView+UkeConfig.h"
#import "NSObject+Category.h"
@implementation UIButton (Category)

#pragma mark - 初始化
// MARK: CommonRed
+ (instancetype)buttonRedWithTarget:(id)target title:(NSString *)title font:(UIFont *)font action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = font;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:UkeColorHex(0xFFFFFF) forState:UIControlStateNormal];
    [button setTitleColor:UkeAdaptColor(0xFFFFFF, 0x999999) forState:UIControlStateDisabled];

    [button setBackgroundImage:[self imageWithColor:UkeColorHex(0xEF4C4F)] forState:UIControlStateNormal];
    [button setBackgroundImage:[self imageWithColor:UkeColorHex(0xD6D7DA)] forState:UIControlStateDisabled];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
// MARK: CommonWhite
+ (instancetype)buttonWhiteWithTarget:(id)target title:(NSString *)title font:(UIFont *)font action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = font;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:UkeColorHex(0x333333) forState:UIControlStateNormal];
    [button setTitleColor:UkeColorHex(0xFFFFFF) forState:UIControlStateDisabled];
    
    [button setBackgroundImage:[self imageWithColor:UkeColorHex(0xFFFFFF)] forState:UIControlStateNormal];
    [button setBackgroundImage:[self imageWithColor:UkeColorHex(0xD6D7DA)] forState:UIControlStateDisabled];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [button borderCommonConfigWithColor:UkeColorHex(0xEEEEEE)];
    return button;
}

@end
