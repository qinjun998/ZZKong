//
//  CommonRequest.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETCommonRequest.h"
#import "ETCommonResponse.h"
#import "NSMutableDictionary+safe.h"
//#import "ECDAppStatus.h"
//#import <UIDeviceUtil/UIDeviceUtil.h>

@interface ETCommonRequest ()
{
       Class  _customResponseModelClass;
}



@end


@implementation ETCommonRequest
//YTKRequestMethodGET = 0,
//YTKRequestMethodPOST,
//YTKRequestMethodHEAD,
//YTKRequestMethodPUT,
//YTKRequestMethodDELETE,
//YTKRequestMethodPATCH,

//默认为post方式提交
- (YTKRequestMethod)requestMethod {
    if (!_method || ([_method caseInsensitiveCompare:@"POST"] == NSOrderedSame)) {
        return YTKRequestMethodPOST;
    }else if([_method caseInsensitiveCompare:@"GET"] == NSOrderedSame){
        return YTKRequestMethodGET;
    }else if([_method caseInsensitiveCompare:@"PUT"] == NSOrderedSame){
        return YTKRequestMethodPUT;
    }else if([_method caseInsensitiveCompare:@"DELETE"] == NSOrderedSame){
        return YTKRequestMethodDELETE;
    }
    return YTKRequestMethodPOST;
}

-(NSString *)requestUrl {
    return _relativePath;
}

-(NSDictionary *)paramToPropertyMap {
    return _params;
}



//没有效果
//-(NSDictionary *)requestHeaderFieldValueDictionary {
//    [super requestHeaderFieldValueDictionary];
//    return [self commonHeaderParams];
//}



-(id)requestArgument {
    //默认的参数
//    NSMutableDictionary *commonParams = [self commonParams];
    NSMutableDictionary *commonParams = [[NSMutableDictionary alloc] init];
    //指定传入的参数
    NSDictionary *specParams = [self paramToPropertyMap];
    if (specParams) {
        [commonParams setValuesForKeysWithDictionary:specParams];
        //setValuesForKeysWithDictionary addEntriesFromDictionary
    }

    return commonParams;

}

//-(NSMutableDictionary *)commonHeaderParams {
//    NSMutableDictionary *commonParams = [NSMutableDictionary dictionary];
//    [commonParams safeSetObject:[self requestHeader] forKey:@"header"];
//    return commonParams;
//}
//-(NSMutableDictionary *)requestHeader {
//    
//    NSMutableDictionary *headerValue = [NSMutableDictionary dictionary];
//    [headerValue safeSetObject:@"iOS" forKey:@"os"];
//    [headerValue safeSetObject:@"ZZKong" forKey:@"client"];
//    [headerValue safeSetObject:([ECDAppStatus loginInfo].token? :@"") forKey:@"X-ET-Token"];
//    [headerValue safeSetObject:@"" forKey:@"browser"];
//    [headerValue safeSetObject:@"" forKey:@"browser_version"];
//    [headerValue safeSetObject:[[[UIDevice currentDevice] identifierForVendor] UUIDString] forKey:@"imei"];
//    [headerValue safeSetObject:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] forKey:@"app_version"];//app版本号
//    [headerValue safeSetObject:@"Apple" forKey:@"brand"];
//    [headerValue safeSetObject:@"3.4" forKey:@"client_version"];//接口版本号
//    [headerValue safeSetObject:[[UIDevice currentDevice] systemVersion] forKey:@"os_version"];
//    [headerValue safeSetObject:[UIDeviceUtil hardwareSimpleDescription] forKey:@"iphone_model"];
//
//    return headerValue;
//}

//处理参数
-(NSMutableDictionary *)processParams {
    return nil;
}


//重写属性
-(Class)responseModelClass {
    if (_customResponseModelClass) {
        return _customResponseModelClass;
    }
    return [ETCommonResponse class];
}

-(void)setResponseModelClass:(Class) class1{
//-(void)setResponseModelClass:(NSString *) className{
//    _customResponseModelClass = NSClassFromString(className);
      _customResponseModelClass = class1;
}
- (id)responseModel {
    id json = self.responseJSONObject;
    NSError *error;
    ETCommonResponse *result = [MTLJSONAdapter modelOfClass:[self responseModelClass] fromJSONDictionary:json error:&error];
    if (error) {
        NSLog(@"CommonRequest->responseModel failed:%@", [error localizedDescription]);
    }
//   return [MTLJSONAdapter modelOfClass:[self responseModelClass] fromJSONDictionary:json error:&error];
    return result;
}

-(id) jsonData{
    id json =  self.responseJSONObject;
    return json;
}


-(NSString*)jsonFromData:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:0 //NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    return jsonString;
}


#pragma mark -
// 遍历传入的dictionary，使用Key-value coding，批量动态设置参数值
- (instancetype)initWithParams:(NSDictionary *)params
{
    self = [super init];
    if (self) {
        if (params != nil) {
            [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                if ([key isKindOfClass:[NSString class]] && [self respondsToSelector:NSSelectorFromString(key)]) {
                    [self setValue:obj forKey:key];
                }
            }];
        }
    }
    return self;
}

@end
