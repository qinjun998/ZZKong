//
//  ECDSetting.m
//  ZZKong
//
//  Created by lee on 2016/11/9.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ECDSetting.h"
#import <YTKNetwork/YTKNetworkConfig.h>
#import "ETUserDefault.h"



@implementation ECDSetting


+(NSArray *)serverURLs{
    return @[
              @"http://mj.wotuan.com:8088/demo",
              @"http://118.89.31.53:8088/demo"
             ,@"http://localhost:8080"
             ];
}

+(NSArray *)serverNames {
    return @[
            @"1",
            @"生产环境"
           ,@"本地测试"
             ];
}

+(BOOL)getAppStatus {  //获得当前app处于debug还是release状态.
#if DEBUG
    return YES;
#else
    return NO;
#endif
}

//获得ServerURL
+(NSString *)baseURL:(NSInteger) serverRow{
    NSArray *URLs = [self serverURLs];  //获得所有URL
    NSString *url;
    if(serverRow<[self serverURLs].count){
        url = URLs[serverRow];
        if (url == nil) {
            url = URLs.firstObject;
        }
    }else{
        url = URLs.firstObject;
    }
    
    return [url stringByAppendingString:@"/"];
}

//设置环境
+(void)setServerEnvironment:(NSInteger )serverRow {
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl =[ECDSetting baseURL:serverRow];
 //保存上次选项
    [[NSUserDefaults standardUserDefaults] setInteger:serverRow forKey:kServerEnv];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//设置上次使用网络环境
+(void)setDefaultServerEnvironment{
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    if([self getAppStatus]){ //debug
        NSInteger serverRow =  [self lastServerEnvironment];
        config.baseUrl =[ECDSetting baseURL:serverRow];
    }else{  //release
        config.baseUrl =[ECDSetting baseURL:0];  //使用生产
    }
}

+(NSInteger)lastServerEnvironment{
    NSInteger serverRow =  [[NSUserDefaults standardUserDefaults] integerForKey:kServerEnv];
    return serverRow;
}


+(NSString *)envirmentDescription:(NSInteger)row {
    NSString *name = [self serverNames][row];
    NSString *url = (NSString *)[self serverURLs][row];
    return [NSString stringWithFormat:@"[%@] %@", name, url];
}

@end
