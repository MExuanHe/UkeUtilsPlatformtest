//
//  UIImage+Base64.h
//  ZMUke
//
//  Created by DengFeng.Su on 2018/12/24.
//  Copyright © 2018 zmlearn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIImage+Sizing.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Base64)

// 图片转64base字符串
- (NSString *)convertToBase64;

+ (NSString *)convertToBase64WithImageData:(NSData *)imageData;

@end

NS_ASSUME_NONNULL_END
