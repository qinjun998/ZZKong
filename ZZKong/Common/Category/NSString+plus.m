//
//  NSString+plus.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "NSString+plus.h"
#import "NSArray+safe.h"

@implementation NSString (plus)

- (NSUInteger)byteCount
{
    NSUInteger length = 0;
    char *pStr = (char *)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i = 0 ; i < [self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*pStr) {
            pStr++;
            length++;
        }
        else {
            pStr++;
        }
    }
    return length;
}

- (NSNumber*)toNumber
{
    NSNumberFormatter *formatter=[[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *number=[formatter numberFromString:self];
    return number;
}

- (NSString *)urlEncoding
{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (NSString *)urlDecoding
{
    return self.stringByRemovingPercentEncoding;
}

- (NSString *)urlEncodingAllCharacter
{
    NSString *outputStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,                                            (CFStringRef)self, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]",                                            kCFStringEncodingUTF8));
    return outputStr;
}

/**
 *  功能:html语句居中处理
 */
- (NSString *)makeHtmlAlignCenter
{
    return  [NSString stringWithFormat:@"<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><meta name=viewport content=width=device-width, user-scalable=yes ><style type=\"text/css\">body{text-align:center;}div{width:750px;margin:10 auto;text-align:left;}</style></head><body><div>%@</div></body>",self];
}

/**
 *  功能:拼装2个组合字串(知道首字串长度)
 */
- (NSAttributedString *)attributedStringWithHeadAttributes:(NSDictionary *)aAttributes
                                            tailAttributes:(NSDictionary *)bAttributes
                                                headLength:(NSUInteger)aLength
{
    NSRange headRange = NSMakeRange(0, aLength);
    NSRange tailRange = NSMakeRange(aLength, self.length-aLength);
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    [attributedString setAttributes:aAttributes range:headRange];
    [attributedString setAttributes:bAttributes range:tailRange];
    
    return attributedString;
}

/**
 *  功能:拼装2个组合字串(知道尾字串长度)
 */
- (NSAttributedString *)attributedStringWithHeadAttributes:(NSDictionary *)aAttributes
                                            tailAttributes:(NSDictionary *)bAttributes
                                                tailLength:(NSUInteger)aLength
{
    NSRange headRange = NSMakeRange(0, self.length-aLength);
    NSRange tailRange = NSMakeRange(self.length-aLength, aLength);
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    [attributedString setAttributes:aAttributes range:headRange];
    [attributedString setAttributes:bAttributes range:tailRange];
    
    return attributedString;
}

/**
 *  功能:拼装3个组合字串(知道首尾长度)
 */
- (NSAttributedString *)attributedStringWithHeadAttributes:(NSDictionary *)aAttributes
                                             midAttributes:(NSDictionary *)bAttributes
                                            tailAttributes:(NSDictionary *)cAttributes
                                                headLength:(NSUInteger)aLength
                                                tailLength:(NSUInteger)cLength
{
    NSRange headRange = NSMakeRange(0, aLength);
    NSRange midRange = NSMakeRange(aLength, self.length-aLength-cLength);
    NSRange tailRange = NSMakeRange(self.length-cLength, cLength);
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    [attributedString setAttributes:aAttributes range:headRange];
    [attributedString setAttributes:bAttributes range:midRange];
    [attributedString setAttributes:cAttributes range:tailRange];
    
    return attributedString;
}

/**
 *  替换字符串中指定的内容
 *
 *  @param fromAry    扫描字符串
 *  @param replaceAry 用于替换的字符串
 *
 *  @return 返回的结果
 */
- (NSString *)replaceFromArray:(NSArray *)fromAry withArray:(NSArray *)replaceAry
{
    NSString *result = [NSString stringWithString:self];
    if (result.length>0 && [fromAry count]>0 &&([fromAry count] == [replaceAry count])) {
        for (int i =0;i< [fromAry count];i ++) {
            id fromStr = [fromAry objectAtIndex:i];
            id replaceStr = [replaceAry objectAtIndex:i];
            if ([fromStr isKindOfClass:[NSString class]] && [replaceStr isKindOfClass:[NSString class]]) {
                result = [result stringByReplacingOccurrencesOfString:fromStr withString:replaceStr];
            }
            else
            {
                return self;
            }
        }
    }
    return result;
}

/**
 *  功能:版本号比较
 */
- (NSComparisonResult)versionCompare:(NSString *)aString
{
    NSArray *selfComponents = [self componentsSeparatedByString:@"."];
    NSArray *aComponents = [aString componentsSeparatedByString:@"."];
    NSUInteger maxCount = MAX(selfComponents.count, aComponents.count);
    for (NSUInteger i=0; i<maxCount; i++) {
        NSString *selfComponent = [selfComponents safeObjectAtIndex:i];
        if (selfComponent == nil) {
            selfComponent = @"0";
        }
        NSString *aComponent = [aComponents safeObjectAtIndex:i];
        if (aComponent == nil) {
            aComponent = @"0";
        }
        NSComparisonResult result = [selfComponent compare:aComponent];
        if (result == NSOrderedSame) {
            continue;
        } else {
            return result;
        }
    }
    
    return NSOrderedSame;
}

//计算一段字符串的长度，两个英文字符占一个长度。
+ (int)countTheStrLength:(NSString *)strtemp
{
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return (strlength+1)/2;
}


-(NSString *)stringReplaceWithAsterisk:(NSString *)original startLoc:(NSInteger)startLoc length:(NSInteger)length{
    NSString *newStr = original;
    for (int i = 0; i < length; i++) {
        NSRange range = NSMakeRange(startLoc, 1);
        newStr = [newStr stringByReplacingCharactersInRange:range withString:@"*"];
        startLoc ++;
    }
    return newStr;
}

@end
