//
//  NSString+PasswordStrength.h
//  ZMUke
//
//  Created by DengFeng.Su on 2019/6/24.
//  Copyright © 2019 zmlearn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (PasswordStrength)

- (BOOL)isSameNumber;

// 是否是递减
- (BOOL)isDescend;

// 是否是递增
- (BOOL)isIncrease;

// 分拆个单个字符数组
- (NSArray *)singleCharArray;
@end

NS_ASSUME_NONNULL_END
