//
//  NSObject+safe.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "NSObject+safe.h"
#import "NSObject+swizzle.h"
#import "ETLog.h"

@implementation NSObject (safe)

- (NSNumber *)toNumberIfNeeded
{
    if ([self isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)self;
    }
    
    if ([self isKindOfClass:[NSString class]]) {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterNoStyle;
        NSNumber *myNumber = [f numberFromString:(NSString *)self];
        return myNumber;
    }
    
    return nil;
}

@end

@implementation UIView (safe)

+ (void)load
{
    [self exchangeMethod:@selector(setFrame:) withMethod:@selector(safeSetFrame:)];
}

- (void)safeSetFrame:(CGRect)frame
{
    if (isnan(frame.origin.x)) {
        ETLogE(@"%@,isnan of x",self);
        [self safeSetFrame:CGRectZero];
        return;
    }
    
    if (isnan(frame.origin.y)) {
        ETLogE(@"%@,isnan of y",self);
        [self safeSetFrame:CGRectZero];
        return;
    }
    
    if (isnan(frame.size.width)) {
        ETLogE(@"%@,isnan of w",self);
        [self safeSetFrame:CGRectZero];
        return;
    }
    
    if (isnan(frame.size.height)) {
        ETLogE(@"%@,isnan of h",self);
        [self safeSetFrame:CGRectZero];
        return;
    }
    
    
    [self safeSetFrame:frame];
}


@end
