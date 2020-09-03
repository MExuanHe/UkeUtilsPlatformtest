//
//  UISwitch+Background.m
//  ZMUke
//
//  Created by DengFeng.Su on 2019/7/11.
//  Copyright © 2019 zmlearn. All rights reserved.
//

#import "UISwitch+Background.h"

@implementation UISwitch (Background)

- (void)setUkeBackground:(UIColor *)ukeBackground {
    
    self.backgroundColor = ukeBackground;
    
    self.layer.cornerRadius = CGRectGetHeight(self.bounds)/2;
    self.layer.masksToBounds = YES;
//    [self mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(64.0f, 32.0f));
//    }];
}

- (UIColor *)ukeBackground {
    return self.backgroundColor;
}

@end
