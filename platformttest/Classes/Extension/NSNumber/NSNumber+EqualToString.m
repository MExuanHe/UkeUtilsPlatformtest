//
//  NSNumber+EqualToString.m
//  ZMUke
//
//  Created by DengFeng.Su on 2019/1/19.
//  Copyright © 2019 zmlearn. All rights reserved.
//

@implementation NSNumber (EqualToString)

- (BOOL)isEqualToString:(NSString *)string {
    
    if ([string isMemberOfClass:NSNumber.class]) {
        return [self isEqualToNumber:(NSNumber *)string];
    } else {
        NSString *selfStr = [self stringValue];
        NSString *otherStr = nil;
        
        if ([string isKindOfClass:NSString.class]) {
            otherStr = string;
        } else {
            otherStr = [string description];
        }
        
        return [selfStr isEqualToString:otherStr];
    }
}

@end
