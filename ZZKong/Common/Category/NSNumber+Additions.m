//
//  NSNumber+Additions.m
//  ZZKong
//
//  Created by lee on 16/10/19.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "NSNumber+Additions.h"
#import "NSDate+Format.h"

@implementation NSNumber (Additions)

//转换成yyyy/MM/dd
-(NSString *)numberToStringFormatYyyyMMdd1{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self longLongValue]] ;
    return [date dateToString_yyyyMMdd];
}
//转换成yyyy-MM-dd
-(NSString *)numberToStringFormatYyyyMMdd2{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self longLongValue]] ;
    return [date dateToString_yyyyMMdd1];
}

//转换成yyyy.MM.dd
-(NSString *)numberToStringFormatYyyyMMdd3{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self longLongValue]] ;
    return [date dateToString_yyyyMMdd2];
}

//根据日期判断是刚刚、几分钟前、几小时前
//http://blog.csdn.net/woaifen3344/article/details/44240915

- (NSString *)prettyDateWithReference:(NSDate *)reference {

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self longLongValue]] ;
    
    NSString *suffix = @"前";
    float different = [reference timeIntervalSinceDate:date];  //日期相减
    if (different < 0) {
        different = -different;
        suffix = @"现在";
    }
    // days = different / (24 * 60 * 60), take the floor value
    float dayDifferent = floor(different / 86400);
    
    int days   = (int)dayDifferent;
//    int weeks  = (int)ceil(dayDifferent / 7);
//    int months = (int)ceil(dayDifferent / 30);
//    int years  = (int)ceil(dayDifferent / 365);
    int weeks  = (int)floor(dayDifferent / 7);
   int months = (int)floor(dayDifferent / 30);
   int years  = (int)floor(dayDifferent / 365);
    
    
    // It belongs to today
    if (dayDifferent <= 0) {
        // lower than 60 seconds
        if (different < 60) {
            return @"刚刚";
        }
        // lower than 120 seconds => one minute and lower than 60 seconds
        if (different < 120) {
            return [NSString stringWithFormat:@"一分钟%@", suffix];
        }
        
        // lower than 60 minutes
        if (different < 660 * 60) {
            return [NSString stringWithFormat:@"%d分钟%@", (int)floor(different / 60), suffix];
        }
        
        // lower than 60 * 2 minutes => one hour and lower than 60 minutes
        if (different < 7200) {
            return [NSString stringWithFormat:@"一小时%@", suffix];
        }
        
        // lower than one day
        if (different < 86400) {
            return [NSString stringWithFormat:@"%d小时%@", (int)floor(different / 3600), suffix];
        }
    }
    // lower than one week
    else if (days < 7) {
        return [NSString stringWithFormat:@"%d天%@%@", days, days == 1 ? @"" : @"", suffix];
    }
    // lager than one week but lower than a month
    else if (weeks < 4) {
        return [NSString stringWithFormat:@"%d星期%@%@", weeks, weeks == 1 ? @"" : @"", suffix];
    }
    // lager than a month and lower than a year
    else if (months < 12) {
        NSString *string =  [NSString stringWithFormat:@"%d月%@%@", months, months == 1 ? @"" : @"", suffix];
        return string;
    }
    // lager than a year
    else {
        return [NSString stringWithFormat:@"%d年%@%@", years, years == 1 ? @"" : @"", suffix];
    }
    
    return self.description;
}

- (NSString *)prettyDate{
//    NSDate *selfDate = [NSDate dateWithTimeIntervalSince1970:[self longLongValue]] ;
    return [self prettyDateWithReference:[NSDate date]];  //和当前时间比较
}


//和参数比较是否过期
//{NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending};
-(BOOL)expiresWithDate:(NSDate *)date;{
    NSDate *selfDate = [NSDate dateWithTimeIntervalSince1970:[self longLongValue]] ;
    if ([date compare:selfDate] == NSOrderedAscending) {
        return NO;
    }
    return YES;
}

-(BOOL)expiresWithNow{
    return [self expiresWithDate:[NSDate date]];
}

@end
