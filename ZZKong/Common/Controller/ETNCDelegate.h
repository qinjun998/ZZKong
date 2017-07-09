//
//  ETNCDelegate.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ETNCDelegate : NSObject <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

//进度动画
@property(nonatomic,strong)  UIPercentDrivenInteractiveTransition *interactivePopTransition;
@property(nonatomic,weak)  UINavigationController *ownerNC;   //nc
//
@property (nonatomic, getter=isAppearingVC) BOOL appearingVC;


@end
