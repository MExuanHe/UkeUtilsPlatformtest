//
//  NSString+PasswordStrength.m
//  ZMUke
//
//  Created by DengFeng.Su on 2019/6/24.
//  Copyright © 2019 zmlearn. All rights reserved.
//

#import "NSString+PasswordStrength.h"

@implementation NSString (PasswordStrength)

- (BOOL)isSameNumber {
    // 这段判断为 不是相同字符串
    //    NSString *regex = @"^(?=.*\d+)(?!.*?([\d])\1{5})[\d]{6}$";
    NSString *regex = [NSString stringWithFormat:@"^(?=.*\\d+)(?!.*?([\\d])\\1{%lu})[\\d]{%lu}$", self.length - 1, self.length];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return ![predicate evaluateWithObject:self];
}

// 是否是递减
- (BOOL)isDescend {
    
    NSArray *arr = [self singleCharArray];
    BOOL flag = true;
    for (int i = 0; i < arr.count; i++) {
        
        if ( i > 0) {
            
            int num = [arr[i] intValue];
            int num_ = [arr[i-1] intValue] - 1;
            if (num != num_) {
                
                flag = false;
                break;
            }
        }
    }
    
    return flag;
}

// 是否是递增
- (BOOL)isIncrease {
    
    NSArray *arr = [self singleCharArray];
    BOOL flag = true;
    for (int i = 0; i < arr.count; i++) {
        
        if ( i > 0) {
            
            int num = [arr[i] intValue];
            int num_ = [arr[i-1] intValue] + 1;
            if (num != num_) {
                
                flag = false;
                break;
            }
        }
    }
    
    return flag;
}

- (NSArray *)singleCharArray {
    
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:0];
    
    // 遍历字符串，按字符来遍历。每个字符将通过block参数中的substring传出
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        //将遍历出来的字符串添加到数组中
        [arr addObject:substring];
    }];
    
    return arr.copy;
}

@end
