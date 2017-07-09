//
//  ETWebView.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETWebView.h"
#import "ETFuncDefine.h"

//category
#import "NSString+plus.h"
#import "NSObject+JsonToVO.h"
#import "NSObject+BeeNotification.h"

//global
//#import "ETGlobalValue.h"
//#import "ETClientInfo.h"

//#import "ETJsonKit.h"
#import "ETWeakObjectDeathNotifier.h"

@implementation ETWebView

#pragma mark - cookies
+ (void)setCookie:(NSString *)aDomain name:(NSString *)aName value:(NSString *)aValue
{
    if (!aName) {
        return ;
    }
    
    if (!aValue) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies.copy enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSHTTPCookie *cookie = obj;
            if ([cookie.properties[NSHTTPCookieName] isEqualToString:aName]) {
                [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:obj];
                *stop = YES;
            }
        }];
        return ;
    }
    
    NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
    cookieProperties[NSHTTPCookieDomain] = aDomain;
    cookieProperties[NSHTTPCookieName] = aName;
    cookieProperties[NSHTTPCookieValue] = aValue;
    cookieProperties[NSHTTPCookiePath] = @"/";
    cookieProperties[NSHTTPCookieVersion] = @"0";
    
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
}

+ (void)setCookieName:(NSString *)aName value:(NSString *)aValue
{
    [self setCookie:@".unipei.com" name:aName value:aValue];
}

+ (void)setupDefaultCookies
{
    /**
     *  token
     */
//    [ETWebView setCookieName:@"usertoken" value:[ETGlobalValue sharedInstance].token];


    /**
     *  clientinfo
     */
//    [ETWebView setCookieName:@"clientinfo" value:[ETJsonKit stringFromDict:[[ETClientInfo sharedInstance] convertDictionary]].urlEncodingAllCharacter];
    /**
     *  frameworkver
     */
    [ETWebView setCookieName:@"frameworkver" value:@"1.0"];
    /**
     *  platform
     */
    [ETWebView setCookieName:@"platform" value:@"ios"];
    /**
     *  ut
     */
//    [ETWebView setCookieName:@"ut" value:[ETGlobalValue sharedInstance].token];
    /**
     *  guid
     */
//    [ETWebView setCookieName:@"guid" value:[ETClientInfo sharedInstance].deviceCode];

}

+ (void)clearCookies
{
    [[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies.copy enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:obj];
    }];
}

- (void)dealloc
{
    self.delegate = nil;
    [self unobserveAllNotifications];
}

- (void)setDelegate:(id<UIWebViewDelegate>)delegate
{
    [super setDelegate:delegate];
    
    if (delegate == nil) {
        return;
    }
    
    ETWeakObjectDeathNotifier *wo = [ETWeakObjectDeathNotifier new];
    [wo setOwner:delegate];
    WEAK_SELF;
    [wo setBlock:^(ETWeakObjectDeathNotifier *sender) {
        STRONG_SELF;
        self.delegate = nil;
    }];
}


@end
