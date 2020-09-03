//
//  UIView+MasExtension.m
//  ZMUke
//
//  Created by DengFeng.Su on 2019/1/28.
//  Copyright © 2019 zmlearn. All rights reserved.
//

#import "UIView+MasExtension.h"

@implementation UIView (MasExtension)

- (MASViewAttribute *)mas_safeAreaLayoutGuideTopAttribute {
    if (@available(iOS 11.0, *)) {
        return self.mas_safeAreaLayoutGuideTop;
    }
    return self.mas_top;
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideBottomAttribute {
    if (@available(iOS 11.0, *)) {
        return self.mas_safeAreaLayoutGuideBottom;
    }
    return self.mas_bottom;
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideLeftAttribute {
    if (@available(iOS 11.0, *)) {
        return self.mas_safeAreaLayoutGuideLeft;
    }
    return self.mas_left;
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideRightAttribute {
    if (@available(iOS 11.0, *)) {
        return self.mas_safeAreaLayoutGuideRight;
    }
    return self.mas_right;
}

@end
