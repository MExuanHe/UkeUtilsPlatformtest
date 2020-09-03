//
//  NSObject+KLKit.h
//  ZMUke
//
//  Created by liqian on 2018/11/1.
//  Copyright © 2018 zmlearn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, UkekeyboardType) {
    UkeSystemkeyboard = 0, // 系统键盘
    UkeBaiDukeyboard,//百度
    UkeXunFeikeyboard,//讯飞
    UkeSouGoukeyboard,// 搜狗
};

@interface NSObject (KLKit)

- (BOOL)isValidString;
- (BOOL)isPracticalString;

- (BOOL)isValidArray;
- (BOOL)isPracticalArray;

- (BOOL)isValidDict;
- (BOOL)isPracticalDict;

- (BOOL)isValidNumber;
- (BOOL)isValidStringOrNumber;

- (nullable NSString *)getStringValue;

- (BOOL)isIphoneX;

///  判断当前键盘类型
- (UkekeyboardType)isCurrentKeyboardType;
@end

NS_ASSUME_NONNULL_END
