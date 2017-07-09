//
//  ECDVC.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ECDVC.h"
#import "ETColor.h"
#import "UIColor+Base.h"


@implementation ECDVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.titleColor = [ETColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    //导航条颜色设置，取代原来的背景图
    self.navigationController.navigationBar.barTintColor = [UIColor colorMajor] ;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //statusbar 文字和NavigationBar背景图
//    UIImage *bgImage = [UIImage imageNamed:@"nav_bg"];
//    self.navigationBarImage = bgImage;
    self.statusBarStyle = ETStatusBarStyleWhiteFont;
}

//id<UIApplicationDelegate>
-(AppDelegate *)appDelegate{
   return (AppDelegate *) [UIApplication sharedApplication].delegate;
}







@end
