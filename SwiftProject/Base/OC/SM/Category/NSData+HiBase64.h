//
//  NSData+HiBase64.h
//  Hi-SwiftUI
//
//  Created by stone on 2025/5/20.

#import <Foundation/Foundation.h>

void *Hi_NewBase64Decode(
	const char *inputBuffer,
	size_t length,
	size_t *outputLength);

char *Hi_NewBase64Encode(
	const void *inputBuffer,
	size_t length,
	bool separateLines,
	size_t *outputLength);

@interface NSData (Base64)

+ (NSData *)hi_dataFromBase64String:(NSString *)aString;
- (NSString *)hi_base64EncodedString;

@end
