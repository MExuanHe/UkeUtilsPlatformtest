//
//  NSString+KLKit.h
//  KLKit
//
//  Created by liqian on 2018/03/22.
//  Copyright © 2018 liqian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KLKit)

- (BOOL)isValidPhoneNumber;
- (BOOL)vertifyWithRegexString:(NSString *)regex;

// 去掉头尾空格
- (NSString *)kl_trim;

- (NSString *)aes256EncryptWithKey:(NSString *)key;

@end
