//
//  NSData+HiHexadecimal.h
//  Hi-SwiftUI
//
//  Created by stone on 2025/5/20.

#import <Foundation/Foundation.h>

@interface NSData (Hexadecimal)

//十六进制字符串转换成NSData
+ (NSData *)hi_dataFromHexadecimalString:(NSString *)aString;

//NSData的十六进制的字符串
- (NSString *)hi_hexadecimalString;

@end
