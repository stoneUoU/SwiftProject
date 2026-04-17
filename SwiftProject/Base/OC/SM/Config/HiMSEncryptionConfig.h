//
//  HiMSEncryptionConfig.h
//  Hi-SwiftUI
//
//  Created by stone on 2025/5/20.

#import "HiMSEncryptionConfig.h"
#import "HiRequestEncryptConfigKeys.h"

NS_ASSUME_NONNULL_BEGIN

@class HiNetEncryptionConfig;

@interface HiMSEncryptionConfig : NSObject

+ (instancetype)shareConfig;

+ (void)initRequestConfigWithSecret:(NSString *)secretString;

@property (nonatomic, strong) HiNetEncryptionConfig *encryptConfig;

@end

@interface HiNetEncryptionConfig : NSObject

@property (nonatomic, copy) NSString *aesIv;

// 加密的类型:
@property (nonatomic, copy) NSString *encodeType;

@property (nonatomic, copy) NSString *sm2Iv;

@property (nonatomic, copy) NSString *sm2PublicKey;

@property (nonatomic, copy) NSString *sm2PrivateKey;

// 加签的类型:
@property (nonatomic, copy) NSString *signEncodeType;

@end

NS_ASSUME_NONNULL_END

