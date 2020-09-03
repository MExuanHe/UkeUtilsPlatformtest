//
//  UITextField+KLKit.h
//  KLKit
//
//  Created by liqian on 2018/03/22.
//  Copyright © 2018 liqian. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "KLProperty.h"

@interface UITextField (KLKit) <KLProperty>
- (void)kl_limitTextWithLength:(NSInteger)maxLength outLimit:(void (^)(void))outLimit;
@end
