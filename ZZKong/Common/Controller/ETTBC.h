//
//  ETTBC.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ETTBC : UITabBarController<UITabBarControllerDelegate>

/**
 *  更新某个index的tab
 *
 *  @param aVC
 *  @param aInex
 */
- (void)updateViewController:(UIViewController *)aVC atIndex:(NSUInteger)aIndex;

@end
