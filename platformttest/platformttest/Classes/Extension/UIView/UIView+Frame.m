//
//  UIView+Frame.m
//  OCTest
//
//  Created by 喵小仲 on 2018/6/13.
//  Copyright © 2018年 IFAClub. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setFrameWidth:(CGFloat)frameWidth
{
    CGRect rect = self.frame;
    rect.size.width = frameWidth;
    self.frame = rect;
}

- (CGFloat)frameWidth
{
    return self.frame.size.width;
}

- (void)setFrameHeight:(CGFloat)frameHeight
{
    CGRect rect = self.frame;
    rect.size.height = frameHeight;
    self.frame = rect;
}

- (CGFloat)frameHeight
{
    return self.frame.size.height;
}

- (void)setFrameX:(CGFloat)frameX
{
    CGRect rect = self.frame;
    rect.origin.x = frameX;
    self.frame = rect;
}

- (CGFloat)frameX
{
    return self.frame.origin.x;
}

- (void)setFrameY:(CGFloat)frameY
{
    CGRect rect = self.frame;
    rect.origin.y = frameY;
    self.frame = rect;
}

- (CGFloat)frameY
{
    return self.frame.origin.y;
}

@end
