//
//  UIViewController+NavigationBarAppearance.m
//  ZMUke
//
//  Created by liqian on 2018/10/24.
//  Copyright © 2018 zmlearn. All rights reserved.
//

#import "UIViewController+NavigationBarAppearance.h"
#import "UkeColorDefine.h"
#import "UkeGlobalDefines.h"
#import <objc/runtime.h>

const void * navigationBarConfigurationsKey = "com.kl.navigationBarConfigurationsKey";
const void * navigationBarTintColorKey = "com.kl.navigationBarTintColorKey";
const void * navigationBarBackgroundColorKey = "com.kl.navigationBarBackgroundColorKey";

@implementation UIViewController (NavigationBarAppearance) 

- (void)kl_setNavigationBarMode:(NavigationBarMode)mode {
    if (mode == NavigationBarModeNone) {
        return;
    }
    
    YPNavigationBarConfigurations confs = YPNavigationBarConfigurationsDefault;
    
    UIColor *barTintColor = nil;
    UIColor *barBackgroundColor = nil;
    UIColor *barTitleColor = kBarTitleColor;
    switch (mode) {
        case NavigationBarModeHide: {
            confs = YPNavigationBarHidden;
        }break;
            
        case NavigationBarModeOpaqueAndStatusBarLightContent: {
            confs |= (YPNavigationBarShow|
            YPNavigationBarStyleBlack|
            YPNavigationBarBackgroundStyleOpaque|
            YPNavigationBarBackgroundStyleColor|
            YPNavigationBarShowShadowImage);
            barBackgroundColor = kBarBgColor;
            barTintColor = kBarTintColor;
            barTitleColor = [UIColor whiteColor];
        }break;
            
        case NavigationBarModeOpaqueAndStatusBarBlackOpaque: {
            confs |= (YPNavigationBarShow|
            YPNavigationBarStyleLight|
            YPNavigationBarBackgroundStyleOpaque|
            YPNavigationBarBackgroundStyleColor|
            YPNavigationBarShowShadowImage);
            barBackgroundColor = kBarBgColor;
            barTintColor = kBarTintColor;
        }break;
            
        case NavigationBarModeTransparentAndStatusBarLightContent: {
            confs |= (YPNavigationBarShow|
            YPNavigationBarStyleBlack|
            YPNavigationBarBackgroundStyleTransparent|
            YPNavigationBarBackgroundStyleColor);
            barTintColor = [UIColor whiteColor];
            barTitleColor = [UIColor whiteColor];
        }break;
            
        case NavigationBarModeTransparentAndStatusBarBlackOpaque: {
            confs |= (YPNavigationBarShow|
            YPNavigationBarStyleLight|
            YPNavigationBarBackgroundStyleTransparent|
            YPNavigationBarBackgroundStyleColor);
            barTintColor = kBarTintColor;
        }break;
            
        case NavigationBarModeDefaultAndHideShadowImage: {
            confs |= (YPNavigationBarShow|
                      YPNavigationBarStyleLight|
                      YPNavigationBarBackgroundStyleOpaque|
                      YPNavigationBarBackgroundStyleColor);
            barTintColor = kBarTintColor;
            barBackgroundColor = kBarBgColor;
        }break;
            
        default: {
            confs |= (YPNavigationBarShow|
            YPNavigationBarStyleLight|
            YPNavigationBarBackgroundStyleOpaque|
            YPNavigationBarBackgroundStyleColor|
            YPNavigationBarShowShadowImage);
            barTintColor = kBarTintColor;
            barBackgroundColor = kBarBgColor;
        }break;
    }
    
    if (@available(iOS 13, *)) {
        barTintColor = [barTintColor resolvedColorWithTraitCollection:self.traitCollection];
        barTitleColor = [barTitleColor resolvedColorWithTraitCollection:self.traitCollection];
        barBackgroundColor = [barBackgroundColor resolvedColorWithTraitCollection:self.traitCollection];
    }
    
    if ([self respondsToSelector:@selector(setTitleColor:)]) {
        [self performSelector:@selector(setTitleColor:) withObject:barTitleColor];
    }
    
    objc_setAssociatedObject(self, navigationBarConfigurationsKey, @(confs), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, navigationBarTintColorKey, barTintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, navigationBarBackgroundColorKey, barBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (YPNavigationBarConfigurations)yp_navigtionBarConfiguration {
    NSInteger confs = [objc_getAssociatedObject(self, navigationBarConfigurationsKey) integerValue];
    return confs;
}

- (UIColor *)yp_navigationBarTintColor {
    UIColor *color = objc_getAssociatedObject(self, navigationBarTintColorKey);
    return color;
}

- (UIColor *)yp_navigationBackgroundColor {
    UIColor *color = objc_getAssociatedObject(self, navigationBarBackgroundColorKey);
    return color;
}

@end




@implementation UIViewController (NavigationBarAppearanceYP)

- (void)setYPNavigationBarConfigurations:(YPNavigationBarConfigurations)confs {
    objc_setAssociatedObject(self, navigationBarConfigurationsKey, @(confs), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setYPNavigationBarTintColor:(UIColor *)color {
    objc_setAssociatedObject(self, navigationBarTintColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setYPNavigationBarBackgroundColor:(UIColor *)color {
    objc_setAssociatedObject(self, navigationBarBackgroundColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (YPNavigationBarConfigurations) yp_navigtionBarConfiguration {
    NSInteger confs = [objc_getAssociatedObject(self, navigationBarConfigurationsKey) integerValue];
    return confs;
}

- (UIColor *) yp_navigationBarTintColor {
    UIColor *color = objc_getAssociatedObject(self, navigationBarTintColorKey);
    return color;
}

- (UIColor *)yp_navigationBackgroundColor {
    UIColor *color = objc_getAssociatedObject(self, navigationBarBackgroundColorKey);
    return color;
}

@end


