//
//  NSString+Extension.m
//  ZMUke
//
//  Created by liqian on 2018/12/8.
//  Copyright © 2018 zmlearn. All rights reserved.
//

#import "NSString+Extension.h"
#import "NSData+Extension.h"
#import "UkeRSAEncrypt.h"

@implementation NSString (Extension)

- (NSString *)md5String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md5String];
}

- (NSString *)rsaString {
    
    NSString *publickKey = @"MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKzqjw/P0Vy8CSvRkBpEadYwwYPl8Mk7uOe3IulybIIqVlnsdUJcj3uaYTbXFzk5CSAdvJ9i0MN6mAMYqdTvVEUCAwEAAQ==";
    return [UkeRSAEncrypt encryptString:self publicKey:publickKey];
}

- (NSData *)dataValue {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSRange)rangeOfAll {
    return NSMakeRange(0, self.length);
}

- (id)jsonValueDecoded {
    return [[self dataValue] jsonValueDecoded];
}

- (BOOL)isURL {
    
    NSString *url;
    if (self.length > 4 && [[self substringToIndex:4] isEqualToString:@"www."]) {
        url = [NSString stringWithFormat:@"http://%@",self];
    }else{
        url = self;
    }
    NSString *urlRegex = @"\\bhttps?://[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";
    NSPredicate* urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegex];
    
    return [urlTest evaluateWithObject:url];
}

- (BOOL)isMobile {
    
    NSString *regular = @"^1[0-9]{10}";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regular];
    
    BOOL isMatch = [predicate evaluateWithObject: self];
    
    return isMatch;
}

- (NSString *)stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

@end
