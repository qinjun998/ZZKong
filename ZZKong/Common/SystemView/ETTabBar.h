//
//  ETTabBar.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ETTabBarItem,ETTabBar;

@protocol ETTabBarDelegate <NSObject>

- (void)customTabBar:(ETTabBar *)tabBar didSelectItem:(ETTabBarItem *)item;

@end



@interface ETTabBar : UIView

/**
 *  背景图片
 */
@property (nonatomic, strong) UIImage *backgroundImage;
/**
 *  代理
 */
@property (nonatomic, weak) id<ETTabBarDelegate> delegate;
/**
 *  当前选中的tabbarItem
 */
@property (nonatomic, weak, readonly) ETTabBarItem *selectedItem;
/**
 *  当前选中的tabbarItem的序号
 */
@property (nonatomic, readonly) NSUInteger selectedIndex;


@end
