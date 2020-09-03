//
//  NSNotificationCenter+allowObserve.m
//  ZMUke
//
//  Created by zhouqixin on 2019/12/6.
//  Copyright © 2019 zmlearn. All rights reserved.
//

#import "NSObject+Extension.h"
#import <AVFoundation/AVFoundation.h>

@implementation NSNotificationCenter (allowObserve)

+ (void)load {
//    if ([@[@"12.3.1", @"12.2", @"12.4.1", @"12.3", @"12.4.2", @"13.1.2"] containsObject:[UIDevice currentDevice].systemVersion]) {
        Class class = NSClassFromString(@"NSNotificationCenter");
        [class exchangeInstanceMethodWithOriginalSel:@selector(addObserver:selector:name:object:)
                                        swizzledSel:@selector(safeAddObserver:selector:name:object:)];
//    }
}

-(void) safeAddObserver:(nonnull id)observer selector:(nonnull SEL)sel name:(nullable NSNotificationName)name object:(nullable id)object {
    if ([@[AVCaptureSessionWasInterruptedNotification, AVCaptureSessionInterruptionEndedNotification, AVCaptureSessionWasInterruptedNotification, AVCaptureSessionInterruptionEndedNotification, AVAudioSessionInterruptionNotification] containsObject:name]) {
        return;
    }
    [self safeAddObserver:observer selector:sel name:name object:object];
//    NSString *n = NSStringFromClass([observer class]);
//    if (![n hasPrefix:@"UI"] && ![n hasPrefix:@"AF"] && ! [n hasPrefix:@"SD"] && ![n hasPrefix: @"CUI"] && ![n hasPrefix:@"UM"] && ![n hasPrefix:@"_UISystem"] && ! [n hasPrefix:@"_UI"] && ![n hasPrefix:@"UKBase"] && ![n hasPrefix:@"KLSe"]) {
//        NSLog(@"=>%@ - %@ - %@ - %@",NSStringFromClass([observer class]), NSStringFromSelector(sel), name, object);
//    }
}

@end
