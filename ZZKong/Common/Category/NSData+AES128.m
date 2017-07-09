//
//  NSData+AES128.m
//  ZZKong
//
//  Created by lee on 16/10/17.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "NSData+AES128.h"
#import <CommonCrypto/CommonCryptor.h>
#import "NSData+Base64.h"
#import "NSString+Base64.h"


@implementation NSData (AES128)

//
//- (NSString *)encryptUseDES:(NSString *)plainText key:(NSString *)key
//{
//    NSString *ciphertext = nil;
//    const char *textBytes = [plainText UTF8String];
//    NSUInteger dataLength = [plainText length];
//    unsigned char buffer[1024];
//    memset(buffer, 0, sizeof(char));
//    Byte iv[] = {1,2,3,4,5,6,7,8};
//    size_t numBytesEncrypted = 0;
//    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
//                                          kCCAlgorithmDES,
//                                          kCCOptionPKCS7Padding,
//                                          [key UTF8String],
//                                          kCCKeySizeDES,
//                                          iv,
//                                          textBytes,
//                                          dataLength,
//                                          buffer,
//                                          1024,
//                                          &numBytesEncrypted);
//    if (cryptStatus == kCCSuccess) {
//        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
//        
////        ciphertext = [[[NSString alloc] initWithData:[GTMBase64 encodeData:data] encoding:NSUTF8StringEncoding] autorelease];
//        
//         ciphertext = [[NSString alloc] initWithData:[GTMBase64 encodeData:data] encoding:NSUTF8StringEncoding];
//    }
//    
//    return ciphertext;
//}
//
///**
// *  3DES解密
// *
// *  @param cipherText 密文
// *  @param key        密钥
// *
// *  @return 解密结果
// */
//- (NSString *)decryptUseDES:(NSString*)cipherText key:(NSString*)key
//{
//    NSData* cipherData = [GTMBase64 decodeString:cipherText];
//    unsigned char buffer[1024];
//    memset(buffer, 0, sizeof(char));
//    size_t numBytesDecrypted = 0;
//    Byte iv[] = {1,2,3,4,5,6,7,8};
//    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
//                                          kCCAlgorithmDES,
//                                          kCCOptionPKCS7Padding,
//                                          [key UTF8String],
//                                          kCCKeySizeDES,
//                                          iv,
//                                          [cipherData bytes],
//                                          [cipherData length],
//                                          buffer,
//                                          1024,
//                                          &numBytesDecrypted);
//    NSString* plainText = nil;
//    
//    if (cryptStatus == kCCSuccess) {
//        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
//        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    }
//    
//    return plainText;
//}


@end
