//
//  ETUtils.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ETUtils.h"
#import "NSArray+safe.h"
#import <YTKNetwork/YTKNetworkConfig.h>

@implementation ETUtils


+(NSString *)stringValueSafe:(id)item defaultValue:(NSString *)defaultValue {
    if ([item respondsToSelector:@selector(stringValue)]) {
        return [item stringValue];
    } else if ([item isKindOfClass:[NSString class]]) {
        return item;
    }
    
    return defaultValue ? : @"";
}

+(NSString *)stringReplaceNil:(NSString *)item defaultValue:(NSString *)defaultValue{
    if(!item || [item isEqualToString:@""]){
        return defaultValue;
    }else{
        return item;
    }
}


+(NSString *)stringValueSafe:(id)item {
    return [self stringValueSafe:item defaultValue:nil];
}

+(NSNumber *)numberValueSafe:(id)item {
    if ([item respondsToSelector:@selector(doubleValue)]) {
        return @([item doubleValue]);
    } if ([item respondsToSelector:@selector(longLongValue)]) {
        return @([item longLongValue]);
    } else if ([item isKindOfClass:[NSNumber class]]) {
        return item;
    }
    
    return @0;
}


//价格处理
+(NSString *)priceStringWithPrice:(double)aPrice{
    
    NSString *aPriceText = [NSString stringWithFormat:@"%.2f",aPrice];
    
    if (aPriceText.length <= 0) {
        return @"0";
    }
    
    NSArray *strArray = [aPriceText componentsSeparatedByString:@"."];
    NSString *firstStr = [strArray safeObjectAtIndex:0];
    NSString *secondStr = [strArray safeObjectAtIndex:1];
    
    if (secondStr) {
        if ([secondStr hasSuffix:@"0"]) {
            secondStr = [secondStr substringWithRange:NSMakeRange(0, 1)];
        }
        
        if ([secondStr hasSuffix:@"0"]) {
            secondStr = nil;
        }
    }
    
    NSString *finalPrice = @"";
    
    
    if (secondStr) {
        finalPrice = [NSString stringWithFormat:@"%@.%@",firstStr,secondStr];
    }else{
        finalPrice = [NSString stringWithFormat:@"%@",firstStr];
    }
    
    
    return finalPrice;
}
//正则表达式替换html标签
+(NSString *)replaceHtmlLabel:(NSString *)content{
    if ([content isKindOfClass:[NSString class]]) {
        NSString *string=[content stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
        NSRegularExpression *regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"<[^>]*>|\n" options:0 error:nil];
        string=[regularExpretion stringByReplacingMatchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, string.length) withTemplate:@"-"];//替换所有html和换行匹配元素为"-"
        regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"-{1,}" options:0 error:nil] ;
        string =[string stringByReplacingOccurrencesOfString:@"" withString:@"-"];
        string=[regularExpretion stringByReplacingMatchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, string.length) withTemplate:@"-"];//把多个"-"匹配为一个"-"
        //根据"-"分割到数组
        NSArray *arr=[NSArray array];
        string=[NSString stringWithString:string];
        arr =  [string componentsSeparatedByString:@"-"];
        NSMutableArray *marr=[NSMutableArray arrayWithArray:arr];
        [marr removeObject:@""];
        string=[marr componentsJoinedByString:@"\n"];
        NSLog(@"content=%@",string);
        return string;
        
    }else{
        return nil;
    }
}

+(NSString *)randomDigitString {
    NSDate *date = [NSDate date];
    NSTimeInterval interval = [date timeIntervalSince1970];
    NSInteger randomNumber = arc4random() % 10000;
    return [NSString stringWithFormat:@"%ld%@", (long)interval, @(randomNumber)];
}

+(NSString *)clearPhoneFormat:(NSString *)phone{
    phone = [phone stringByReplacingOccurrencesOfString:@"(" withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@")" withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@" " withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return phone;
}

+(NSString *)phoneFormat:(NSString *)phone{
    if (phone.length <= 0) {
        return nil;
    }
    NSMutableArray  *subStrings = [NSMutableArray array];
    NSRange range = NSMakeRange(0, 0);
    if (phone.length > 2) {
        range = NSMakeRange(0, 3);
        [subStrings addObject:[phone substringWithRange:range]];
    }
    if (phone.length > 6) {
        range = NSMakeRange(3, 4);
        [subStrings addObject:[phone substringWithRange:range]];
    }
    if (phone.length > 10) {
        range = NSMakeRange(7, 4);
        [subStrings addObject:[phone substringWithRange:range]];
    }
    
    NSInteger processedCount = range.location + range.length;
    if (processedCount < phone.length) {
        range = NSMakeRange(processedCount, phone.length - processedCount);
        [subStrings addObject:[phone substringWithRange:range]];
    }
    
    return [subStrings componentsJoinedByString:@" "];
    
}

+(BOOL)isNotNull:(id)object {
    return object != nil && ![object isKindOfClass:[NSNull class]];
}

+(BOOL)isAllKindsNull:(id)object {
    if ([object respondsToSelector:@selector(stringValue)]) {
        return [[object stringValue] isEqualToString:@""];
    } else if ([object isKindOfClass:[NSString class]]) {
        return [object isEqualToString:@""];
    }
    return object == nil || [object isKindOfClass:[NSNull class]] ;
}

//根据年月获得星座
//+ (NSString *)getConstellationNameByMonth:(NSInteger)aMonth aDay:(NSInteger)aDay {
//    NSArray *constellations = @[@"水瓶座", @"双鱼座", @"白羊座", @"金牛座", @"双子座", @"巨蟹座", @"狮子座", @"处女座", @"天秤座", @"天蝎座", @"射手座", @"摩羯座"];
//    if (aMonth<1 || aMonth>12 || aDay<1 || aDay>31){
//        return @"错误日期";
//    }
//    
//    if(aMonth==2 && aDay>29) {
//        return @"错误日期";
//    }else if(aMonth==4 || aMonth==6 || aMonth==9 || aMonth==11) {
//        if (aDay>30) {
//            return @"错误日期";
//        }
//    }
//    
//    NSInteger index;
//    NSArray *conIndexs = @[@(20),@(19),@(21),@(20),@(21),@(22),@(23),@(23),@(23),@(24),@(23),@(22)];
//    if ([[conIndexs objectAtIndex:aMonth-1] integerValue] <= aDay + 1) {
//        index = aMonth;
//    } else{
//        index = (aMonth - 1 + 12) % 12;
//    }
//    return [constellations objectAtIndex:index];
//}

+(NSString *)calculateConstellationWithMonth:(NSInteger)month day:(NSInteger)day
{
    NSString *astroString = @"魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
    NSString *astroFormat = @"102123444543";
    NSString *result;
    
    if (month<1 || month>12 || day<1 || day>31){
        return @"错误日期";
    }
    
    if(month==2 && day>29)
    {
        return @"错误日期";
    }else if(month==4 || month==6 || month==9 || month==11) {
        if (day>30) {
            return @"错误日期";
        }
    }
    
    result=[NSString stringWithFormat:@"%@",[astroString substringWithRange:NSMakeRange(month*2-(day < [[astroFormat substringWithRange:NSMakeRange((month-1), 1)] intValue] - (-19))*2,2)]];
    
    return [NSString stringWithFormat:@"%@座",result];
}

+(NSString *)getConstellationNameByStringDate:(NSString *)date{ //必须是yyyy-MM-dd格式
    NSString *month = [date substringWithRange:NSMakeRange(5, 2)];
    NSString *day = [date substringWithRange:NSMakeRange(8, 2)];
//    NSLog(@"month=%@,day=%@",month,day);
     return [ETUtils calculateConstellationWithMonth:[month integerValue] day:[day integerValue]];
}
//ET.utils.num.EtoL = function(exp) {
//    exp=exp||0;
//    if(exp<30) return 0;
//    return Math.floor(Math.log(exp/30)/Math.log(1.32)+1);
//}
//ET.utils.num.LtoE = function(lev) {
//    if(lev<1)return 0;
//    return Math.ceil(Math.pow(1.32,lev-1)*30);
//}
//亿财道等级转经验
+(double)expFromLevel:(double)level{
    if(level<1) return 0;
    return  ceil(pow(1.32, level-1)*30);
}
//亿财道经验转等级
+(double)levelFromExp:(double)exp{
    exp=exp||0;
    if(exp<30) return 0;
    return floor(log(exp/30)/log(1.32)+1);
}

//返回随机数组的下标
-(NSInteger) getRandom:(NSArray *) array{
    if (array.count==1) {
        return 0;
    }
    return [self randomInNum:array.count];
}

//获得[0~num)的随机数
-(int)randomInNum:(NSInteger) num{
    int x = arc4random() % num;
    return x;
}

//应用跳转（URL跳转）
+(void)openScheme:(NSString *)scheme {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:scheme];
    if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [application openURL:URL options:@{}
           completionHandler:^(BOOL success) {
               NSLog(@"Open %@: %d",scheme,success);
           }];
    } else {
        BOOL success = [application openURL:URL];
        NSLog(@"Open %@: %d",scheme,success);
    }
}

+(void)openSchemePhone:(NSString *)phone {
    NSString * strphone =[[NSString alloc] initWithFormat:@"telprompt://%@",phone];
    [ETUtils openScheme:strphone];
}

+(void)openSchemeQQ:(NSString *)qq {
    NSString *qqURL = [NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web",qq];
    [ETUtils openScheme:qqURL];
}

+(NSString *)fullFilePath:(NSString *)relativePath {
    return [[YTKNetworkConfig sharedConfig].baseUrl stringByAppendingPathComponent:relativePath];
}
@end
