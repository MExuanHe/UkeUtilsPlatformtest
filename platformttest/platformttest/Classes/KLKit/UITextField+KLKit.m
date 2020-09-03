//
//  UITextField+KLKit.m
//  KLKit
//
//  Created by liqian on 2018/03/22.
//  Copyright © 2018 liqian. All rights reserved.
//


#import "UITextField+KLKit.h"

@implementation UITextField (KLKit)

- (id<KLProperty>)kl_default {
    return self.kl_tfBorderStyle(UITextBorderStyleRoundedRect);
}

- (id<KLProperty> (^)(UITextBorderStyle))kl_tfBorderStyle {
    return ^id<KLProperty> (UITextBorderStyle style) {
        self.borderStyle = style;
        return self;
    };
}

- (id<KLProperty> (^)(NSString *))kl_tfText {
    return ^id<KLProperty> (NSString *text) {
        self.text = text;
        return self;
    };
}

- (id<KLProperty> (^)(UIColor *))kl_tfTextColor {
    return ^id<KLProperty> (UIColor *color) {
        self.textColor = color;
        return self;
    };
}

- (id<KLProperty> (^)(u_int64_t))kl_tfTextColorHex {
    return ^id<KLProperty> (u_int64_t hex) {
        UIColor *color = [self _colorFromHexValue:hex];
        self.textColor = color;
        return self;
    };
}

- (id<KLProperty> (^)(UIFont *))kl_tfFont {
    return ^id<KLProperty> (UIFont *font) {
        self.font = font;
        return self;
    };
}

- (id<KLProperty> (^)(NSString *))kl_tfPlaceHolderText {
    return ^id<KLProperty> (NSString *text) {
        self.placeholder = text;
        return self;
    };
}


- (void)kl_limitTextWithLength:(NSInteger)maxLength outLimit:(void (^)(void))outLimit {
//    NSString *currentString = self.text;
//
//    NSString *language = [[UIApplication sharedApplication] textInputMode].primaryLanguage;
//    if ([language isEqualToString:@"zh-Hans"]) {
//        UITextRange *markedRange = [self markedTextRange];
//        if (markedRange.isEmpty == NO) {
//            return;
//        }
//
//        UITextPosition *position = [self positionFromPosition:markedRange.start offset:0];
//        if (position) {
//            return;
//        }
//
//        if (currentString.length > maxLength) {
//            self.text = [currentString substringToIndex:maxLength];
//            if (outLimit) {
//                outLimit();
//            }
//        }
//    }else {
//        if (currentString.length > maxLength) {
//            NSString *trimed = [currentString substringToIndex:maxLength];
//            self.text = trimed;
//            if (outLimit) {
//                outLimit();
//            }
//        }
//    }
}


- (UIColor *)_colorFromHexValue:(u_int64_t)hex {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0 alpha:1.0];
}


@end
