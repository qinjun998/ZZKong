//
//  UIViewController+base.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "UIViewController+base.h"
//tool
#import "ETLog.h"
#import "ETWeakObjectDeathNotifier.h"
//controllers
#import "ETContainerController.h"
//category
#import "NSObject+category.h"

@implementation UIViewController (base)

#pragma mark - Property
- (void)setContainerVC:(ETContainerController *)containerVC
{
    ETWeakObjectDeathNotifier *dn = [ETWeakObjectDeathNotifier new];
    dn.owner = containerVC;
    [self objc_setAssociatedObject:@"container" value:dn policy:OBJC_ASSOCIATION_RETAIN];
}

- (ETContainerController *)containerVC
{
    ETWeakObjectDeathNotifier *dn = [self objc_getAssociatedObject:@"container"];
    ETContainerController *container = dn.owner;
    if (!container) {
        container = self.navigationController.containerVC;
    }
    return container;
}

#pragma mark - API
//添加到rootvc
- (void)addToRootVC
{
    ETLogFuncW;
}

//添加到containerVC
- (void)addToContainerVC:(UIViewController *)aContainerVC
{
    ETLogFuncW;
}

//呈现动画
- (void)presentViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    ETLogFuncW;
}

//是否共享屏幕，默认为NO，代表如果有新的pc被router调用展现，则会取消之前显示的pc，然后展现此pc（目前应该只有登录界面会为YES）
- (BOOL)shouldShareScreen
{
    return NO;
}

//是否是pc
- (BOOL)isPc
{
    return NO;
}

@end
