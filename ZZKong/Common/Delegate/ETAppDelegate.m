//
//  ETAppDelegate.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETAppDelegate.h"

#import "ETNotificationDefine.h"
#import "ETLog.h"
#import "ETStoryboard.h"
#import "ETNC.h"

//#import <AlipaySDK/AlipaySDK.h>
//#import "PaymentTool.h"
//#import "WXApi.h"
//#import "WXApiObject.h"

//define
#import "ETMacroDefine.h"


#ifndef DEBUG
//#import <Fabric/Fabric.h>
//#import <Crashlytics/Crashlytics.h>
#endif

@interface ETAppDelegate (){
//<WXApiDelegate>{
    /// 是否正在弹出LoginVC
    BOOL                _isPresentingLoginVC;
    BOOL                _didCheckNewVersion;
}

@end

@implementation ETAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#ifndef DEBUG
    //Crashlytics
//    [Fabric with:@[[Crashlytics class]]];
    
#endif
    
    //pc window
    self.pcWindow = [[ETWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.pcWindow.backgroundColor = [UIColor clearColor];
    self.pcWindow.windowLevel = UIWindowLevelNormal + 1;
    self.pcWindow.rootViewController = [UIViewController new];
    [self.pcWindow makeKeyAndVisible];
    self.pcWindow.hidden = YES;
    
    //for 轮播图等促销
    self.topWindow = [[ETWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.topWindow.backgroundColor = [UIColor clearColor];
    self.topWindow.windowLevel = UIWindowLevelAlert + 1;
    self.topWindow.rootViewController = [UIViewController new];
    [self.topWindow makeKeyAndVisible];
    self.topWindow.hidden = YES;

    
    //setup log
    [ETLog setupLogerStatus];
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    ETLogFuncI;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    ETLogFuncI;
    //    [[BaiDuAppSearch sharedInstance] onExit2];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    ETLogFuncI;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    ETLogFuncI;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    ETLogFuncE;
}

- (void)endEditing
{
    [self.window endEditing:YES];
}

/*
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if([[url scheme] isEqualToString:WXAppID]) {
        
        if([PaymentTool manager].isWXPayment){
            [WXApi handleOpenURL:url delegate:self];
        }
        //        [NSUserDefaults setBool:YES forKey:GETBUTNOTPAY];
    }      //支付宝客户端支付返回数据的回调
    if ([[url scheme] isEqualToString:@"alipayYouche"]) {
        // [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:nil];
        
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"%@",resultDic);
            [[PaymentTool manager] resultWithInteger:resultDic];
            
            //            if ([[resultDic objectForKey:@"resultStatus"] intValue] == 9000) {
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payMyAccount" object:resultDic userInfo:@{@"resutStauts":@"909"}];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payRegister" object:resultDic userInfo:@{@"resutStauts":@"909"}];
            //
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"909"}];
            //
            //            }else if ([[resultDic objectForKey:@"resultStatus"] intValue] == 6001) { //用户中途取消
            //                [[UIApplication sharedApplication].keyWindow showToast:@"取消支付"];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payMyAccount" object:nil userInfo:@{@"resutStauts":@"910"}];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payRegister" object:nil userInfo:@{@"resutStauts":@"910"}];
            //
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"910"}];
            //
            //            }else {
            //                [[UIApplication sharedApplication].keyWindow showToast:@"支付失败"];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payMyAccount" object:nil userInfo:@{@"resutStauts":@"910"}];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payRegister" object:nil userInfo:@{@"resutStauts":@"910"}];
            //
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"910"}];
            //
            //            }
        }];
    }
    return  YES; //[UMSocialSnsService handleOpenURL:url];
    
}

#pragma mark -- 支付回调
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    
    if([[url scheme] isEqualToString:WXAppID]) {
        if([PaymentTool manager].isWXPayment){
            [WXApi handleOpenURL:url delegate:self];
        }
    } //支付宝客户端支付返回数据的回调
    if ([[url scheme] isEqualToString:@"alipayYouche"]) {
        
        // [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:nil];
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"%@",resultDic);
            [[PaymentTool manager] resultWithInteger:resultDic];
            //            if ([[resultDic objectForKey:@"resultStatus"] intValue] == 9000) {
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payMyAccount" object:resultDic userInfo:@{@"resutStauts":@"909"}];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payRegister" object:resultDic userInfo:@{@"resutStauts":@"909"}];
            //
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"909"}];
            //
            //            }else if ([[resultDic objectForKey:@"resultStatus"] intValue] == 6001) { //用户中途取消
            //                [[UIApplication sharedApplication].keyWindow showToast:@"取消支付"];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payMyAccount" object:nil userInfo:@{@"resutStauts":@"910"}];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payRegister" object:nil userInfo:@{@"resutStauts":@"910"}];
            //
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"910"}];
            //
            //            }else {
            //                [[UIApplication sharedApplication].keyWindow showToast:@"支付失败"];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payMyAccount" object:nil userInfo:@{@"resutStauts":@"910"}];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payRegister" object:nil userInfo:@{@"resutStauts":@"910"}];
            //
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"910"}];
            
            //            }
        }];
    }
    
    return YES; // [UMSocialSnsService handleOpenURL:url];
    
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    
    if([[url scheme] isEqualToString:WXAppID]) {
        if([PaymentTool manager].isWXPayment){
            [WXApi handleOpenURL:url delegate:self];
        }
    }
    //支付宝客户端支付返回数据的回调
    if ([[url scheme] isEqualToString:@"alipayYouche"]) {
        // [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:nil];
        
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"%@",resultDic);
            [[PaymentTool manager] resultWithInteger:resultDic];
            
            //            if ([[resultDic objectForKey:@"resultStatus"] intValue] == 9000) { // 支付成功
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payMyAccount" object:resultDic userInfo:@{@"resutStauts":@"909"}];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payRegister" object:resultDic userInfo:@{@"resutStauts":@"909"}];
            //
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"909"}];
            //
            //            }else if ([[resultDic objectForKey:@"resultStatus"] intValue] == 6001) { //用户中途取消
            //                [[UIApplication sharedApplication].keyWindow showToast:@"取消支付"];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payMyAccount" object:nil userInfo:@{@"resutStauts":@"910"}];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payRegister" object:nil userInfo:@{@"resutStauts":@"910"}];
            //
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"910"}];
            //
            //            }else { // 支付失败
            //                [[UIApplication sharedApplication].keyWindow showToast:@"支付失败"];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payMyAccount" object:nil userInfo:@{@"resutStauts":@"911"}];
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payRegister" object:nil userInfo:@{@"resutStauts":@"911"}];
            //
            //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"911"}];
            //
            //            }
        }];
    }
    //    if ([UMSocialSnsService handleOpenURL:url wxApiDelegate:self]) {
//    [UMSocialSnsService handleOpenURL:url wxApiDelegate:self];
    //    }
    return YES;
}

#pragma mark -- 微信支付回调

- (void)onResp:(BaseResp *)resp
{
    if([resp isKindOfClass:[PayResp class]]){
        //支付返回结果，实际支付结果需要去微信服务器端查询
        switch (resp.errCode) {
            case WXSuccess:        //0
                NSLog(@"支付成功－PaySuccess，retcode = %d", resp.errCode);
                [PaymentTool manager].backPayResultState(YES,@"支付成功");
                //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"909"}];
                break;
            case WXErrCodeCommon:        //-1
                NSLog(@"普通错误类型 retcode = %d", resp.errCode);
                [PaymentTool manager].backPayResultState(NO,@"支付失败");
                //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"911"}];
                //                [[UIApplication sharedApplication].keyWindow showToast:@"普通错误"];
                break;
                
            case WXErrCodeUserCancel:        //-2
                NSLog(@"用户点击取消并返回retcode = %d", resp.errCode);
                [PaymentTool manager].backPayResultState(NO,@"支付失败");
                
                //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"910"}];
                //                [[UIApplication sharedApplication].keyWindow showToast:@"取消支付"];
                break;
                
            case WXErrCodeSentFail:   //-3
                NSLog(@"发送失败 retcode = %d", resp.errCode);
                [PaymentTool manager].backPayResultState(NO,@"支付失败");
                
                //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"911"}];
                //
                //                [[UIApplication sharedApplication].keyWindow showToast:@"发送失败"];
                
                break;
                
            case WXErrCodeAuthDeny:    //-4
                NSLog(@"授权失败 retcode = %d", resp.errCode);
                [PaymentTool manager].backPayResultState(NO,@"支付失败");
                
                //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"911"}];
                
                break;
                
            case WXErrCodeUnsupport:       //-5
                NSLog(@"微信不支持retcode = %d", resp.errCode);
                [PaymentTool manager].backPayResultState(NO,@"支付失败");
                
                //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"911"}];
                
                break;
                
            default:
                NSLog(@"错误，retcode = %d, retstr = %@", resp.errCode,resp.errStr);
                //                [[NSNotificationCenter defaultCenter] postNotificationName:@"payResult" object:nil userInfo:@{@"resutStauts":@"911"}];
                [PaymentTool manager].backPayResultState(NO,@"支付失败");
                
                break;
        }
        if ([resp isKindOfClass:[SendAuthResp class]]) {
            
            if (!resp.errCode) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"wxLogin" object:@"922" userInfo:@{@"result":resp}];
            }else{
                [[NSNotificationCenter defaultCenter] postNotificationName:@"wxLogin" object:@"920" userInfo:nil];
            }
        }
    }
}
*/




@end
