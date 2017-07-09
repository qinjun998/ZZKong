//
//  NSNumber+safe.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "NSNumber+safe.h"

@implementation NSNumber (safe)

- (BOOL)safeIsEqualToNumber:(NSNumber *)number
{
    if (number == nil || ![number isKindOfClass:[NSNumber class]]) {
        return NO;
    } else {
        return [self isEqualToNumber:number];
    }
}

- (NSComparisonResult)safeCompare:(NSNumber *)otherNumber
{    
    if (otherNumber == nil) {
        return NSOrderedDescending;
    } else {
        return [self compare:otherNumber];
    }
}

@end
