//
//  UIButton+KLKit.m
//  KLKit
//
//  Created by liqian on 2018/03/22.
//  Copyright © 2018 liqian. All rights reserved.
//

#import "UIButton+KLKit.h"
#import <objc/runtime.h>
#import "UkeGlobalDefines.h"
const void *layoutTypeKey = "com.kaleo.klkit.layoutTypeKey";
const void *contentSpacingKey = "com.kaleo.klkit.contentSpacingKey";

@implementation UIButton (KLKit)

+ (UIButton *)customButton {
    return [UIButton buttonWithType:UIButtonTypeCustom];
}

- (id<KLProperty>)kl_default {
    return self.kl_frame(20, 50, 80, 30)
    .kl_bgColor([UIColor orangeColor])
    .kl_btnTitle(@"Button", KLNormal);
}

- (id<KLProperty> (^)(NSString *, KLControlState))kl_btnTitle {
    return ^id<KLProperty> (NSString *title, KLControlState state) {
        UIControlState _state = (UIControlState)state;
        [self setTitle:title forState:_state];
        return self;
    };
}

- (id<KLProperty> (^)(UIFont *))kl_font {
    return ^id<KLProperty> (UIFont *font) {
        self.titleLabel.font = font;
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat))kl_fontSize {
    return ^id<KLProperty> (CGFloat fontSize) {
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat))kl_fontSizeMedium {
    return ^id<KLProperty> (CGFloat fs) {
        self.titleLabel.font = UkeFontMedium(fs);
        return self;
    };
}

- (id<KLProperty> (^)(CGFloat))kl_fontSizeBold {
    return ^id<KLProperty> (CGFloat fs) {
        self.titleLabel.font = [UIFont boldSystemFontOfSize:fs];
        return self;
    };
}

- (id<KLProperty> (^)(UIColor *, KLControlState))kl_btnTitleColor {
    return ^id<KLProperty> (UIColor *color, KLControlState state) {
        UIControlState _state = (UIControlState)state;
        [self setTitleColor:color forState:_state];
        return self;
    };
}

- (id<KLProperty> (^)(u_int64_t, KLControlState))kl_btnTitleColorHex {
    return ^id<KLProperty> (u_int64_t hex, KLControlState state) {
        UIColor *_color = [self _colorFromHexValue:hex];
        UIControlState _state = (UIControlState)state;
        [self setTitleColor:_color forState:_state];
        return self;
    };
}

- (id<KLProperty> (^)(UIImage *, KLControlState))kl_btnImage {
    return ^id<KLProperty> (UIImage *image, KLControlState state) {
        UIControlState _state = (UIControlState)state;
        [self setImage:image forState:_state];
        return self;
    };
}

- (id<KLProperty> (^)(UIImage *, KLControlState))kl_btnBgImage {
    return ^id<KLProperty> (UIImage *image, KLControlState state) {
        UIControlState _state = (UIControlState)state;
        [self setBackgroundImage:image forState:_state];
        return self;
    };
}

- (id<KLProperty> (^)(id, SEL))kl_btnAction {
    return ^id<KLProperty> (id target, SEL sel) {
        [self addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

- (UIColor *)_colorFromHexValue:(u_int64_t)hex {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0 alpha:1.0];
}

@end
