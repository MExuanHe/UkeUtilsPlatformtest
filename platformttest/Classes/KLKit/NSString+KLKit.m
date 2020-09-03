//
//  NSString+KLKit.m
//  KLKit
//
//  Created by liqian on 2018/03/22.
//  Copyright © 2018 liqian. All rights reserved.
//

#import "NSString+KLKit.h"
#import "NSData+Extension.h"
#import <CommonCrypto/CommonCryptor.h>
#import "NSObject+KLKit.h"
@implementation NSString (KLKit)

- (BOOL)isValidPhoneNumber {
    return [self vertifyWithRegexString:@"\\d{11}"];
}

- (BOOL)vertifyWithRegexString:(NSString *)regex {
    if (![self isPracticalString]) return NO;
    if (![regex isPracticalString]) return YES;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (NSString *)kl_trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)aes256EncryptWithKey:(NSString *)key {
    NSString *encrypted = [NSString encyptPKCS5:self WithKey:key];
    return encrypted;
}


+ (NSString *)encyptPKCS5:(NSString *)plainText WithKey:(NSString *)key{
    NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    size_t plainTextBufferSize = [data length];
    
    const void *vplainText = (const void *)[data bytes];
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSizeAES128) & ~(kCCBlockSizeAES128 - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    NSData *vkey = [NSData dataWithBase64EncodedString:key];
    //配置CCCrypt
    CCCryptorStatus ccStatus = CCCrypt(kCCEncrypt,
                                       kCCAlgorithmAES128,
                                       kCCOptionECBMode|kCCOptionPKCS7Padding, //设置模式
                                       vkey.bytes,    //key
                                       kCCKeySizeAES128,
                                       nil,     //偏移量，这里不用，设置为nil;不用的话，必须为nil,不可以为@“”
                                       vplainText,
                                       plainTextBufferSize,
                                       (void *)bufferPtr,
                                       bufferPtrSize,
                                       &movedBytes);
    
    if (ccStatus == kCCSuccess) {
        NSData *myData = [NSData dataWithBytes:(const char *)bufferPtr length:(NSUInteger)movedBytes];
        free(bufferPtr);
        return [myData base64EncodedString];
    } else {
        free(bufferPtr);
        return nil;
    }
}

@end
