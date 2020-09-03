//
//  UITextView+KLKit.h
//  KLKit
//
//  Created by liqian on 2018/03/22.
//  Copyright © 2018 liqian. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UITextView (KLKit)

- (void)kl_limitTextWithLength:(NSInteger)maxLength outLimit:(void(^)(void))outLimit;

- (void)kl_limitTextWithLength:(NSInteger)maxLength
        countingNonASCIICharacterAsTwo:(BOOL)asTwo
                      outLimit:(void (^)(void))outLimit;

@end
