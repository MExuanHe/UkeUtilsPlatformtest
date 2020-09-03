//
//  UIImageView+KLKit.m
//  KLKit
//
//  Created by liqian on 2018/03/22.
//  Copyright © 2018 liqian. All rights reserved.
//

#import "UIImageView+KLKit.h"

@implementation UIImageView (KLKit)

- (id<KLProperty>)kl_default {
    return self.kl_contentMode(UIViewContentModeScaleToFill);
}

- (id<KLProperty> (^)(UIImage *))kl_ivImage {
    return ^id<KLProperty> (UIImage *image) {
        self.image = image;
        return self;
    };
}

- (id<KLProperty> (^)(BOOL))kl_ivEnabled {
    return ^id<KLProperty> (BOOL enabled) {
        self.userInteractionEnabled = enabled;
        return self;
    };
}

@end
