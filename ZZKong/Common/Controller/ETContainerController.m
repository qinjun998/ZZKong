//
//  ETContainerController.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETContainerController.h"
//category
#import "NSObject+BeeNotification.h"
#import "UIViewController+base.h"
//tools
#import "ETLog.h"
#import "ETAppDelegate.h"

@interface ETContainerController ()

@end

@implementation ETContainerController

- (void)dealloc
{
    ETLogFuncW;
    [self unobserveAllNotifications];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ETLogFuncI;
}

#pragma mark - Overrides

- (BOOL)shouldAutomaticallyForwardAppearanceMethods NS_AVAILABLE_IOS(6_0)
{
    return NO;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods NS_AVAILABLE_IOS(6_0)
{
    return NO;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    NSArray *viewControllers = [self childViewControllersWithRotationCallbackAutoForward];
    for (UIViewController *viewController in viewControllers) {
        [viewController willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
        
    }
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    NSArray *viewControllers = [self childViewControllersWithRotationCallbackAutoForward];
    for (UIViewController *viewController in viewControllers) {
        [viewController willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    }
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    
    NSArray *viewControllers = [self childViewControllersWithRotationCallbackAutoForward];
    for (UIViewController *viewController in viewControllers) {
        [viewController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator//for ios8 up
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    NSArray *viewControllers = [self childViewControllersWithRotationCallbackAutoForward];
    for (UIViewController *viewController in viewControllers) {
        [viewController viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    }
}

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator//for ios8 up
{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    
    NSArray *viewControllers = [self childViewControllersWithRotationCallbackAutoForward];
    for (UIViewController *viewController in viewControllers) {
        [viewController willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    }
}

/*
 向下查看和旋转相关的ChildViewController的shouldAutorotate的值
 只有所有相关的子VC都支持Autorotate，才返回YES
 */
- (BOOL)shouldAutorotate NS_AVAILABLE_IOS(6_0)
{
    NSArray *viewControllers = [self childViewControllersWithRotationCallbackAutoForward];
    BOOL shouldAutorotate = YES;
    for (UIViewController *viewController in viewControllers) {
        shouldAutorotate = shouldAutorotate && [viewController shouldAutorotate];
    }
    
    return shouldAutorotate;
}



#pragma mark - 下面两个方法是在需要的情况下给基类覆盖用的，不是所有的容器都需要将相关方法传递给所有的childViewControllers
- (NSArray *)childViewControllersWithAppearanceCallbackAutoForward
{
    return self.childViewControllers;
}

- (NSArray *)childViewControllersWithRotationCallbackAutoForward
{
    return self.childViewControllers;
}

#pragma mark - add
- (void)addToRootVC
{
    ETAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [self addToContainerVC:appDelegate.pcWindow.rootViewController];
}

- (void)addToContainerVC:(UIViewController *)aContainerVC
{
    if (self.parentViewController) {
        [self willMoveToParentViewController:nil];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }
    
    [aContainerVC addChildViewController:self];
    self.view.frame = self.parentViewController.view.bounds;
    [aContainerVC.view addSubview:self.view];
    
    [aContainerVC.view updateConstraintsIfNeeded];//强制更新约束
    [aContainerVC.view layoutIfNeeded];//强制刷新界面
}

#pragma mark - overwrite

- (void)addChildViewController:(UIViewController *)childController
{
    if (!childController) {
        return ;
    }
    
    [super addChildViewController:childController];
    childController.containerVC = self;
}

#pragma mark - child view controllers life cycle methods

- (void)callChildVCsViewWillAppear:(BOOL)animated
{
    NSArray *viewControllers = [self childViewControllersWithAppearanceCallbackAutoForward];
    for (UIViewController *viewController in viewControllers) {
        [viewController beginAppearanceTransition:YES animated:animated];
    }
}

- (void)callChildVCsViewDidAppear:(BOOL)animated
{
    NSArray *viewControllers = [self childViewControllersWithAppearanceCallbackAutoForward];
    for (UIViewController *viewController in viewControllers) {
        [viewController endAppearanceTransition];
    }
}

- (void)callChildVCsViewWillDisappear:(BOOL)animated
{
    NSArray *viewControllers = [self childViewControllersWithAppearanceCallbackAutoForward];
    for (UIViewController *viewController in viewControllers) {
        [viewController beginAppearanceTransition:NO animated:animated];
    }
}

- (void)callChildVCsViewDidDisappear:(BOOL)animated
{
    NSArray *viewControllers = [self childViewControllersWithAppearanceCallbackAutoForward];
    for (UIViewController *viewController in viewControllers) {
        [viewController endAppearanceTransition];
    }
}


@end
