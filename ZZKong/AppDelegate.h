//
//  AppDelegate.h
//  ZZKong
//
//  Created by lee on 2017/7/5.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ETAppDelegate.h"
#import "ECDWindow.h"


@interface AppDelegate : ETAppDelegate

@property (nonatomic, assign) BOOL isPresentingLoginVC;

@property (nonatomic, strong) ECDWindow *window;


//导航到主界面
-(void)showTabbarController;
//导航到登录
-(BOOL)showLoginVC;

@end

