//
//  WKWebView+Safe.m
//  ZMUke
//
//  Created by zhouqixin on 2019/7/12.
//  Copyright © 2019 zmlearn. All rights reserved.
//

#import <WebKit/WKWebView.h>
#import <objc/runtime.h>

@implementation WKWebView (Safe)

+ (void)load {
    Class wkContentView = NSClassFromString(@"WKContentView");
    SEL unsafeMethod = NSSelectorFromString(@"isSecureTextEntry");
    BOOL flag = [wkContentView instancesRespondToSelector:unsafeMethod];
    if (!flag) {
        flag = class_addMethod(wkContentView, unsafeMethod, [WKWebView safeImplementation:unsafeMethod], "isSecureTextEntry");
    }    
}

+ (IMP)safeImplementation:(SEL)aSelector {
    IMP imp = imp_implementationWithBlock(^() {
    });
    return imp;
}

@end
