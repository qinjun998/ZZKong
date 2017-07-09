//
//  ECDAppStatus.m
//  ZZKong
//
//  Created by lee on 16/10/6.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ECDAppStatus.h"
#import "ETUserDefault.h"
#import "ETCommonRequest.h"
#import "ECDUserDetailModel.h"
#import "ETCommonRequest+Helper.h"


static ECDLoginModel *loginInfo = nil;
static ECDUserDetailModel *loginInfoDetail = nil;
static ETCommonRequest *commonRequest= nil;



@interface ECDAppStatus ()

@end

@implementation ECDAppStatus


+(void)logout{
    /// 不管成功与否，都清掉登录数据
    loginInfo = nil;
    [ECDLoginModel clear];
    [[NSNotificationCenter defaultCenter] postNotificationName:NotificationLogout object:nil];
    
}

//修改密码之后清理保存密码
+(void)clearPassword{
    [ECDLoginModel clearPassword];
}


+(BOOL)isLoggedIn{
    return [self loginInfo].success;
}

+(ECDLoginModel *)loginInfo{
    loginInfo = [self unarchiveLoginResult];
    return loginInfo;
}

+(ECDUserDetailModel *)loadUserDetail{
    loginInfoDetail = [self unarchiveLoginDetailResult];
    return loginInfoDetail;
}

+(void)archiveLoginResult:(ECDLoginModel *)result{
    loginInfo = result;
    [loginInfo save];
    
}

+(ECDLoginModel *)unarchiveLoginResult{
    return [ECDLoginModel load];
}

+(ECDUserDetailModel *)unarchiveLoginDetailResult{
    return [ECDUserDetailModel loadUserDetail];
}

//+(NSNumber *)getToken{
//    return  [ECDLoginModel getToken];
//}
//+(void)updateToken:(NSString *) token{
//    [ECDLoginModel updateToken:token];
//}

+(void)updateCoin:(NSNumber *) coin{
    [ECDUserDetailModel updateCoin:coin];
}

+(NSNumber *)getLng{
    return  [ECDUserDetailModel getLng];
}

+(NSNumber *)getLat{
    return  [ECDUserDetailModel getLat];
}

+(NSString *)getAdcode{
    return  [ECDUserDetailModel getAdcode];
}

+(void)updateAdcode:(NSString *) adcode{
    [ECDUserDetailModel updateAdcode:adcode];
}

//更新地理信息
+(void)updateLng:(NSNumber *) lng{
    [ECDUserDetailModel updateLng:lng];
}

//更新地理信息
+(void)updateLat:(NSNumber *) lat{
     [ECDUserDetailModel updateLat:lat];
}


//获得幂等
+(void)ticket:(TicketBlock)ticketBlock{
    if (commonRequest == nil) {
        commonRequest = [ETCommonRequest new];
    }
    commonRequest.relativePath = @"service/ticket";
    commonRequest.method = @"GET";
    [[ETCommonRequest commonApiSignal:commonRequest queue:nil] subscribeNext:^(ETCommonResponse *result) {
        if (result.success) {
            NSString *ticket = result.body[@"ticket"];
            if (ticketBlock) {
                ticketBlock(ticket);
            }
        }else{
//            ETToastWithDelay(result.msg, 2);
        }
    }];
}

//获得seqid
+(void)seqid:(TicketBlock)ticketBlock{
    if (commonRequest == nil) {
        commonRequest = [ETCommonRequest new];
    }
    commonRequest.relativePath = @"service/seqid";
    commonRequest.method = @"GET";
    [[ETCommonRequest commonApiSignal:commonRequest queue:nil] subscribeNext:^(ETCommonResponse *result) {
        if (result.success) {
            NSString *ticket = result.body;
            if (ticketBlock) {
                ticketBlock(ticket);
            }
        }else{
//            ETToastWithDelay(result.msg, 2);
        }
    }];
}



//获得行政区划
+(void)districtCode:(TicketBlock)ticketBlock{
//+(void) districtCodeLocation:(BMKUserLocation *)userLocation aBlock:(TicketBlock)ticketBlock{
    if (commonRequest == nil) {
        commonRequest = [ETCommonRequest new];
    }
    commonRequest.relativePath = [NSString stringWithFormat:@"http://api.map.baidu.com/geocoder/v2/?ak=%@&output=json&pois=0&location=%@,%@&mcode=%@",kBaiduMapKey,[ECDAppStatus getLat],[ECDAppStatus getLng],kBundleIdentifier];
    commonRequest.method = @"GET";
    [[ETCommonRequest commonApiSignal:commonRequest queue:nil isModel:NO] subscribeNext:^(NSDictionary *result) {
        NSString *adcode = result[@"result"][@"addressComponent"][@"adcode"];
        if (adcode && ![adcode isEqualToString:@"0"]) {  //adcode为0表示未获取到
            [ECDAppStatus updateAdcode:adcode];
            if (ticketBlock) {
                ticketBlock(adcode);
            }
        }else{
            ETToastWithDelay(@"百度地图获得地理信息错误", 2);
        }
    }];
}

//发送地理信息
+(void)sendLocation:(NSString *)adcode{

    if (commonRequest == nil) {
        commonRequest = [ETCommonRequest new];
    }
    commonRequest.relativePath = @"user/loc";
    commonRequest.params = @{
                             @"lat":[ECDAppStatus getLat],
                             @"lng":[ECDAppStatus getLng],
                             @"areaCode":adcode
                             };
    commonRequest.method = @"PUT";
    [[ETCommonRequest commonApiSignal:commonRequest queue:nil] subscribeNext:^(ETCommonResponse *result) {
        if (result.success) {
        }else{
//            ETToastWithDelay(result.msg, 2);
        }
    }];
}



//PUT /v2/user/loc
+(BOOL)haveSeenIntroBefore {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kShowIntroBeforeKey];
}

+(void)setHaveSeenIntroBefore:(BOOL)haveSeenIntroBefore {
    [[NSUserDefaults standardUserDefaults] setBool:haveSeenIntroBefore forKey:kShowIntroBeforeKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



@end
