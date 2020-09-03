//
//  GloableUIDefines.h
//  ZMUke
//
//  Created by liqian on 2018/10/24.
//  Copyright © 2018 zmlearn. All rights reserved.
//

#ifndef GloableUIDefines_h
#define GloableUIDefines_h

// MARK: - 常量定义
// AES 加密key
#define Uke_AES_KEY @"QaTO48s4z8k36DmCT59XxA=="

//微信小程序
#define Uke_MiniProgram_Username  @"gh_8d6c4923f3a0"
#define Uke_MiniProgram_Path      @"pages/index/index?channel=优课APP"

// 接口版本号
#define kAPI_Version                    @"1.0.8"

// 用户协议URL
#define kUkePolicy @"https://static.zhangmen.com/protocol.html" //[NSString stringWithFormat:@"%@%@", [TargetConfiguration hybridBaseURL], UKURL_POLIC]

// 测试：如果想要页面能随着设备方向自动旋转，则把UkeTestShouldRotate设置为1。调试的时候可以用
#define UkeTestShouldRotate 0

// 测试：如果想测试审核模式切换，则把此值置为1。置为1后"我的"页面会出现"重置审核"入口，同时UKGloableInfoCenter的getIsCastrateModeCompletion方法将走正常流程获取审核状态，不会强制写死。测试完毕后记得关闭为0
#define kTestCastrateMode 0

// 判断是否要接入bugly
#if AppStore_Release || Uat_Release || Test_Release
    #define UkeNeedBugly
#endif

//MARK: - UIColor 扩展定义
#ifndef UkeColorRGBA
    #define UkeColorRGBA(r, g, b, a) \
            [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

    #define UkeColorRGB(r, g, b)     UkeColorRGBA(r, g, b, 1.f)
    #define UkeRandomColor \
            UkeColorRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#endif

#ifndef UkeColorHexA
    #define UkeColorHexA(_hex_, a) \
            UkeColorRGBA((((_hex_) & 0xFF0000) >> 16), (((_hex_) & 0xFF00) >> 8), ((_hex_) & 0xFF), a)
    #define UkeColorHex(_hex_)   UkeColorHexA(_hex_, 1.0)
#endif

// MARK: UIFont 扩展定义
#define UkeFontLight(font)  [UIFont systemFontOfSize:font weight:UIFontWeightLight]
#define UkeFontRegular(font)  [UIFont systemFontOfSize:font weight:UIFontWeightRegular]
#define UkeFontSemibold(font)  [UIFont systemFontOfSize:font weight:UIFontWeightSemibold]
#define UkeFontMedium(font)  [UIFont systemFontOfSize:font weight:UIFontWeightMedium]
#define UkeFontBold(font)  [UIFont systemFontOfSize:font weight:UIFontWeightBold]

#define UkeScaledFontSize(fs) ({ \
    CGFloat value = (fs); \
    if (UkeMinWidth < UkeBasedWidth) { \
        value = (fs-1); \
    }else if (UkeMinWidth >= UkeBasedWidth) { \
        value = (fs); \
    } \
    value; \
})


// MARK: - 导航栏
/* 导航栏相关配置 */
// 导航栏标题字体
#define kBarTitleFont UkeFontMedium(18)
// 导航栏标题颜色
#define kBarTitleColor UkeAdaptColor(0x333333, 0xEEEEEE)
// 导航栏按钮颜色
#define kBarTintColor UkeAdaptColor(0x444444, 0xDDDDDD)
// 导航栏背景颜色
#define kBarBgColor UkeAdaptColor(0xFFFFFF, 0x1A1A1A)
// 全局弹框遮罩颜色
#define kMaskViewBgColor [UkeColorHex(0x0D0F16) colorWithAlphaComponent:0.6]

// 护眼模式的view的tag
#define kEyeShieldViewTag 10101010

#define ukeyWindow [UIApplication sharedApplication].delegate.window
#define kAppDelegate [UIApplication sharedApplication].delegate

#define Safe_Param(value)               [value isPracticalString] ? value : @""

//MARK: - 屏幕大小缩放相关定义
//  状态栏
#define kStatusBarHeight                ([[UIApplication sharedApplication] statusBarFrame].size.height)
//  导航栏+状态栏     (不能再UINavigationController中调用)
#define kNavigationHeight               (kStatusBarHeight + self.navigationController.navigationBar.frame.size.height)

#ifndef kScreenSize
    #define kScreenSize [UIScreen mainScreen].bounds.size
#endif
#ifndef kScreenWidth
    #define kScreenWidth kScreenSize.width
#endif
#ifndef kScreenHeight
    #define kScreenHeight kScreenSize.height
#endif
// iPhone：根据iPhone6尺寸做缩放
// iPad：根据iPad mini尺寸做缩放
#define UkeBasedWidth ([UkeUIDevice isPhone] ? 375.0 : 768.0)
#define UkeBasedHeight ([UkeUIDevice isPhone] ? 667.0 : 1024.0)

// 忽略横竖屏，取最小边
#define UkeMinWidth (MIN(kScreenWidth, kScreenHeight))
#define UkeMaxHeight (MAX(kScreenWidth, kScreenHeight))

// 用最小边 除以 基准宽
#define UkeScaledLength(length) (((MIN(kScreenWidth, kScreenHeight))/UkeBasedWidth)*(length))
#define UkeScaledHeightLength(length) (((MAX(kScreenWidth, kScreenHeight))/UkeBasedHeight)*(length))

#define UIScaledWidthLandscape(length) ((kScreenWidth/UkeBasedHeight)*(length))
#define UIScaledHeightLandscape(length) ((kScreenHeight/UkeBasedWidth)*(length))

// 判断是不是全面屏幕
#define kIsFullScreen (44 == CGRectGetHeight(UIApplication.sharedApplication.statusBarFrame))
#define kIsIphone ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define kIsIpad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)


// MARK: - 动画时间
#define kFastDuration                   0.25
#define kSlowDuration                   0.4
#define kAlertViewDuration              1.0

// MARK: - 打印定义
#ifdef DEBUG
    #define NSLog(format, ...)          printf("\n[%s] %s [第%d行]\n%s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String])
#else
    #define NSLog(format, ...)
#endif

//  MARK:- 设备基本信息定义

// app info(dictionary)
#define kAPPInfo                        [[NSBundle mainBundle] infoDictionary]
// app版本号(string)
#define kAPPVersion                     [kAPPInfo objectForKey:@"CFBundleShortVersionString"]
#define kDeviceInfo                     ([UIDeviceHardware platformString] ? [UIDeviceHardware platformString] : [UIDevice currentDevice].model)
// appbuild版本号(string)
#define kAPPBuildVersion                [kAPPInfo objectForKey:@"CFBundleVersion"]
// app名称
#define kAPPName                        [kAPPInfo objectForKey:@"CFBundleDisplayName"]
// app bundle ID
#define kAPPBundleID                    [kAPPInfo objectForKey:@"CFBundleIdentifier"]


//MARK: - 预防循环引用定义
#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

//MARK: - 主线程上安全运行定义
#ifndef dispatch_main_async_safe
#define dispatch_main_async_safe(block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}
#endif


#endif /* GloableUIDefines_h */
