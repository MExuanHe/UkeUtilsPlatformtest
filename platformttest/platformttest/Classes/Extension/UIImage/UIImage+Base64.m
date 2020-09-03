//
//  UIImage+Base64.m
//  ZMUke
//
//  Created by DengFeng.Su on 2018/12/24.
//  Copyright © 2018 zmlearn. All rights reserved.
//

#import "UIImage+Base64.h"

@implementation UIImage (Base64)

// 图片转64base字符串
- (NSString *)convertToBase64 {
    
    NSData *imageData = UIImageJPEGRepresentation(self, self.compressRate ? self.compressRate.doubleValue:1.f);
    
    return [self.class convertToBase64WithImageData:imageData];
}

+ (NSString *)convertToBase64WithImageData:(NSData *)imageData {
    
    NSString *image64 = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    return [NSString stringWithFormat:@"data:image/jpg;base64,%@", image64];
}

@end
