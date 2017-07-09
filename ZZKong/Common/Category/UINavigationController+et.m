//
//  UINavigationController+et.m
//  ZZKong
//
//  Created by lee on 16/9/20.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "UINavigationController+et.h"

@implementation UINavigationController (et)


- (void)setNavigationBarImage:(UIImage *)aImage
{
    [self.navigationBar setBackgroundImage:aImage forBarMetrics:UIBarMetricsDefault];
}


- (void)singlePushViewController:(UIViewController *)vc animated:(BOOL)animated{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UITabBarController *tbc = (UITabBarController *)window.rootViewController;
    
    tbc.selectedIndex = 1000;
    
    [self pushViewController:vc animated:animated];
    
}


@end
