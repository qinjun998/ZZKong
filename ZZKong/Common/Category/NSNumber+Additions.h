//
//  NSNumber+Additions.h
//  ZZKong
//
//  Created by lee on 16/10/19.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Additions)

//转换成yyyy/MM/dd
-(NSString *)numberToStringFormatYyyyMMdd1;
//转换成yyyy-MM-dd
-(NSString *)numberToStringFormatYyyyMMdd2;
//转换成yyyy.MM.dd
-(NSString *)numberToStringFormatYyyyMMdd3;

//获得汉字描述时间格式
- (NSString *)prettyDateWithReference:(NSDate *)reference;
//获得汉字描述时间格式
- (NSString *)prettyDate;

//和参数比较是否过期
-(BOOL)expiresWithDate:(NSDate *)date;
-(BOOL)expiresWithNow;  //和当前时间比较是否过期
@end
