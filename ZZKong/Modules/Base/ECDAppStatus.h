//
//  ECDAppStatus.h
//  ZZKong
//
//  Created by lee on 16/10/6.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ECDLoginModel.h"
#import "ECDUserDetailModel.h"
//#import <BaiduMapAPI_Location/BMKLocationComponent.h>


typedef void(^TicketBlock)(NSString *ticket);

@interface ECDAppStatus : NSObject

+(void)logout;
+(void)clearPassword;
+(BOOL)isLoggedIn;
+(ECDLoginModel *)loginInfo;
+(ECDUserDetailModel *)loadUserDetail;

+(void)archiveLoginResult:(ECDLoginModel *)result;
+(ECDLoginModel *)unarchiveLoginResult;
//+(NSNumber *)getToken;  //获得保存的Token
//+(void)updateToken:(NSString *) token;  //更新失效token
+(void)updateCoin:(NSNumber *) coin;    //当前ET币值
+(void)ticket:(TicketBlock)ticketBlock; //获得幂等
//获得seqid
+(void)seqid:(TicketBlock)ticketBlock;
+(void)districtCode:(TicketBlock)ticketBlock;//获得行政区划
//+(void) districtCodeLocation:(BMKUserLocation *)userLocation aBlock:(TicketBlock)ticketBlock;

//更新地理信息
+(void)updateLng:(NSNumber *) lng;
+(void)updateLat:(NSNumber *) lat;
+(NSNumber *)getLng;
+(NSNumber *)getLat;

+(NSString *)getAdcode;
+(void)updateAdcode:(NSString *) adcode;
+(void)sendLocation:(NSString *)adcode;  //发送地理信息


+(BOOL)haveSeenIntroBefore;
+(void)setHaveSeenIntroBefore:(BOOL)haveSeenIntroBefore;

@end
