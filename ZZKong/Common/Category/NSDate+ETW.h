//
//  NSDate+ETW.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSDate (ETW)

/**
 *	功能:获取距离现在的天数，小于一天为0
 *
 *	@return
 */
- (NSInteger )distanceNowDays;

/**
 *	功能:日期距离当前时间的描述，改描述为:_天_时_分_秒
 *
 *	@return
 */
- (NSString *)distanceNowDescribe;

/**
 *  功能:日期距离当前时间的描述，改描述为:_天_时_分_秒
 *
 *  @return map
 */
- (NSDictionary *)distanceNowDic;

/**
 *  功能:年月日从现在
 *
 *  @return map
 */
- (NSDictionary *)distanceYearMonthDayFromNowDic;

/**
 *  功能:转换成日期字符串，精确到天
 */
- (NSString *)dateString;

/**
 *  功能:转换成时间字符串，精确到秒
 */
- (NSString *)timeString;

/**
 *  功能:转换成时间字符串，获取时分秒部分
 */
- (NSString *)hourMinuteSecondString;

/**
 *  功能:转换成时间字符串，获取时分部分
 *
 *	@return
 */
- (NSString *)hourMinuteString;
/**
 *  功能:转换成时间字符串，获取时部分
 *
 *	@return
 */
- (NSString *)hourString;
/**
 *  功能:转换成时间字符串，获取月天时分秒部分
 */
- (NSDictionary *)monthDayHourMinuteString;

/**
 功能:转换成周
 */
- (NSString *)zhouString;

/**
 *  是否是今天的日期
 *
 *  @return 返回YES OR NO
 */
- (BOOL)isTodayDate;

/**
 *  是否昨天
 */
- (BOOL)isYesterday;

/**
 *  是否是今年的日期
 *
 *  @return 返回YES OR NO
 */
- (BOOL)isCurrentYearDate;

/**
 *  判断与当前时间差值
 */
- (NSDateComponents *)deltaWithNow;

//获取时间的文字描述
- (NSString *)prettyDate;


@end
