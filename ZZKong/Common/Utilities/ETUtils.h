//
//  ETUtils.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface ETUtils : NSObject




//价格处理
+(NSString *)priceStringWithPrice:(double)aPrice;
//正则表达式替换html标签
+(NSString *)replaceHtmlLabel:(NSString *)content;

+(NSString *)stringValueSafe:(id)item defaultValue:(NSString *)defaultValue;
+(NSString *)stringValueSafe:(id)item;
+(NSNumber *)numberValueSafe:(id)item;
+(NSString *)stringReplaceNil:(NSString *)item defaultValue:(NSString *)defaultValue;

+(NSString *)randomDigitString;

+(NSString *)phoneFormat:(NSString *)phone;
+(NSString *)clearPhoneFormat:(NSString *)phone;

+(BOOL)isNotNull:(id)object;
+(BOOL)isAllKindsNull:(id)object;//是否为空

//获得星座
//+(NSString *)getConstellationNameByMonth:(NSInteger)aMonth aDay:(NSInteger)aDay;
+(NSString *)calculateConstellationWithMonth:(NSInteger)month day:(NSInteger)day;
+(NSString *)getConstellationNameByStringDate:(NSString *)date; //yyyy-MM-dd
//等级转经验
+(double)expFromLevel:(double)level;
//经验转等级
+(double)levelFromExp:(double)exp;

//返回随机数组的下标
-(NSInteger) getRandom:(NSArray *) array;
//获得[0~num)的随机数
-(int)randomInNum:(NSInteger) num;

+ (void)openScheme:(NSString *)scheme;
+(void)openSchemePhone:(NSString *)phone; //拨打电话
+(void)openSchemeQQ:(NSString *)qq; //QQ跳转

//获得完整图片文件路径
+(NSString *)fullFilePath:(NSString *)relativePath;
@end
