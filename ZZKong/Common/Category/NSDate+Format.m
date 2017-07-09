//
//  NSDate+Format.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "NSDate+Format.h"

@implementation NSDate (Format)

/**
 *  把日期转化为yyyy/MM/dd
 *
 *  @return 转化后的字符串
 */
-(NSString *)dateToString_yyyyMMdd{
    
    if ([self isKindOfClass:[NSDate class]])
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"yyyy/MM/dd"];
        
        NSString *anString = [dateFormatter stringFromDate:(NSDate *)self];
        
        return anString;
    }
    
    return nil;
}


/**
 *  把日期转化为yyyy-MM-dd
 *
 *  @return 转化后的字符串
 */
-(NSString *)dateToString_yyyyMMdd1{
    
    if ([self isKindOfClass:[NSDate class]])
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        
        NSString *anString = [dateFormatter stringFromDate:(NSDate *)self];
        
        return anString;
    }
    
    return nil;
}

/**
 *  把日期转化为yyyy-MM-dd
 *
 *  @return 转化后的字符串
 */
-(NSString *)dateToString_yyyyMMdd2{
    
    if ([self isKindOfClass:[NSDate class]])
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"yyyy.MM.dd"];
        
        NSString *anString = [dateFormatter stringFromDate:(NSDate *)self];
        
        return anString;
    }
    
    return nil;
}

/**
 *  把日期转化为HH:mm
 *
 *  @return 转化后的字符串
 */
-(NSString *)dateToString_HHmm {
    if ([self isKindOfClass:[NSDate class]])
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"HH:mm"];
        
        NSString *anString = [dateFormatter stringFromDate:(NSDate *)self];
        
        return anString;
    }
    
    return nil;
}

/**
 *  把日期转化为yyyy-MM-dd HH:mm
 *
 *  @return 转化后的字符串
 */
-(NSString *)dateToString_yyyyMMddHHmm {
    if ([self isKindOfClass:[NSDate class]])
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        
        NSString *anString = [dateFormatter stringFromDate:(NSDate *)self];
        
        return anString;
    }
    
    return nil;
}

/**
 *  把日期转化为yyyy-MM-dd HH:mm:ss
 *
 *  @return 转化后的字符串
 */
-(NSString *)dateToString_yyyyMMddHHmmss{
    if ([self isKindOfClass:[NSDate class]])
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        NSString *anString = [dateFormatter stringFromDate:(NSDate *)self];
        
        return anString;
    }
    
    return nil;
}

@end
