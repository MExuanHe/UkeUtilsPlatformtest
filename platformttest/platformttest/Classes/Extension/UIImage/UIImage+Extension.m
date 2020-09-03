//
//  UIImage+Extension.m
//  ZMUke
//
//  Created by liqian on 2018/12/8.
//  Copyright © 2018 zmlearn. All rights reserved.
//

#import "UIImage+Extension.h"
#import <ImageIO/ImageIO.h>
#import <Accelerate/Accelerate.h>

typedef enum {
    ALPHA = 0,
    BLUE = 1,
    GREEN = 2,
    RED = 3
} PIXELS;

@implementation UIImage (Extension)

- (UIImage *)imageWithSpacingExtensionInsets:(UIEdgeInsets)insets {
    CGSize contextSize = CGSizeMake(self.size.width + (insets.left+insets.right), self.size.height + (insets.top+insets.bottom));
    return [UIImage imageWithSize:contextSize opaque:self.isImageOpaque scale:self.scale actions:^(CGContextRef contextRef) {
        [self drawAtPoint:CGPointMake(insets.left, insets.top)];
    }];
}

- (UIImage *)imageWithAlpha:(CGFloat)alpha {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGRect drawingRect = CGRectMake(0, 0, self.size.width, self.size.height);
    [self drawInRect:drawingRect blendMode:kCGBlendModeNormal alpha:alpha];
    UIImage *imageOut = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageOut;
}

- (UIImage *)uke_imageWithTintColor:(UIColor *)tintColor {
    return [UIImage imageWithSize:self.size opaque:self.isImageOpaque scale:self.scale actions:^(CGContextRef contextRef) {
        CGContextTranslateCTM(contextRef, 0, self.size.height);
        CGContextScaleCTM(contextRef, 1.0, -1.0);
        CGContextSetBlendMode(contextRef, kCGBlendModeNormal);
        CGContextClipToMask(contextRef, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage);
        CGContextSetFillColorWithColor(contextRef, tintColor.CGColor);
        CGContextFillRect(contextRef, CGRectMake(0, 0, self.size.width, self.size.height));
    }];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithGradientColorFrom:(UIColor *)fromColor
                                toColor:(UIColor *)toColor {
    return [self imageWithGradientColorFrom:fromColor toColor:toColor size:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithGradientColorFrom:(UIColor *)fromColor
                                toColor:(UIColor *)toColor
                                   size:(CGSize)size {

    return [self imageWithGradientColorFrom:fromColor toColor:toColor isHorizontal:true size:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithVerticalGradientColorFrom:(UIColor *)fromColor toColor:(UIColor *)toColor {
    
    return [self imageWithGradientColorFrom:fromColor toColor:toColor isHorizontal:false size:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithGradientColorFrom:(UIColor *)fromColor
                                toColor:(UIColor *)toColor
                           isHorizontal:(BOOL) isHorizontal
                                   size:(CGSize)size {
    
    CGPoint startPoint = CGPointMake(0.0, size.height/2.0);
    CGPoint endPoint = CGPointMake(size.width, size.height/2.0);
    
    if (!isHorizontal) {
        startPoint = CGPointMake(size.width/2, 0);
        endPoint = CGPointMake(size.width/2, size.height);
    }
    
    return [self imageWithGradientColorFrom:fromColor toColor:toColor startPoint:startPoint endPoint:endPoint size:size];
}

+ (UIImage *)imageWithGradientColorFrom:(UIColor *)fromColor
                                toColor:(UIColor *)toColor
                             startPoint:(CGPoint)startPoint
                               endPoint:(CGPoint)endPoint
                                   size:(CGSize)size {
    if (!fromColor || !toColor || size.width <= 0 || size.height <= 0) return nil;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0, 1.0};
    NSArray *colors = @[(__bridge id) fromColor.CGColor, (__bridge id) toColor.CGColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation|kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    return image;
}

- (BOOL)hasAlphaChannel {
    if (self.CGImage == NULL) return NO;
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage) & kCGBitmapAlphaInfoMask;
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

- (UIImage *)imageByFlipVertical {
    return [self flipHorizontal:NO vertical:YES];
}

- (UIImage *)imageByFlipHorizontal {
    return [self flipHorizontal:YES vertical:NO];
}

- (nullable UIImage *)imageByResizeToSize:(CGSize)size {
    if (size.width <= 0 || size.height <= 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (BOOL)isImageOpaque {
    return ![self hasAlphaChannel];
}

+ (UIImage *)imageWithSize:(CGSize)size
                    opaque:(BOOL)opaque
                     scale:(CGFloat)scale
                   actions:(void (^)(CGContextRef contextRef))actionBlock {
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        return nil;
    }
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    actionBlock(context);
    UIImage *imageOut = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageOut;
}



- (UIImage *)flipHorizontal:(BOOL)horizontal vertical:(BOOL)vertical {
    if (!self.CGImage) return nil;
    size_t width = (size_t)CGImageGetWidth(self.CGImage);
    size_t height = (size_t)CGImageGetHeight(self.CGImage);
    size_t bytesPerRow = width * 4;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, bytesPerRow, colorSpace, kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedFirst);
    CGColorSpaceRelease(colorSpace);
    if (!context) return nil;
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), self.CGImage);
    UInt8 *data = (UInt8 *)CGBitmapContextGetData(context);
    if (!data) {
        CGContextRelease(context);
        return nil;
    }
    vImage_Buffer src = { data, height, width, bytesPerRow };
    vImage_Buffer dest = { data, height, width, bytesPerRow };
    if (vertical) {
        vImageVerticalReflect_ARGB8888(&src, &dest, kvImageBackgroundColorFill);
    }
    if (horizontal) {
        vImageHorizontalReflect_ARGB8888(&src, &dest, kvImageBackgroundColorFill);
    }
    CGImageRef imgRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    UIImage *img = [UIImage imageWithCGImage:imgRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imgRef);
    return img;
}

- (nullable UIImage *)imageDarkenWithLevel:(CGFloat )level {
    
//    UIImage *brighterImage;
//    CIContext *context = [CIContext contextWithOptions:nil];
//    CIImage *inputImage = [CIImage imageWithCGImage:self.CGImage];
//
//    CIFilter *lighten = [CIFilter filterWithName:@"CIColorControls"];
//    [lighten setValue:inputImage forKey:kCIInputImageKey];
//    [lighten setValue:@(brighter) forKey:@"inputBrightness"];
//
//    CIImage *result = [lighten valueForKey:kCIOutputImageKey];
//    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
//    brighterImage = [UIImage imageWithCGImage:cgImage scale:self.scale orientation:self.imageOrientation];
//
//    CGImageRelease(cgImage);
//
//    return brighterImage;
    
    level = MAX(0.f, MIN(1.f, level));
    
    int width = self.size.width*self.scale;
    int height = self.size.height*self.scale;
    
    // the pixels will be painted to this array
    uint32_t *pixels = (uint32_t *) malloc(width * height * sizeof(uint32_t));
    
    // clear the pixels so any transparency is preserved
    memset(pixels, 0, width * height * sizeof(uint32_t));
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // create a context with RGBA pixels
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    // paint the bitmap to our context which will fill in the pixels array
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), [self CGImage]);
    
    
    for(int y = 0; y < height; y++) {
        for(int x = 0; x < width; x++) {
            uint8_t *rgbaPixel = (uint8_t *) &pixels[y * width + x];
            
            // darken the pixels
            rgbaPixel[RED] = rgbaPixel[RED] * level;
            rgbaPixel[GREEN] = rgbaPixel[GREEN] * level;
            rgbaPixel[BLUE] = rgbaPixel[BLUE] * level;
        }
    }
    
    // create a new CGImageRef from our context with the modified pixels
    CGImageRef image = CGBitmapContextCreateImage(context);
    
    // we're done with the context, color space, and pixels
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(pixels);
    
    // make a new UIImage to return
    UIImage *resultUIImage = [UIImage imageWithCGImage:image scale:self.scale orientation:self.imageOrientation];
    
    // we're done with image now too
    CGImageRelease(image);
    
    return resultUIImage;
}

+ (UIImage *)imageInBundleWithName:(NSString *)name {
    return [UIImage imageWithContentsOfFile:[NSBundle.mainBundle pathForResource:name ofType:@"png"]];
}

+ (UIImage *)imageInSelfDetectionBundleWithName:(NSString *)name {
    return [self imageWithCustomizedBundleName:@"SDetection" imageName:name];
}

+ (UIImage *)imageInLiveCourseBundleWithName:(NSString *)name {
    return [self imageWithCustomizedBundleName:@"liveCourse" imageName:name];
}

+ (UIImage *)imageWithCustomizedBundleName:(NSString *)bundleName imageName:(NSString *)imageName {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    
    UIImage *image = [UIImage imageWithContentsOfFile:[bundle pathForResource:imageName ofType:@"png"]];
    if (image) {
        return image;
    } else {
        NSString *scaleName = nil;
        if (![imageName hasSuffix:@"@2x"] && ![imageName hasSuffix:@"@3x"]) {
            CGFloat scale = [UIScreen mainScreen].scale;
            scale = (scale <= 2) ? 2 : 3;
            scaleName = [imageName stringByAppendingFormat:@"@%.fx", scale];
        } else {
            scaleName = imageName;
        }
        return [UIImage imageWithContentsOfFile:[bundle pathForResource:scaleName ofType:@"png"]];
    }
}

@end
