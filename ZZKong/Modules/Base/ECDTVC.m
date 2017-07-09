//
//  ECDTVC.m
//  ZZKong
//
//  Created by lee on 16/9/21.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ECDTVC.h"
#import "ETColor.h"

@interface ECDTVC ()

@end

@implementation ECDTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
