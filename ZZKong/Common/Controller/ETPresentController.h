//
//  ETPresentController.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETContainerController.h"
@class ETPresentController;

@protocol ETPresentControllerDelegate <NSObject>

@optional
//是否能够点击空白区域，dismiss当前呈现的界面
- (BOOL)shouldDismissPresentationController:(ETPresentController *)aPresentationController;
//将要呈现
- (void)willPresentPC:(ETPresentController *)aPresentationController;
//已经呈现
- (void)didPresentPC:(ETPresentController *)aPresentationController;
//将要消失
- (void)willDismissPC:(ETPresentController *)aPresentationController;
//已经消失
- (void)didDismissPC:(ETPresentController *)aPresentationController;

@end

@interface ETPresentController : ETContainerController

//代理
@property (nonatomic, weak) id<ETPresentControllerDelegate> pcDelegate;
//动画持续时间
@property (nonatomic) NSTimeInterval duration;
//背景view
@property (nonatomic, strong, readonly) UIView *dimmingView;
//设置背景view的位置
@property (assign, nonatomic) UIEdgeInsets dimmingEdge;

/**
 *  做动画的VC
 */
@property (nonatomic, strong) UIViewController *animationVC;
/**
 *  做动画的view
 */
@property (nonatomic, strong) UIView *animationView;

@end
