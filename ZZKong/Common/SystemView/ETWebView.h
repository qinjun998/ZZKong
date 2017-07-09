//
//  ETWebView.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETWebView : UIWebView

/**
 *  设置cookie
 *
 *  @param aDomain
 *  @param aName
 *  @param aValue
 */
+ (void)setCookie:(NSString *)aDomain name:(NSString *)aName value:(NSString *)aValue;
/**
 *  设置cookie
 *
 *  @param aName
 *  @param aValue
 */
+ (void)setCookieName:(NSString *)aName value:(NSString *)aValue;
/**
 *  清除cookies
 */
+ (void)clearCookies;

/**
 *  添加默认的cookies
 */
+ (void)setupDefaultCookies;



@end
