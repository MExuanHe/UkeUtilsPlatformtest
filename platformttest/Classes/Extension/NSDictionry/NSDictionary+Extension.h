//
//  NSDictionary+Extension.h
//  ZMUke
//
//  Created by liqian on 2018/12/8.
//  Copyright © 2018 zmlearn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Extension)

/**
 Convert dictionary to json string. return nil if an error occurs.
 */
- (nullable NSString *)jsonStringEncoded;

/**
 将dictionary转为web参数形式
*/
- (NSString *)webparamEncoded;

@end

NS_ASSUME_NONNULL_END
