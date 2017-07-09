//
//  ECDWebVC.m
//  ZZKong
//
//  Created by lee on 16/10/8.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ECDWebVC.h"
#import "ETColor.h"

@interface ECDWebVC ()

@end

@implementation ECDWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.titleColor = [ETColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    //statusbar 文字和NavigationBar背景图
//    UIImage *bgImage = [UIImage imageNamed:@"nav_bg"];
//    self.navigationBarImage = bgImage;
    self.statusBarStyle = ETStatusBarStyleWhiteFont;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
