//
//  UkeColorAdaptor.m
//  ZMUke
//
//  Created by DengFeng.Su on 2020/3/26.
//  Copyright © 2020 zmlearn. All rights reserved.
//

#import "UkeColorAdaptor.h"

@implementation UkeColorAdaptor

+ (UIColor *)uke_colorWithHex:(UInt64)hex {
    
    return [self uke_colorWithHex:hex alpha:1.f];
}

+ (UIColor *)uke_colorWithHex:(UInt64)hex alpha:(CGFloat)alpha {
    
    UInt16 red = (0xFF0000 & hex) >> 16;
    UInt16 green = (0xFF00 & hex) >> 8;
    UInt16 blue = (0xFF & hex);
    
    return [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:alpha];
}

+ (UIColor *)uke_colorWithName:(NSString *)colorName {
    
    if (@available(iOS 11, *)) {
        return [UIColor colorNamed:colorName];
    }
    return nil;
}

+ (UIColor *)uke_colorWithLightColorHex:(UInt64)lightColorHex darkColorHex:(UInt64)darkColorHex {
    
    return [self uke_colorWithLightColorHex:lightColorHex lightAlpha:1.f darkColorHex:darkColorHex darkAlpha:1.f];
}

+ (UIColor *)uke_colorWithLightColorHex:(UInt64)lightColorHex lightAlpha:(CGFloat)lightAlpha
                           darkColorHex:(UInt64)darkColorHex darkAlpha:(CGFloat)darkAlpha {
    
//    if (@available(iOS 13, *)) {
//        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
//            if (nil == traitCollection) {
//                traitCollection = [UITraitCollection currentTraitCollection];
//            }
//
//            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
//                return [self uke_colorWithHex:darkColorHex alpha:darkAlpha];
//            } else {
//                return [self uke_colorWithHex:lightColorHex alpha:lightAlpha];
//            }
//        }];
//    }
    return [self uke_colorWithHex:lightColorHex alpha:lightAlpha];
}

+ (UIColor *)uke_dynamicColorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor {
    
//    if (@available(iOS 13, *)) {
//        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
//            if (nil == traitCollection) {
//                traitCollection = UITraitCollection.currentTraitCollection;
//            }
//
//            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
//                return darkColor;
//            } else {
//                return lightColor;
//            }
//        }];
//    }
    
    return lightColor;
}

+ (UIColor *(^)(UIColor *lightColor, UIColor *darkColor))uke_dynamicColor {
    
    return ^(UIColor *lightColor, UIColor *darkColor) {
        
        return [self uke_dynamicColorWithLightColor:lightColor darkColor:darkColor];
    };
}

+ (UIColor *(^)(UInt64 lightColorHex, UInt64 darkColorHex))uke_dynamicColorByHex {
    
    return ^(UInt64 lightColorHex, UInt64 darkColorHex) {
        
        return [self uke_colorWithLightColorHex:lightColorHex darkColorHex:darkColorHex];
    };
}

+ (UIColor *)uke_dynamicColorWithLightColorBlock:(UIColor *(^)())lightColorBlock darkColorBlock:(UIColor *(^)())darkColorBlock {
    
    if (!lightColorBlock || !darkColorBlock) {
        return nil;
    }
    
    UIColor *result = nil;
//    if (@available(iOS 13, *)) {
//        result = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
//            if (nil == traitCollection) {
//                traitCollection = UITraitCollection.currentTraitCollection;
//            }
//
//            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
//                return darkColorBlock();
//            } else {
//                return lightColorBlock();
//            }
//        }];
//    } else {
        result = lightColorBlock();
//    }
    
    return result;
}

@end

@implementation UIColor (Uke_DarkMode)

- (UIColor *(^)(UIColor *))uke_darkColor {
    return ^(UIColor *color) {
        
//        if (@available(iOS 13, *)) {
//            return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
//                if (nil == traitCollection) {
//                    traitCollection = UITraitCollection.currentTraitCollection;
//                }
//
//                if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
//                    return color;
//                } else {
//                    return self;
//                }
//            }];
//        }
        return self;
    };
}

- (UIColor *(^)(UInt64 ))uke_darkColorByHex {
    return ^(UInt64 colorHex) {
        
//        if (@available(iOS 13, *)) {
//            return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
//                if (nil == traitCollection) {
//                    traitCollection = UITraitCollection.currentTraitCollection;
//                }
//
//                if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
//                    return [UkeColorAdaptor uke_colorWithHex:colorHex];
//                } else {
//                    return self;
//                }
//            }];
//        }
        return self;
    };
}

@end
