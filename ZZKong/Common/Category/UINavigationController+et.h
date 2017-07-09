//
//  UINavigationController+et.h
//  ZZKong
//
//  Created by lee on 16/9/20.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (et)

- (void)setNavigationBarImage:(UIImage *)aImage;

- (void)singlePushViewController:(UIViewController *)vc animated:(BOOL)animated;

@end
