//
//  NSDate+Format.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import <Foundation/Foundation.h>



@interface NSDate (Format)




/**
 *  把日期转化为yyyy/MM/dd
 *
 *  @return 转化后的字符串
 */
-(NSString *)dateToString_yyyyMMdd;

/**
 *  把日期转化为yyyy-MM-dd
 *
 *  @return 转化后的字符串
 */
-(NSString *)dateToString_yyyyMMdd1;
/**
 *  把日期转化为yyyy.MM.dd
 *
 *  @return 转化后的字符串
 */
-(NSString *)dateToString_yyyyMMdd2;

/**
 *  把日期转化为yyyy-MM-dd HH:mm
 *
 *  @return 转化后的字符串
 */
-(NSString *)dateToString_yyyyMMddHHmm;

/**
 *  把日期转化为yyyy-MM-dd HH:mm:ss
 *
 *  @return 转化后的字符串
 */
-(NSString *)dateToString_yyyyMMddHHmmss;

/**
 *  把日期转化为HH:mm
 *
 *  @return 转化后的字符串
 */
-(NSString *)dateToString_HHmm;

@end
