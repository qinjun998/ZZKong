//
//  NSString+Base64.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "NSString+Base64.h"

#import "NSData+base64.h"


@implementation NSString (Base64)

+ (NSString *)stringWithBase64EncodedString:(NSString *)string
{
    NSData *data = [NSData dataWithBase64EncodedString:string];
    if (data)
    {
        NSString *result = [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
#if !__has_feature(objc_arc)
        [result autorelease];
#endif
        
        return result;
    }
    return nil;
}

- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data base64EncodedStringWithWrapWidth:wrapWidth];
}

- (NSString *)base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data base64EncodedString];
}

- (NSString *)base64DecodedString
{
    return [NSString stringWithBase64EncodedString:self];
}

- (NSData *)base64DecodedData
{
    return [NSData dataWithBase64EncodedString:self];
}

- (UIImage *)image{
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithBase64EncodedString:self]];
    return image;
}

@end
