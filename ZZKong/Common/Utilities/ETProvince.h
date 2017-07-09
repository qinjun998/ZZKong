//
//  ETProvince.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETProvince : NSObject

/**
 *  功能:获取所有省份名称
 *  返回:所有省份名称
 */
+ (NSArray *)getAllProvinceName;

/**
 *  功能:根据省份id获取省份名称
 *  provinceId:省份id
 *  返回:省份名称
 */
+ (NSString *)getProvinceNameFromId:(NSNumber *)provinceId;

/**
 *  功能:根据省份名称获取省份id
 *  provinceName:省份名称
 *  返回:省份id
 */
+ (NSNumber *)getProvinceIdFromName:(NSString *)provinceName;


@end
