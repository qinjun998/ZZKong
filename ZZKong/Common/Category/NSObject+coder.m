//
//  NSObject+coder.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "NSObject+coder.h"

#import "NSObject+runtime.h"

@interface NSObject () <NSCoding>

@end

@implementation NSObject (coder)

- (id)etDecodeWithCoder:(NSCoder *)aDecoder
{
    [[self getProperties] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self setValue:[aDecoder decodeObjectForKey:obj] forKey:obj];
    }];
    return self;
}

- (void)etEncodeWithCoder:(NSCoder *)aCoder
{
    [[self getProperties] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [aCoder encodeObject:[self valueForKey:obj] forKey:obj];
    }];
}


@end
