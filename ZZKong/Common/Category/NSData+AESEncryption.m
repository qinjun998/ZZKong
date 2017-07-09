//
//  NSData+AESEncryption.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "NSData+AESEncryption.h"
#import <CommonCrypto/CommonCryptor.h>

static char base64[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

//static Byte iv[] = {0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF};
// static Byte iv[] = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF, 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF,0x00};

//static Byte iv[] = { 0x78, 0x56,0x34,0x12, 0xEF,0xCD, 0xAB, 0x90, 0x78, 0x56,0x34,0x12, 0xEF,0xCD, 0xAB, 0x90,0x00};
static Byte iv[] = { 0x34,0x12, 0x78, 0x56,  0xAB,0x90, 0xEF, 0xCD,  0x34,0x12, 0x78, 0x56,  0xAB,0x90, 0xEF, 0xCD, 0x00};

static NSString *string;

@implementation NSData (AESEncryption)


//char ivPtr[kCCBlockSizeAES128 + 1];
//
//memset(ivPtr, 0, sizeof(ivPtr));
//
//[iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];

- (NSData *)AES256EncryptWithKey:(NSString *)key   //加密
{
    NSData *adata = [[NSData alloc] initWithBytes:iv length:16];

    NSString *aString = [[NSString alloc] initWithData:adata encoding:NSUTF8StringEncoding];
    
    
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
//    size_t bufferSize = dataLength + kCCBlockSizeAES128;kCCKeySizeAES256
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt
                                          , kCCAlgorithmAES128
                                          ,kCCOptionPKCS7Padding | kCCOptionECBMode
                                          ,keyPtr
                                          , kCCBlockSizeAES128
//                                          ,kCCKeySizeAES256
                                          ,NULL
                                          ,[self bytes] ,dataLength
                                          ,buffer
                                          , bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}


- (NSData *)AES256DecryptWithKey:(NSString *)key   //解密
{
    
    NSData *adata = [[NSData alloc] initWithBytes:iv length:16];
    
    NSString *aString = [[NSString alloc] initWithData:adata encoding:NSUTF8StringEncoding];
    
    
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt
                                          , kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr
                                          , kCCBlockSizeAES128
//                                          ,kCCKeySizeAES256
                                          ,NULL
                                          ,[self bytes]
                                          , dataLength
                                          ,buffer
                                          , bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    return nil;
}


- (NSString *)newStringInBase64FromData            //追加64编码
{
    NSMutableString *dest = [[NSMutableString alloc] initWithString:@""];
    unsigned char * working = (unsigned char *)[self bytes];
    int srcLen = [self length];
    for (int i=0; i<srcLen; i += 3) {
        for (int nib=0; nib<4; nib++) {
            int byt = (nib == 0)?0:nib-1;
            int ix = (nib+1)*2;
            if (i+byt >= srcLen) break;
            unsigned char curr = ((working[i+byt] << (8-ix)) & 0x3F);
            if (i+nib < srcLen) curr |= ((working[i+nib] >> ix) & 0x3F);
            [dest appendFormat:@"%c", base64[curr]];
        }
    }
    return dest;
}

+ (NSString*)base64encode:(NSString*)str
{
    if ([str length] == 0)
        return @"";
    const char *source = [str UTF8String];
    int strlength  = strlen(source);
    char *characters = malloc(((strlength + 2) / 3) * 4);
    if (characters == NULL)
        return nil;
    NSUInteger length = 0;
    NSUInteger i = 0;
    while (i < strlength) {
        char buffer[3] = {0,0,0};
        short bufferLength = 0;
        while (bufferLength < 3 && i < strlength)
            buffer[bufferLength++] = source[i++];
        characters[length++] = base64[(buffer[0] & 0xFC) >> 2];
        characters[length++] = base64[((buffer[0] & 0x03) << 4) | ((buffer[1] & 0xF0) >> 4)];
        if (bufferLength > 1)
            characters[length++] = base64[((buffer[1] & 0x0F) << 2) | ((buffer[2] & 0xC0) >> 6)];
        else characters[length++] = '=';
        if (bufferLength > 2)
            characters[length++] = base64[buffer[2] & 0x3F];
        else characters[length++] = '=';
    }
    
    NSString *g = [[NSString alloc] initWithBytesNoCopy:characters length:length encoding:NSASCIIStringEncoding freeWhenDone:YES];
    return g;
}


//@end

//int main(int argc, char const* argv[])
//{
//    NSAutoreleasePool* pool;
//    pool = [[NSAutoreleasePool alloc] init];
//    
//    NSString *key = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
//    NSString *iv = [NSString stringWithCString:argv[2] encoding:NSUTF8StringEncoding];
//    NSString *data_str = [NSString stringWithCString:argv[3] encoding:NSUTF8StringEncoding];
//    NSData *data = [data_str dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSData *en_data = [data AES128EncryptWithKey:key iv:iv];
//    NSData *de_data = [en_data AES128DecryptWithKey:key iv:iv];
//    
//    NSString *de_str = [[[NSString alloc] initWithData:de_data
//                                              encoding:NSUTF8StringEncoding] autorelease];
//    
//    NSLog(@"%@", en_data);
//    NSLog(@"%@", de_str);
//    
//    [pool drain];
//    return 0;
//}
@end
