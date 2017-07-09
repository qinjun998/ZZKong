//
//  NSString+formatDate.m
//  ZZKong
//
//  Created by lee on 2017/5/2.
//  Copyright © 2017年 ZZKong. All rights reserved.
//

#import "NSString+formatDate.h"

@implementation NSString (formatDate)

-(NSString *)formateDate:(NSString *) strdate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    NSDate *date = [dateFormatter dateFromString:strdate];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];//四个y就是2014－10-15
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

@end
