//
//  UIViewController+animation.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (animation)

//navigation
- (id<UIViewControllerAnimatedTransitioning>)pushAnimations;
- (id<UIViewControllerAnimatedTransitioning>)popAnimations;
- (id<UIViewControllerAnimatedTransitioning>)pushInteractions;
- (id<UIViewControllerAnimatedTransitioning>)popInteractions;

@end
