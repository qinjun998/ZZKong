//
//  ETNC.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETNC.h"
//category
#import "NSArray+safe.h"
#import "NSData+Base64.h"
#import "NSObject+BeeNotification.h"
#import "NSMutableDictionary+safe.h"
#import "NSMutableArray+safe.h"
#import "UIViewController+et.h"
#import "NSString+safe.h"


//cache
#import "ETUserDefault.h"
//tools
#import "ETLog.h"
//controller
#import "ETVC.h"

@implementation ETNC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.customAnimationDelegate = [ETNCDelegate new];
    self.customAnimationDelegate.ownerNC = self;
    self.delegate = self.customAnimationDelegate;
    
    UIScreenEdgePanGestureRecognizer *popRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self.customAnimationDelegate action:NSSelectorFromString(@"handleEdgePanGestureRecognizer:")];
    popRecognizer.delegate = self.customAnimationDelegate;
    popRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:popRecognizer];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (animated && self.customAnimationDelegate.isAppearingVC) {
        //避免同一时间push多个界面导致的crash
        return ;
    }
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    
    return [super popViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    return [super popToViewController:viewController animated:animated];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    
    return [super popToRootViewControllerAnimated:animated];
}

#pragma mark - ETTBCRepeateClickTabBarItem Delegate
- (void)repeateClickTabBarItem:(NSNumber *)count
{
    if ([self.topViewController respondsToSelector:@selector(repeateClickTabBarItem:)]) {
        [self.topViewController performSelector:@selector(repeateClickTabBarItem:) withObject:count];
    }
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}



@end
