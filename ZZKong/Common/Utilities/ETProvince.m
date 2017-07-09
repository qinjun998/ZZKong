//
//  ETProvince.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETProvince.h"
#import "ETFuncDefine.h"
#import "NSArray+safe.h"

@implementation ETProvince

/**
 *  功能:获取所有省份名称
 *  返回:所有省份名称
 */
+ (NSArray *)getAllProvinceName
{
    NSArray *allProvinceName = [NSArray arrayWithObjects:ETSTRING(@"上海"), ETSTRING(@"北京"), ETSTRING(@"天津"), ETSTRING(@"河北"), ETSTRING(@"江苏"), ETSTRING(@"浙江"), ETSTRING(@"重庆"), ETSTRING(@"内蒙古"), ETSTRING(@"辽宁"), ETSTRING(@"吉林"), ETSTRING(@"黑龙江"), ETSTRING(@"四川"), ETSTRING(@"安徽"), ETSTRING(@"福建"), ETSTRING(@"江西"), ETSTRING(@"山东"), ETSTRING(@"河南"), ETSTRING(@"湖北"), ETSTRING(@"湖南"), ETSTRING(@"广东"), ETSTRING(@"广西"), ETSTRING(@"海南"), ETSTRING(@"贵州"), ETSTRING(@"云南"), ETSTRING(@"西藏"), ETSTRING(@"陕西"), ETSTRING(@"甘肃"), ETSTRING(@"青海"), ETSTRING(@"新疆"), ETSTRING(@"宁夏"), ETSTRING(@"台湾"), ETSTRING(@"山西"), nil];
    
    return allProvinceName;
}

/**
 *  功能:根据省份id获取省份名称
 *  provinceId:省份id
 *  返回:省份名称
 */
+ (NSString *)getProvinceNameFromId:(NSNumber *)provinceId
{
    int provinceIdValue = [provinceId intValue];
    NSArray *allProvinceName = [self getAllProvinceName];
    NSString *provinceName = [allProvinceName safeObjectAtIndex:provinceIdValue-1];
    return provinceName;
}

/**
 *  功能:根据省份名称获取省份id
 *  provinceName:省份名称
 *  返回:省份id
 */
+ (NSNumber *)getProvinceIdFromName:(NSString *)provinceName
{
    NSArray *allProvinceName = [self getAllProvinceName];
    NSUInteger index = [allProvinceName indexOfObject:provinceName];
    if (index != NSNotFound) {
        return @(index + 1);
    } else {
        return @1;
    }
}

@end
