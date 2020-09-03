//
//  NSArray+Extension.h
//  ZMUke
//
//  Created by liqian on 2018/12/8.
//  Copyright © 2018 zmlearn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Extension)

/**
 Convert object to json string. return nil if an error occurs.
 NSString/NSNumber/NSDictionary/NSArray
 */
- (nullable NSString *)jsonStringEncoded;

@end

NS_ASSUME_NONNULL_END
