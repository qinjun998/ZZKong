//
//  RequestBase.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETRequestBase.h"
#import <Foundation/Foundation.h>


#import <objc/runtime.h>
#import <objc/message.h>


#import "YTKNetworkAgent.h"
#import "NSMutableDictionary+safe.h"
//#import "ECDAppStatus.h"
//#import <UIDeviceUtil/UIDeviceUtil.h>
#import "DeviceUtil.h"

@implementation ETRequestBase

//默认超时时间为30秒
- (NSTimeInterval)requestTimeoutInterval {
    return kRequestTimeoutInterval;
}

//请求的序列化类型，json方式，默认为http


- (YTKRequestSerializerType)requestSerializerType{
//    return YTKRequestSerializerTypeHTTP; 
    return YTKRequestSerializerTypeJSON;
}


//header 中保存的apikey值

- (NSDictionary *)requestHeaderFieldValueDictionary
{
//    return @{@"X-Token": @"61979cba44a3b9abb16c5127574dd2e5"};
    return [self commonHeaderParams];
}

-(NSMutableDictionary *)commonHeaderParams {
//    NSMutableDictionary *commonParams = [NSMutableDictionary dictionary];
//    [commonParams safeSetObject:[self requestHeader] forKey:@"header"];
    return [self requestHeader];
}

-(NSMutableDictionary *)requestHeader {
    
    NSMutableDictionary *headerValue = [NSMutableDictionary dictionary];

//    [headerValue safeSetObject:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] forKey:@"X-ET-Version"];  //版本
//
//    [headerValue safeSetObject:@"ZZKong" forKey:@"X-ET-AppName"];////幂等
//    [headerValue safeSetObject:([ECDAppStatus loginInfo].token? :@"") forKey:@"X-ET-Token"];

//    NSMutableDictionary *otherHeaderValue = [NSMutableDictionary dictionary];
    
//    [otherHeaderValue safeSetObject:@"iOS" forKey:@"os"];
//    [otherHeaderValue safeSetObject:@"ZZKong" forKey:@"client"];
//    
//    [otherHeaderValue safeSetObject:@"" forKey:@"browser"];
//    [otherHeaderValue safeSetObject:@"" forKey:@"browser_version"];
//    [otherHeaderValue safeSetObject:[[[UIDevice currentDevice] identifierForVendor] UUIDString] forKey:@"imei"];
//    [otherHeaderValue safeSetObject:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] forKey:@"app_version"];//app版本号
//    [otherHeaderValue safeSetObject:@"Apple" forKey:@"brand"];
//    [otherHeaderValue safeSetObject:[[UIDevice currentDevice] systemVersion] forKey:@"os_version"];
//    [otherHeaderValue safeSetObject:[DeviceUtil hardwareDescription] forKey:@"iphone_model"];
//
//    NSMutableString *string = [NSMutableString new];
//    [otherHeaderValue enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
////        NSLog(@"%@，%@",key,obj);
//        [string appendFormat:@"%@:%@;", key,obj];
//    }];
//    
//  [headerValue safeSetObject:string forKey:@"userAgent"];
    
    return headerValue;
}

/*
*/





@end
