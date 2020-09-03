//
//  NSObject+Category.h
//  IFAClub
//
//  Created by zhangmen on 2018/9/17.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Category)

#pragma mark - UIColor 转 UIImage
- (UIImage *)imageWithColor:(UIColor *)color;

#pragma mark - model 转 字典
- (NSDictionary *)getDictionayFromModel;

#pragma mark - 获取 安全的 array dictionary
- (NSArray *)getSafeArray;
- (NSDictionary *)getSafeDictionary;

#pragma mark - 转时间
- (NSString *)getTimeStringWith:(NSInteger)timeInterval;

#pragma mark - view 所在的 controller
- (UIViewController *)findControllerSupportView:(UIView *)view;

#pragma mark - 获取 顶部Controller
- (UIViewController *)findTopViewController;
- (UIViewController *)findTopViewController:(UIViewController *)controller;

#pragma mark - 退出到rootController
- (void)popOrDismissToRootVc;

@end
