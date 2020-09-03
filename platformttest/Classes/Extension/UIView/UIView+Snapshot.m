//
//  UIView+Snapshot.m
//  ZMUke
//
//  Created by DengFeng.Su on 2018/12/22.
//  Copyright © 2018 zmlearn. All rights reserved.
//

#import "UIView+Snapshot.h"

@implementation UIImage (Uke_Sizing)

/**
 * 上传作业将图片压缩
 */
- (NSString *)zke_paperHomeworkCompressQuality {
    NSInteger maxLength = 200*1024;
    UIImage *resultImage = self;
    CGFloat compression = 1;
    NSData *data;
    @autoreleasepool {
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    if (data.length < maxLength) return [self base64EncodedStringWith:data compression:compression];
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        @autoreleasepool {
            compression = (max + min) / 2;
            data = UIImageJPEGRepresentation(resultImage, compression);
            if (data.length < maxLength * 0.9) {
                min = compression;
            }else if (data.length > maxLength) {
                max = compression;
            }else{
                break;
            }
        }
    }
    if (data.length < maxLength) return [self base64EncodedStringWith:data compression:compression];
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        @autoreleasepool {
            lastDataLength = data.length;
            CGFloat scale = (CGFloat)maxLength / data.length;
            CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(scale)),
                                     (NSUInteger)(resultImage.size.height * sqrtf(scale)));
            UIGraphicsBeginImageContext(size);
            [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
            resultImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            data = UIImageJPEGRepresentation(resultImage, compression);
        }
    }
    return [self base64EncodedStringWith:data compression:compression];
}
- (NSString *)base64EncodedStringWith:(NSData *)data compression:(CGFloat)compression
{
    UIImage *image = [UIImage imageWithData:data];
    if (image.imageOrientation != 0) {
        CGSize size = image.size;
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(image, compression);
    }
    NSString *image64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return [NSString stringWithFormat:@"data:image/png;base64,%@", image64];
}

@end

// MARK: - 截图
@implementation UIView (Snapshot)

- (UIImage *)uke_snapshot {
    
    return [self uke_snapshotWithFrame:self.bounds linmitedSize:CGSizeZero limitedDataLength:0];
}

// 获取相对于view的 frame 位置
- (UIImage *)uke_snapshotWithFrame:(CGRect )frame {
    
    return [self uke_snapshotWithFrame:frame  linmitedSize:CGSizeZero limitedDataLength:0];
}

- (UIImage *)uke_snapshotWithFrame:(CGRect )frame linmitedSize:(CGSize)size {
    
    return [self uke_snapshotWithFrame:frame linmitedSize:size limitedDataLength:0];
}

- (UIImage *)uke_snapshotWithFrame:(CGRect )frame limiteddataLength:(NSUInteger )dataLength {
    
    return [self uke_snapshotWithFrame:frame  linmitedSize:CGSizeZero limitedDataLength:dataLength];
}

- (UIImage *)uke_snapshotWithFrame:(CGRect )frame linmitedSize:(CGSize)size limitedDataLength:(NSUInteger )dataLength {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, [UIScreen.mainScreen scale]);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:false];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [result zke_clipWithFrame:frame linmitedSize:size limitedDataLength:dataLength];
}

@end

