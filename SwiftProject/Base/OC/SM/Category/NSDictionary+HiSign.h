//
//  NSDictionary+HiSign.h
//  Hi-SwiftUI
//
//  Created by stone on 2025/5/20.

#import <Foundation/Foundation.h>

@interface NSDictionary(HiSign)

-(NSString *)hi_sortJsonString;

/**
 字典按参数名升序，对基础数据类型格式化处理，滤空操作，以"参数名=值&参数名=值&...&参数名=值"格式生成，可指定黑名单剔除不需要的数据

 @param blackList 需要剔除key的集合。
 @return 处理后的字符
 */
-(NSString *)hi_signSortStringWithBlackList:(NSArray<NSString *> *)blackList;

@end

@interface NSArray(HiSign)

-(NSString *)hi_sortJsonString;

@end

@interface NSString(HiSign)

-(NSString *)stringByReplacingEscapeCharacter;

@end
