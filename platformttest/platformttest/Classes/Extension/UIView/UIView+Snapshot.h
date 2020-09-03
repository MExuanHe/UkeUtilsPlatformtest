//
//  UIView+Snapshot.h
//  ZMUke
//
//  Created by DengFeng.Su on 2018/12/22.
//  Copyright © 2018 zmlearn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Sizing.h"

NS_ASSUME_NONNULL_BEGIN

// MARK: - 图片裁剪
@interface UIImage (Uke_Sizing)

- (NSString *)zke_paperHomeworkCompressQuality;

@end

@interface UIView (Snapshot)

// 获取整个view的图片
- (UIImage *)uke_snapshot;

- (UIImage *)uke_snapshotWithFrame:(CGRect )frame;

- (UIImage *)uke_snapshotWithFrame:(CGRect )frame linmitedSize:(CGSize)size;

- (UIImage *)uke_snapshotWithFrame:(CGRect )frame limiteddataLength:(NSUInteger )dataLength;

/**
 * 获取图片
 * CGRect frame 截取图片位置
 * CGSize size 返回图片的大小
 * NSInterger dataLength 返回图片的容量大小 不一定能缩放到传入大小 单位 KB
 */
- (UIImage *)uke_snapshotWithFrame:(CGRect )frame linmitedSize:(CGSize)size limitedDataLength:(NSUInteger )dataLength;

@end

NS_ASSUME_NONNULL_END
