//
//  UILabel+KLKit.h
//  KLKit
//
//  Created by liqian on 2018/03/22.
//  Copyright © 2018 liqian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLProperty.h"

@interface UILabel (KLKit) <KLProperty>

+ (UILabel *)kl_defaultAlignCenterLabelWithY:(CGFloat)y;

@end
