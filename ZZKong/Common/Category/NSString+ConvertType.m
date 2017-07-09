//
//  NSString+ConvertType.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "NSString+ConvertType.h"

@implementation NSString (ConvertType)
+(NSString *) unicodeToUtf8:(NSString *)string
{
    NSString *tempStr1 = [string stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = (tempStr2 ? [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""] : tempStr2);
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    if ([returnStr isKindOfClass:[NSString class]])
    {
        return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
    }
    else
    {
        return nil;
    }
}

+(NSString *) utf8ToUnicode:(NSString *)string
{
    NSUInteger length = [string length];
    NSMutableString *s = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++) {
        unichar _char = [string characterAtIndex:i];
        //判断是否为英文和数字
        if (_char <= '9' && _char >= '0') {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
        }else if(_char >= 'a' && _char <= 'z')
        {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
        }else if(_char >= 'A' && _char <= 'Z')
        {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
        }else
        {
            [s appendFormat:@"\\u%x",[string characterAtIndex:i]];
        }
        
    }
    return s;
}



@end
