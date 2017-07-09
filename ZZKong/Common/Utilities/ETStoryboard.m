//
//  ETStoryboard.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETStoryboard.h"


static NSString *default_name ;


@interface ETStoryboard ()

@end

@implementation ETStoryboard

//获得当前sb名称
+(NSString *)storyboardName{
    return default_name;
}
//设置sb名称
+(void)setStoryboardName:(NSString *)name{
    default_name = name;
}

//获得当前sb
+(UIStoryboard *) defaultStoryboard{
      return [UIStoryboard storyboardWithName:default_name bundle:nil];
}

//获取默认sb中的vc
+(UIViewController *)viewControllerByName:(NSString *) vcName{
   return  [[ETStoryboard defaultStoryboard] instantiateViewControllerWithIdentifier:vcName];
}

//获取指定sb名称下的指定vc
+(UIViewController *)viewControllerBySBName:(NSString *) sbName avcName:(NSString *) vcName{
    UIStoryboard *sb= [UIStoryboard storyboardWithName:sbName bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:vcName];
}

#pragma mark - ZZKong main login vc
+(UIViewController *) getLoginVC {

    return [ETStoryboard viewControllerBySBName:@"LoginHome" avcName:@"ZZKLoginVC"];
}


@end
