//
//  HiMSEncryptionConfig.m
//  Hi-SwiftUI
//
//  Created by stone on 2025/5/20.

#import "HiMSEncryptionConfig.h"
#import "YYModel.h"

@implementation HiMSEncryptionConfig

/**
 通用
 */
 static HiMSEncryptionConfig *_instance = nil;

+ (instancetype)shareConfig {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[HiMSEncryptionConfig alloc] init];
    });
    return _instance;
}

/** 重写单例对象的allocWithZone方法, 防止单例对象被重复创建 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (_instance) {
        return _instance;
    }
    return [super allocWithZone:zone];
}

- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}

/**
 * 初始化请求配置，启动APP时调用，SDK也将初步检查当前接入商户APP的合法性
 * @param secretString 应用授权秘钥
 */
+ (void)initRequestConfigWithSecret:(NSString *)secretString {
    HiNetEncryptionConfig *_encryptConfig = [HiNetEncryptionConfig yy_modelWithJSON:secretString];
    [[HiMSEncryptionConfig shareConfig] registerEncryptConfig:_encryptConfig];
}


/**
 *  注册接口参数配置，未设置的属性将使用默认值填充
 *  @param encryptConfig 配置参数
 */
- (void)registerEncryptConfig:(HiNetEncryptionConfig *)encryptConfig
{
    self.encryptConfig = encryptConfig;
}


@end

@implementation HiNetEncryptionConfig

@end
