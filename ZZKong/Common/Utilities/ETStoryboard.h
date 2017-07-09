//
//  ETStoryboard.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ETStoryboard : NSObject
//获得当前sb名称
+(NSString *)storyboardName;
//设置sb名称
+(void)setStoryboardName:(NSString *)name;
//获得当前sb
+(UIStoryboard *) defaultStoryboard;

//获取默认sb中的vc
+(UIViewController *)viewControllerByName:(NSString *) vcName;

//获取指定sb名称下的指定vc
+(UIViewController *)viewControllerBySBName:(NSString *) sbName avcName:(NSString *) vcName;

#pragma mark - 默认登录界面 login vc
+(UIViewController *) getLoginVC ;


@end
