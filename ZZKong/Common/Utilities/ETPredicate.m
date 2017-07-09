//
//  ETPredicate.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETPredicate.h"


#define PRED_CONDITION_MOBILE       @"[0-9]{8,14}"
#define PRED_CONDITION_ZUOJIHAO     @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$"//座机号码判断
#define PRED_CONDITION_NUMERIC      @"[0-9]+"
#define PRED_CONDITION_CHARACTER    @"[A-Z0-9a-z]+"
#define PRED_CONDITION_PASSWORD     @"[^\\n\\s]{8,200}"
#define PRED_CONDITION_SPECIAL_CHAR @"[A-Z0-9a-z._%+-@]+"
#define PRED_CONDITION_EMAIL        @"^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$"
#define PRED_CONDITION_BABYNAME     @"^[\u4e00-\u9fa5_a-zA-Z0-9]+$"
#define PRED_CONDITION_ADDRESS_SPECIAL_CHAR     @"[\"\'<>/&*^%$@!?\\\\]"
#define PRED_CONDITION_CHINESE       @"[\u4e00-\u9fa5]"
#define PRED_CONDITION_CHINESE_ASCII @"[a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]+"  //只可输入中文、字母和数字
//http://blog.csdn.net/a351945755/article/details/41945039
static NSString *const kPRED_CONDITION_ZUOJIHAO = @"0[0-9]{2,3}-[0-9]{7,8}";//座机号码判断(新添加)
static NSString *const kBIND_PHONENUM_CONDITION = @"^1[0-9]{10}$";

@implementation ETPredicate

+(BOOL)checkUserName:(NSString *)aCandidate
{
    return [self checkPhoneNumber:aCandidate] || [self checkEmail:aCandidate];
}

+(BOOL)checkBindPhoneNumber:(NSString *)aCandidate
{
    return [self __checkCandidate:aCandidate condition:kBIND_PHONENUM_CONDITION];
}

+(BOOL)checkPhoneNumber:(NSString *)aCandidate
{
    if (aCandidate.length != 11) {
        return NO;
    }
    return [self __checkCandidate:aCandidate condition:PRED_CONDITION_MOBILE];
}

+(BOOL)checkZuoJiHaoNumber:(NSString *)aCandidate
{
    return [self __checkCandidate:aCandidate condition:kPRED_CONDITION_ZUOJIHAO];
}

+(BOOL)checkNumeric:(NSString *)aCandidate
{
    return [self __checkCandidate:aCandidate condition:PRED_CONDITION_NUMERIC];
}

+(BOOL)checkCharacter:(NSString *)aCandidate
{
    return [self __checkCandidate:aCandidate condition:PRED_CONDITION_CHARACTER];
}

+(BOOL)checkPassword:(NSString *)aCandidate
{
    return [self __checkCandidate:aCandidate condition:PRED_CONDITION_PASSWORD];
}

+(BOOL)checkSpecialChar:(NSString *)aCandidate
{
    return [self __checkCandidate:aCandidate condition:PRED_CONDITION_SPECIAL_CHAR];
}

+ (BOOL)checkAddressSpecialChar:(NSString *)aCandidate
{
    NSRange urgentRange = [aCandidate rangeOfString:PRED_CONDITION_ADDRESS_SPECIAL_CHAR options:NSRegularExpressionSearch];
    if (urgentRange.location == NSNotFound)
    {
        return NO;
    }
    return YES;
}

+ (BOOL)checkChineseChar:(NSString *)aCandidate
{
    NSRange urgentRange = [aCandidate rangeOfString:PRED_CONDITION_CHINESE options:NSRegularExpressionSearch];
    if (urgentRange.location == NSNotFound)
    {
        return NO;
    }
    return YES;
}

+ (BOOL)checkAllChineseChar:(NSString *)aCandidate
{
    for(int i=0; i< [aCandidate length];i++){
        int a = [aCandidate characterAtIndex:i];
        if(a <0x4e00 || a>0x9fff){
            return NO;  //存在非汉字
        }
    }
    return YES;
}


+(BOOL)checkEmail:(NSString *)aCandidate
{
    return [self __checkCandidate:aCandidate condition:PRED_CONDITION_EMAIL];
}


+ (BOOL)__checkCandidate: (NSString *) aCandidate condition: (NSString*) aCondition
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", aCondition];
    return [predicate evaluateWithObject:aCandidate];
}

+(BOOL)checkBabyName:(NSString *)aCandidate
{
    return [self __checkCandidate:aCandidate condition:PRED_CONDITION_BABYNAME];
}

+(BOOL)isContainsEmoji:(NSString *)string {
    __block BOOL isEomji = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     isEomji = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 isEomji = YES;
             }
         } else {
             if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                 isEomji = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 isEomji = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 isEomji = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 isEomji = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                 isEomji = YES;
             }
         }
     }];
    return isEomji;
}

#pragma mark - 验证手机号码的方法
+ (BOOL)validateMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186
     */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189
     */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)checkLandlineNumber:(NSString *)aCandidate{
    if ([self __checkCandidate:aCandidate condition:kPRED_CONDITION_ZUOJIHAO]) {
        return [self __checkCandidate:aCandidate condition:kPRED_CONDITION_ZUOJIHAO];
    }
    return [self __checkCandidate:aCandidate condition:PRED_CONDITION_ZUOJIHAO];
}


+(BOOL)isAllSpace:(NSString *)string{
    //去掉字符串中的空格，看剩下的字符串的长度是否为零
    NSString *temp = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([temp length]==0)//由空格组成
    {
        return YES;
    }
    return NO;
}

@end
