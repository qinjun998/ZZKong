//
//  UIViewController+et.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ETStatusBarStyle) {
    ETStatusBarStyleBlackFont,
    ETStatusBarStyleWhiteFont
};


@interface UIViewController (ETNetwork)


@end


@interface UIViewController (ETUIKit)

/**
 *  ETVC如果需要响应tabbarItem被多次点击的提示，请overwrite实现这个方法
 */
- (void)repeateClickTabBarItem:(NSNumber *)count;

@end
