//
//  ETPresentController.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ETPresentController.h"
#import "ETAppDelegate.h"
//define
#import "ETFuncDefine.h"
//category
#import "UIView+create.h"
//tool
#import "ETConstraintHelper.h"


@interface ETPresentController ()

@property (nonatomic, strong) UIView *dimmingView;

@end

@implementation ETPresentController
@synthesize dimmingView;

- (void)loadView
{
    [super loadView];
    
    if (!self.dimmingView) {
        self.dimmingView = [UIView autolayoutView];
        self.dimmingView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.5f];
        self.dimmingView.alpha = 0.f;
    }
    [self.view addSubview:self.dimmingView];
    [ETConstraintHelper setView:self.dimmingView fullAsSuperview:self.view andEdgeInsets:self.dimmingEdge];
    
    [self.dimmingView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapDimmingView)]];
}

- (void)onTapDimmingView
{
    WEAK_SELF;
    if ([self.pcDelegate respondsToSelector:@selector(shouldDismissPresentationController:)]) {
        STRONG_SELF;
        if (![self.pcDelegate shouldDismissPresentationController:self]) {
            return ;
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    }];
}

- (NSTimeInterval)duration
{
    if (_duration == 0.f) {
        _duration = .4f;
    }
    
    return _duration;
}

- (void)presentViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    ETAppDelegate *app = (id)[UIApplication sharedApplication].delegate;
    if (app.pcWindow.rootViewController.childViewControllers.count) {
        app.pcWindow.hidden = NO;
        [app.pcWindow makeKeyWindow];
    }
    
    if ([self.pcDelegate respondsToSelector:@selector(willPresentPC:)]) {
        [self.pcDelegate willPresentPC:self];
    }
    
    //call viewwillappear
    [self callChildVCsViewWillAppear:animated];
    
    WEAK_SELF;
    [UIView animateWithDuration:self.duration animations:^{
        STRONG_SELF;
        self.dimmingView.alpha = 1.f;
        self.animationVC.view.center = CGPointMake(self.animationVC.view.center.x, self.animationVC.view.center.y - self.animationVC.view.bounds.size.height);
        self.animationView.center = CGPointMake(self.animationView.center.x, self.animationView.center.y - self.animationView.bounds.size.height);
    } completion:^(BOOL finished) {
        STRONG_SELF;
        [self didMoveToParentViewController:self.parentViewController];
        [self.animationVC didMoveToParentViewController:self.animationVC.parentViewController];
        
        //call viewdidappear
        [self callChildVCsViewDidAppear:animated];
        
        if ([self.pcDelegate respondsToSelector:@selector(didPresentPC:)]) {
            [self.pcDelegate didPresentPC:self];
        }
        
        if (completion) {
            completion();
        }
    }];
}

- (void)dismissViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    [super dismissViewControllerAnimated:animated completion:completion];
    
    if ([self.pcDelegate respondsToSelector:@selector(willDismissPC:)]) {
        [self.pcDelegate willDismissPC:self];
    }
    
    [self willMoveToParentViewController:nil];
    
    //call viewwilldisappear
    [self callChildVCsViewWillDisappear:animated];
    
    WEAK_SELF;
    [UIView animateWithDuration:self.duration animations:^{
        STRONG_SELF;
        self.dimmingView.alpha = 0.f;
        self.animationVC.view.center = CGPointMake(self.animationVC.view.center.x, self.animationVC.view.center.y + self.animationVC.view.bounds.size.height);
        self.animationView.center = CGPointMake(self.animationView.center.x, self.animationView.center.y + self.animationView.bounds.size.height);
    } completion:^(BOOL finished) {
        STRONG_SELF;
        
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
        
        [self.animationVC removeFromParentViewController];
        
//        //call viewdiddisappear
        [self callChildVCsViewDidDisappear:animated];
        
        //取消显示pc window
        ETAppDelegate *app = (id)[UIApplication sharedApplication].delegate;
        if (app.pcWindow.rootViewController.childViewControllers.count == 0) {
            [app.pcWindow endEditing:YES];//隐藏pc的键盘
            [app.window makeKeyWindow];
            app.pcWindow.hidden = YES;
        }
        
        if ([self.pcDelegate respondsToSelector:@selector(didDismissPC:)]) {
            [self.pcDelegate didDismissPC:self];
        }
        
        if (completion) {
            completion();
        }
    }];
}

//是否是pc
- (BOOL)isPc
{
    return YES;
}


@end
