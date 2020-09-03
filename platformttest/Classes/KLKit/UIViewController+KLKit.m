//
//  UIViewController+KLKit.m
//  KLKit
//
//  Created by liqian on 2018/03/22.
//  Copyright © 2018 liqian. All rights reserved.
//

#import "UIViewController+KLKit.h"
#import <Masonry/Masonry.h>

@implementation UIViewController (KLKit)

- (void)kl_addChildViewController:(UIViewController *)childController toContainerView:(UIView *)containerView {
    [self kl_addChildViewController:childController toContainerView:containerView frame:CGRectZero];
}

- (void)kl_addChildViewController:(UIViewController *)childController toContainerView:(UIView *)containerView frame:(CGRect)frame {
    [self addChildViewController:childController];
    childController.view.frame = frame;
    [containerView addSubview:childController.view];
    [childController didMoveToParentViewController:self];
    
    // layout.
    if (CGRectEqualToRect(frame, CGRectZero)) {
        [childController.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        return;
    }
    
    BOOL equalWidth = NO;
    if (CGRectGetWidth(frame) == CGRectGetWidth(containerView.frame)) {
        equalWidth = YES;
    }
    BOOL equalHeight = NO;
    if (CGRectGetHeight(frame) == CGRectGetHeight(containerView.frame)) {
        equalHeight = YES;
    }
    [childController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(CGRectGetMinX(frame));
        make.top.offset(CGRectGetMinY(frame));
        if (equalWidth) {
            make.right.offset(0);
        }else {
            make.width.mas_equalTo(CGRectGetWidth(frame));
        }
        if (equalHeight) {
            make.bottom.offset(0);
        }else {
            make.height.mas_equalTo(CGRectGetHeight(frame));
        }
    }];
}

- (void)kl_removeChildViewController:(UIViewController *)viewController {
    [viewController willMoveToParentViewController:nil];
    [viewController.view removeFromSuperview];
    [viewController removeFromParentViewController];
}


- (void)kl_AddLeftBarButtonItemWithTitle:(NSString *)title
                                   color:(UIColor *)color
                                  action:(SEL)action {
    self.navigationItem.leftBarButtonItem = [self kl_barButtonItemWithTitle:title color:color action:action];
}

- (void)kl_AddLeftBarButtonItemWithIcon:(UIImage *)icon
                                 action:(SEL)action {
    self.navigationItem.leftBarButtonItem = [self kl_barButtonItemWithIcon:icon action:action];
}

- (void)kl_AddRightBarButtonItemWithTitle:(NSString *)title
                                    color:(UIColor *)color
                                   action:(SEL)action {
    self.navigationItem.rightBarButtonItem = [self kl_barButtonItemWithTitle:title color:color action:action];
}

- (void)kl_AddRightBarButtonItemWithIcon:(UIImage *)icon
                                  action:(SEL)action {
    self.navigationItem.rightBarButtonItem = [self kl_barButtonItemWithIcon:icon action:action];
}

- (void)kl_AddLeftBarButtonItemWithView:(UIView *)view {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)kl_AddRightBarButtonItemWithView:(UIView *)view {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = item;
}


- (UIBarButtonItem *)kl_barButtonItemWithTitle:(NSString *)title
                                      color:(UIColor *)color
                                     action:(SEL)action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    if (color) {
        item.tintColor = color;
    }
    return item;
}

- (UIBarButtonItem *)kl_barButtonItemWithTitle:(NSString *)title
                                         color:(UIColor *)color
                                          font:(UIFont *)font
                                        action:(SEL)action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    if (color) {
        item.tintColor = color;
    }
    if (font) {
        [item setTitleTextAttributes:@{NSFontAttributeName : font}
                            forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{NSFontAttributeName : font} forState:UIControlStateDisabled];
        [item setTitleTextAttributes:@{NSFontAttributeName : font} forState:UIControlStateHighlighted];
        [item setTitleTextAttributes:@{NSFontAttributeName : font} forState:UIControlStateSelected];
    }
    return item;
}

- (UIBarButtonItem *)kl_barButtonItemWithIcon:(UIImage *)icon
                                    action:(SEL)action {
    return [[UIBarButtonItem alloc] initWithImage:icon
                                            style:UIBarButtonItemStylePlain
                                           target:self action:action];
}

@end


@implementation UIViewController (MasExtension)

- (MASViewAttribute *)mas_safeAreaLayoutGuideTopAttribute {
    if (@available(iOS 11.0, *)) {
        return self.view.mas_safeAreaLayoutGuideTop;
    }
    return self.mas_topLayoutGuideBottom;
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideBottomAttribute {
    if (@available(iOS 11.0, *)) {
        return self.view.mas_safeAreaLayoutGuideBottom;
    }
    return self.mas_bottomLayoutGuideTop;
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideLeftAttribute {
    if (@available(iOS 11.0, *)) {
        return self.view.mas_safeAreaLayoutGuideLeft;
    }
    return self.view.mas_left;
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideRightAttribute {
    if (@available(iOS 11.0, *)) {
        return self.view.mas_safeAreaLayoutGuideRight;
    }
    return self.view.mas_right;
}

@end
