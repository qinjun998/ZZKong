//
//  ECDNC.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ECDNC.h"
#import "UIColor+Base.h"
#import "NSObject+BeeNotification.h"


@implementation ECDNC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor colorMajor] ;
    self.navigationBar.tintColor = [UIColor whiteColor];
}



#pragma mark - Orientations
- (BOOL)shouldAutorotate
{
    return [self.topViewController shouldAutorotate];
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}

#pragma mark - presentation

- (UIModalPresentationStyle)modalPresentationStyle
{
    return [self.topViewController modalPresentationStyle];
}

- (UIModalTransitionStyle)modalTransitionStyle
{
    return [self.topViewController modalTransitionStyle];
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}


@end
