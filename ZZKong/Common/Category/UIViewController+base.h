//
//  UIViewController+base.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ETContainerController;

@interface UIViewController (base)

@property (nonatomic, weak) ETContainerController *containerVC;//容器vc

//添加到rootvc
- (void)addToRootVC;
//添加到containerVC
- (void)addToContainerVC:(UIViewController *)aContainerVC;
//呈现动画
- (void)presentViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion;
//是否共享屏幕，默认为NO，代表如果有新的pc被router调用展现，则会取消之前显示的pc，然后展现此pc（目前应该只有登录界面会为YES）
- (BOOL)shouldShareScreen;
//是否是pc
- (BOOL)isPc;


@end
