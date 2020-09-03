
#import "UIButton+Alignment.h"
#import "NSObject+Extension.h"

@implementation UIButton (Alignment)

/*
#pragma mark - load
+ (void)load
{
    [self exchangeInstanceMethodWithOriginalSel:@selector(layoutSubviews)
                                    swizzledSel:@selector(alignmentLayoutSubviews)];
}
// MARK: alignmentLayoutSubviews
- (void)alignmentLayoutSubviews
{
    [self alignmentLayoutSubviews];
    
    CGFloat space = self.margin;
    
    CGFloat titleW = CGRectGetWidth(self.titleLabel.bounds);
    CGFloat titleH = CGRectGetHeight(self.titleLabel.bounds);
    
    CGFloat imageW = CGRectGetWidth(self.imageView.bounds);
    CGFloat imageH = CGRectGetHeight(self.imageView.bounds);
    
    CGFloat btnCenterX = CGRectGetWidth(self.bounds)/2;
    CGFloat imageCenterX = btnCenterX - titleW/2;
    CGFloat titleCenterX = btnCenterX + imageW/2;
    
    switch (self.alignment) {
        case ImageAlignmentTop:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(imageH/2+ space/2, -(titleCenterX-btnCenterX), -(imageH/2 + space/2), titleCenterX-btnCenterX);
            self.imageEdgeInsets = UIEdgeInsetsMake(-(titleH/2 + space/2), btnCenterX-imageCenterX, titleH/2+ space/2, -(btnCenterX-imageCenterX));
        }
            break;
        case ImageAlignmentLeft:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, space/2, 0,  -space/2);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space);
        }
            break;
        case ImageAlignmentBottom:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(-(imageH/2+ space/2), -(titleCenterX-btnCenterX), imageH/2 + space/2, titleCenterX-btnCenterX);
            self.imageEdgeInsets = UIEdgeInsetsMake(titleH/2 + space/2, btnCenterX-imageCenterX,-(titleH/2+ space/2), -(btnCenterX-imageCenterX));
        }
            break;
        case ImageAlignmentRight:
        {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageW + space/2), 0, imageW + space/2);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleW+space/2, 0, -(titleW+space/2));
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 懒加载
// MARK: alignment
NSString *const ButtonImageAlignmentKey = @"ButtonImageAlignmentKey";
- (void)setAlignment:(ImageAlignment)alignment
{
    if (alignment != self.alignment) {
        objc_setAssociatedObject(self, &ButtonImageAlignmentKey,
                                 @(alignment), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
- (ImageAlignment)alignment
{
    return [objc_getAssociatedObject(self, &ButtonImageAlignmentKey) unsignedIntegerValue];
}
// MARK: margin
NSString *const ButtonTitleImageMarginKey = @"ButtonTitleImageMarginKey";
- (void)setMargin:(CGFloat)margin
{
    if (margin != self.margin) {
        objc_setAssociatedObject(self, &ButtonTitleImageMarginKey,
                                 @(margin), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
- (CGFloat)margin
{
    return [objc_getAssociatedObject(self, &ButtonTitleImageMarginKey) floatValue];
}
*/
@end
