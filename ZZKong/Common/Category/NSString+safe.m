//
//  NSString+safe.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "NSString+safe.h"

@implementation NSString (safe)

- (NSString *)safeSubstringFromIndex:(NSUInteger)from
{
    if (from > self.length) {
        return nil;
    } else {
        return [self substringFromIndex:from];
    }
}

- (NSString *)safeSubstringToIndex:(NSUInteger)to
{
    if (to > self.length) {
        return nil;
    } else {
        return [self substringToIndex:to];
    }
}

- (NSString *)safeSubstringWithRange:(NSRange)range
{
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    if (location+length > self.length) {
        return nil;
    } else {
        return [self substringWithRange:range];
    }
}

- (NSRange)safeRangeOfString:(NSString *)aString
{
    if (aString == nil) {
        return NSMakeRange(NSNotFound, 0);
    } else {
        return [self rangeOfString:aString];
    }
}

- (NSRange)safeRangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask
{
    if (aString == nil) {
        return NSMakeRange(NSNotFound, 0);
    } else {
        return [self rangeOfString:aString options:mask];
    }
}

- (NSString *)safeStringByAppendingString:(NSString *)aString
{
    if (aString == nil) {
        return [self stringByAppendingString:@""];
    } else {
        return [self stringByAppendingString:aString];
    }
}

- (id)safeInitWithString:(NSString *)aString
{
    if (aString == nil) {
        return [self initWithString:@""];
    } else {
        return [self initWithString:aString];
    }
}

+ (id)safeStringWithString:(NSString *)string
{
    if (string == nil) {
        return [self stringWithString:@""];
    } else {
        return [self stringWithString:string];
    }
}

-(NSString *)safeString{
   return [self safeStringDefaultValue:@""];
}
//-(NSString *)safeString:(NSString *)aString defaultValue:(NSString *)defaultValue {
//    if (![aString isKindOfClass:[NSString class]]){
//        return defaultValue;
//    }
//    if ([self isNull:aString]){
//        return defaultValue;
//    }
//    return aString;
//}
//
//- (id)safeString:(NSString *)aString{
//    return [self safeString:aString defaultValue:@""];
//}


-(NSString *)safeStringDefaultValue:(NSString *)defaultValue {
    if (![self isKindOfClass:[NSString class]]){
        return defaultValue;
    }
    if ([self isNull:self]){
        return defaultValue;
    }
    return self;
}

- (NSString *)safeString:(NSString *)aString{
    return [self safeStringDefaultValue:@""];
}


-(BOOL)isNull:(id)object {
    return (object == nil || [object isKindOfClass:[NSNull class]]);
}



@end
