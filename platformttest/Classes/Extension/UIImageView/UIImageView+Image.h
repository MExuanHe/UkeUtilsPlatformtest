//
//  UIImageView+Image.h
//  OCTest
//
//  Created by zhangmen on 2018/7/20.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Image)

#pragma mark - SDWebImage 加载图片方法
- (void)setImageWithURLString:(NSString *_Nonnull)URLString;
- (void)setImageWithURLString:(NSString *_Nonnull)URLString placeholderString:(NSString *_Nonnull)placeholderString;

- (void)setImageWithURLString:(NSString *_Nonnull)URLString completed:(void(^_Nullable)(UIImage * _Nullable image, NSError * _Nullable error, NSURL * _Nullable imageURL))complete;

@end
