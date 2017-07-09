//
//  ECDUserDetailModel.h
//  ZZKong
//
//  Created by lee on 16/10/12.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ETCommonResponse.h"

@interface ECDUserDetailModel : ETCommonResponse

@property (copy, nonatomic) NSNumber * uid;
@property (copy, nonatomic) NSNumber * lv;
@property (copy, nonatomic) NSString * mobile;
@property (copy, nonatomic) NSString * name;
@property (copy, nonatomic) NSNumber * sex;
@property (copy, nonatomic) NSString * birthday;
@property (copy, nonatomic) NSNumber * exp;
@property (copy, nonatomic) NSNumber * subCount;
@property (copy, nonatomic) NSNumber * teamCount;
@property (copy, nonatomic) NSNumber * coin;
@property (copy, nonatomic) NSString * idCard;
@property (copy, nonatomic) NSNumber * lastOnline;


-(void)saveUserDetail;
+(void)clearUserDetail;
+(ECDUserDetailModel *)loadUserDetail;

+(void)updateCoin:(NSNumber *) coin;

+(NSNumber *)getLat;
+(void)updateLat:(NSNumber *) lat;

+(NSNumber *)getLng;
+(void)updateLng:(NSNumber *) lng;

+(NSString *)getAdcode;
+(void)updateAdcode:(NSString *) adcode;

@end
