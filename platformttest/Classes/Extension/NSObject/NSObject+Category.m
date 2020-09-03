//
//  NSObject+Category.m
//  IFAClub
//
//  Created by zhangmen on 2018/9/17.
//  Copyright © 2018年 zmlearn. All rights reserved.
//

#import "NSObject+Category.h"
#import <objc/runtime.h>

@implementation NSObject (Category)

#pragma mark - UIColor 转 UIImage
- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

#pragma mark - model 转 字典
- (NSDictionary *)getDictionayFromModel
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithUTF8String:cName];
        NSObject *value = [self valueForKey:name];
        [dict setValue:value forKey:name];
    }
    return [dict copy];
}
- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

#pragma mark - 获取 安全的 array dictionary
- (NSArray *)getSafeArray
{
    if ([self isKindOfClass:[NSArray class]]) {
        return (NSArray *)self;
    }else{
        return nil;
    }
}
- (NSDictionary *)getSafeDictionary
{
    if ([self isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)self;
    }else{
        return nil;
    }
}

#pragma mark - 转时间
- (NSString *)getTimeStringWith:(NSInteger)timeInterval
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeInterval]];
}

#pragma mark - view 所在的 controller
- (UIViewController *)findControllerSupportView:(UIView *)view
{
    for (UIView *next = view.superview; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

#pragma mark - 获取 顶部Controller
- (UIViewController *)findTopViewController
{
    UIViewController *resultVC;
    
    resultVC = [self findTopViewController:[[UIApplication sharedApplication].delegate.window rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self findTopViewController:resultVC.presentedViewController];
    }
    return resultVC;
}
- (UIViewController *)findTopViewController:(UIViewController *)controller
{
    if ([controller isKindOfClass:[UINavigationController class]]) {
        return [self findTopViewController:[(UINavigationController *)controller topViewController]];
    } else if ([controller isKindOfClass:[UITabBarController class]]) {
        return [self findTopViewController:[(UITabBarController *)controller selectedViewController]];
    } else {
        return controller;
    }
}

- (void)popOrDismissToRootVc {
    UIViewController *viewController = [[UIApplication sharedApplication].delegate.window rootViewController];
    UIViewController *resultVc = [self popOrDismiss:viewController];
    while (resultVc) {
        resultVc = [self popOrDismiss:resultVc];
    }
}

- (UIViewController *)popOrDismiss:(UIViewController *)viewController {
    
    
//    AppDelegate *appDelegate = (AppDelegate *)kAppDelegate;
//    appDelegate.allowRotation = NO;
//
    if (viewController.presentedViewController) {
        [viewController dismissViewControllerAnimated:YES completion:nil];
    }
//
    if ([viewController isKindOfClass:[UITabBarController class]]) {
        return ((UITabBarController *)viewController).selectedViewController;
    }else if ([viewController isKindOfClass:[UINavigationController class]]) {
        [(UINavigationController *)viewController popToRootViewControllerAnimated:YES];
        return ((UINavigationController *)viewController).topViewController;
    }
    return nil;
}

@end
