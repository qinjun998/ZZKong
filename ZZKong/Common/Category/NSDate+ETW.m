//
//  NSDate+ETW.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "NSDate+ETW.h"

#import "NSString+safe.h"

@implementation NSDate (ETW)

- (NSInteger )distanceNowDays
{
    NSTimeInterval seconds = [self timeIntervalSinceNow];
    if (seconds < 0) {
        seconds = -seconds;
    }
    NSInteger daySeconds = 60 * 60 * 24;
    NSInteger days = (NSInteger)(seconds / daySeconds);
    return days;
}

- (NSString *)distanceNowDescribe
{
    NSTimeInterval sinceTime = [self timeIntervalSinceNow];
    NSInteger dayOfSeconds = 60 * 60 * 24;
    NSInteger days = (NSInteger)(sinceTime / dayOfSeconds);
    if (days < 0) {
        days = 0;
    }
    NSInteger hourOfSeconds = 60 * 60;
    NSInteger hours = ((NSInteger)sinceTime / hourOfSeconds) % 24;
    
    NSInteger minuteOfSeconds = 60;
    NSInteger minutes = ((NSInteger)sinceTime / minuteOfSeconds) % 60;
    NSInteger seconds = (NSInteger)sinceTime % 60;
    
    NSString *describe = nil;
    if (days > 1) {
        describe = [NSString stringWithFormat:@"%d天",(int)days];
    }
    else if (hours > 1) {
        describe = [NSString stringWithFormat:@"%d小时",(int)hours];
    }
    else if(minutes > 1) {
        describe = [NSString stringWithFormat:@"%d分",(int)minutes];
    }
    else {
        describe = [NSString stringWithFormat:@"%d秒",(int)seconds];
    }
    
    
    return describe;
}

- (NSDictionary *)distanceNowDic
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:kCFCalendarUnitDay|kCFCalendarUnitHour| kCFCalendarUnitMinute|kCFCalendarUnitSecond fromDate:[NSDate date] toDate:self options:0];
    
    NSDictionary * dic = nil;
    dic = [NSDictionary dictionaryWithObjectsAndKeys:@(comps.day),@"day",@(comps.hour),@"hour",@(comps.minute),@"minute",@(comps.second),@"second",nil];
    
    return dic;
}

- (NSDictionary *)distanceYearMonthDayFromNowDic
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:kCFCalendarUnitYear|kCFCalendarUnitMonth| kCFCalendarUnitDay fromDate:self toDate:[NSDate date] options:0];
    
    NSDictionary * dic = nil;
    dic = [NSDictionary dictionaryWithObjectsAndKeys:@(comps.year),@"year",@(comps.month),@"month",@(comps.day),@"day",nil];
    
    return dic;
}

/**
 *  功能:转换成日期字符串，精确到天
 */
- (NSString *)dateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    formatter.timeZone = [NSTimeZone localTimeZone];
    
    NSString *ret = [formatter stringFromDate:self];
    
    if (ret.length >= 10) {
        ret = [ret safeSubstringWithRange:NSMakeRange(0, 10)];
    }
    return ret;
}

/**
 *  功能:转换成时间字符串，精确到秒
 */
- (NSString *)timeString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    formatter.timeZone = [NSTimeZone localTimeZone];
    
    NSString *ret = [formatter stringFromDate:self];
    
    if (ret.length >= 19) {
        ret = [ret safeSubstringWithRange:NSMakeRange(0, 19)];
    }
    return ret;
}

/**
 *  功能:转换成时间字符串，获取时分秒部分
 */
- (NSString *)hourMinuteSecondString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    formatter.timeZone = [NSTimeZone localTimeZone];
    
    NSString *ret = [formatter stringFromDate:self];
    
    if (ret.length >= 19) {
        ret = [ret safeSubstringWithRange:NSMakeRange(11, 8)];
    }
    return ret;
}

/**
 *  功能:转换成时间字符串，获取时分部分
 *
 *	@return
 */
- (NSString *)hourMinuteString
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    formatter.timeZone = [NSTimeZone localTimeZone];
    
    NSString *ret = [formatter stringFromDate:self];
    
    if (ret.length >= 19) {
        ret = [ret safeSubstringWithRange:NSMakeRange(11, 5)];
    }
    return ret;
}

/**
 *  功能:转换成时间字符串，获取时部分
 *
 *	@return
 */
- (NSString *)hourString
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    formatter.timeZone = [NSTimeZone localTimeZone];
    
    NSString *ret = [formatter stringFromDate:self];
    
    if (ret.length >= 19) {
        ret = [ret safeSubstringWithRange:NSMakeRange(11, 2)];
    }
    return ret;
}

/**
 *  功能:转换成时间字符串，获取月天时分秒部分
 */
- (NSDictionary *)monthDayHourMinuteString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    formatter.timeZone = [NSTimeZone localTimeZone];
    
    NSString *ret = [formatter stringFromDate:self];
    NSDictionary * dic = nil;
    if (ret.length >= 19) {
        NSString *month = [ret safeSubstringWithRange:NSMakeRange(5, 2)];
        NSString *day = [ret safeSubstringWithRange:NSMakeRange(8, 2)];
        NSString *hour = [ret safeSubstringWithRange:NSMakeRange(11, 2)];
        NSString *minute = [ret safeSubstringWithRange:NSMakeRange(14, 2)];
        dic = [NSDictionary dictionaryWithObjectsAndKeys:month,@"month",day,@"day",hour,@"hour",minute,@"minute", nil];
    }
    return dic;
}

/**
 功能:转换成周
 */
- (NSString *)zhouString {
    
    NSString *g_strZhou[] = {
        @"周日",
        @"周一",
        @"周二",
        @"周三",
        @"周四",
        @"周五",
        @"周六"
    };
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:kCFCalendarUnitWeekday|NSYearCalendarUnit| NSMonthCalendarUnit|NSDayCalendarUnit fromDate:self];
    if ( comps.weekday > 0 && comps.weekday <= 7) {
        return g_strZhou[comps.weekday-1];
    }
    else {
        return @"";
    }
}

/**
 *  是否是今天的日期
 *
 *  @return 返回YES OR NO
 */
- (BOOL)isTodayDate
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *today = [dateFormatter stringFromDate:[NSDate date]];
    NSString *day = [dateFormatter stringFromDate:self];
    
    if ([today isEqualToString:day])
    {
        return YES;
    }
    
    return NO;
}

/**
 *  是否昨天
 */
- (BOOL)isYesterday
{
    NSDate *nowDate = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selStr = [fmt stringFromDate:self];
    NSDate *selfDate = [fmt dateFromString:selStr];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    NSLog(@"%ld",(long)cmps.day);
    return cmps.day == 1;
}

/**
 *  是否是今年的日期
 *
 *  @return 返回YES OR NO
 */
- (BOOL)isCurrentYearDate
{
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy"];
    NSString *today = [dateFormatter stringFromDate:[NSDate date]];
    NSString *day = [dateFormatter stringFromDate:self];
    
    if ([today isEqualToString:day])
    {
        return YES;
    }
    
    return NO;
}

/**
 *  判断与当前时间差值
 */
- (NSDateComponents *)deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

//根据日期判断是刚刚、几分钟前、几小时前
//http://blog.csdn.net/woaifen3344/article/details/44240915

- (NSString *)prettyDateWithReference:(NSDate *)reference {
    //把字符串转为NSdate
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
//    NSDate *timeDate = [dateFormatter dateFromString:str];
//    NSDate *nowDate =[NSDate date];

    
    NSString *suffix = @"前";
    float different = [reference timeIntervalSinceDate:self];
    if (different < 0) {
        different = -different;
        suffix = @"现在";
    }
    
    // days = different / (24 * 60 * 60), take the floor value
    float dayDifferent = floor(different / 86400);
    
    int days   = (int)dayDifferent;
    int weeks  = (int)ceil(dayDifferent / 7);
    int months = (int)ceil(dayDifferent / 30);
    int years  = (int)ceil(dayDifferent / 365);
    
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
        return [NSString stringWithFormat:@"%d天%@ %@", days, days == 1 ? @"" : @"s", suffix];
    }
    // lager than one week but lower than a month
    else if (weeks < 4) {
        return [NSString stringWithFormat:@"%d星期%@ %@", weeks, weeks == 1 ? @"" : @"s", suffix];
    }
    // lager than a month and lower than a year
    else if (months < 12) {
        return [NSString stringWithFormat:@"%d月%@ %@", months, months == 1 ? @"" : @"s", suffix];
    }
    // lager than a year
    else {  
        return [NSString stringWithFormat:@"%d年%@ %@", years, years == 1 ? @"" : @"s", suffix];
    }  
    
    return self.description;
}

//默认是和当前时间进行比较
- (NSString *)prettyDate{
   return [self prettyDateWithReference:[NSDate date]];
}



@end
