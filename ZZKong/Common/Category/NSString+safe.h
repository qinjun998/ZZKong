//
//  NSString+safe.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (safe)

- (NSString *)safeSubstringFromIndex:(NSUInteger)from;

- (NSString *)safeSubstringToIndex:(NSUInteger)to;

- (NSString *)safeSubstringWithRange:(NSRange)range;

- (NSRange)safeRangeOfString:(NSString *)aString;

- (NSRange)safeRangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask;

- (NSString *)safeStringByAppendingString:(NSString *)aString;

- (id)safeInitWithString:(NSString *)aString;

+ (id)safeStringWithString:(NSString *)string;


//安全获得String
//-(NSString *)safeString:(NSString *)aString defaultValue:(NSString *)defaultValue;
//-(id)safeString:(NSString *)aString;
-(BOOL)isNull:(id)object;


-(NSString *)safeStringDefaultValue:(NSString *)defaultValue;
-(NSString *)safeString;


@end
