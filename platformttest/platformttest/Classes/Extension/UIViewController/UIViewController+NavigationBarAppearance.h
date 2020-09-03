//
//  UIViewController+NavigationBarAppearance.h
//  ZMUke
//
//  Created by liqian on 2018/10/24.
//  Copyright © 2018 zmlearn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YPNavigationBarTransition/YPNavigationBarTransition.h>

typedef NS_ENUM(NSInteger, NavigationBarMode) {
    NavigationBarModeNone = -1,
    NavigationBarModeDefault = 0, // 默认：导航栏白色不透明，标题黑色，按钮黑色，状态栏文字黑色
    NavigationBarModeHide = 1, // 导航栏隐藏
    NavigationBarModeOpaqueAndStatusBarLightContent = 2, // 导航栏白色不透明，标题白色，按钮黑色，状态栏文字白色
    NavigationBarModeOpaqueAndStatusBarBlackOpaque = 3, // 导航栏白色不透明，标题黑色，按钮黑色，状态栏文字黑色
    NavigationBarModeTransparentAndStatusBarLightContent = 4, // 导航栏全透明，标题白色，按钮白色，状态栏文字白色
    NavigationBarModeTransparentAndStatusBarBlackOpaque = 5, // 导航栏全透明，标题黑色，按钮黑色，状态栏文字黑色
    NavigationBarModeDefaultAndHideShadowImage = 6, // 导航栏白色不透明，标题黑色，按钮黑色，状态栏文字黑色，隐藏线
};

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (NavigationBarAppearance) <YPNavigationBarConfigureStyle>

- (void)kl_setNavigationBarMode:(NavigationBarMode)mode;

@end




/* 如果上面的枚举值不能满足要求，可以重载下面3个方法完全自定义导航栏及状态栏 */
@interface UIViewController (NavigationBarAppearanceYP) <YPNavigationBarConfigureStyle>

/* 但会导航栏的样式，可以控制导航栏是否显示，状态栏的样式，是否显示shadowImage... */
- (void)setYPNavigationBarConfigurations:(YPNavigationBarConfigurations)confs;

/* 返回导航栏按钮的颜色 */
- (void)setYPNavigationBarTintColor:(UIColor *)color;

/* 返回导航栏的背景颜色 */
- (void)setYPNavigationBarBackgroundColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
