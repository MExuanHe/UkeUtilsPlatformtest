//
//  UIImageView+Image.m
//  OCTest
//
//  Created by zhangmen on 2018/7/20.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import "UIImageView+Image.h"
#import "UIImageView+WebCache.h"
#import "NSObject+KLKit.h"
@implementation UIImageView (Image)

#pragma mark - SDWebImage 加载图片方法
- (void)setImageWithURLString:(NSString *)URLString
{
    [self setImageWithURLString:URLString placeholderString:nil failImageString:nil];
}
- (void)setImageWithURLString:(NSString *)URLString placeholderString:(NSString *)placeholderString
{
    [self setImageWithURLString:URLString placeholderString:placeholderString failImageString:nil];
}
- (void)setImageWithURLString:(NSString *)URLString placeholderString:(NSString *)placeholderString failImageString:(NSString *)failImageString
{
    NSURL *url = [NSURL URLWithString:URLString];
    UIImage *failImageImage = failImageString.length > 0 ? [UIImage imageNamed:failImageString]:nil;
    if (placeholderString.length > 0) {
        [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:placeholderString] options:SDWebImageAvoidDecodeImage completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (error) {
                self.image = failImageImage;
            }
        }];
    }else{
        [self sd_setImageWithURL:url placeholderImage:nil options:SDWebImageAvoidDecodeImage completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (error) {
                self.image = failImageImage;
            }
        }];
    }
}

- (void)setImageWithURLString:(NSString *_Nonnull)URLString completed:(void(^_Nullable)(UIImage * _Nullable image, NSError * _Nullable error, NSURL * _Nullable imageURL))complete {
    
    NSURL *url = nil;
    if (URLString.isValidString) {
        url = [NSURL URLWithString:URLString];
    } else if ([URLString isKindOfClass:NSURL.class]) {
        url = (NSURL *)URLString;
    } else {
        NSString *str = [[NSString alloc] initWithFormat:@"%@", URLString];
        url = [NSURL URLWithString:str];
    }
    
    [self sd_setImageWithURL:url placeholderImage:nil options:SDWebImageAvoidDecodeImage completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        !complete ?: complete(image, error, imageURL);
    }];
}

@end
