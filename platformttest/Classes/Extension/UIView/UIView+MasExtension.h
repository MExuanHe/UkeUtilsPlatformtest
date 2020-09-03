//
//  UIView+MasExtension.h
//  ZMUke
//
//  Created by DengFeng.Su on 2019/1/28.
//  Copyright © 2019 zmlearn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIView (MasExtension)

- (MASViewAttribute *)mas_safeAreaLayoutGuideTopAttribute;

- (MASViewAttribute *)mas_safeAreaLayoutGuideBottomAttribute;

- (MASViewAttribute *)mas_safeAreaLayoutGuideLeftAttribute;

- (MASViewAttribute *)mas_safeAreaLayoutGuideRightAttribute;

@end

NS_ASSUME_NONNULL_END
