//
//  ETTabBarItem.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ETTabBarItem;

@protocol ETTabBarItemDelegate <NSObject>

- (void)tabBarItemDidSelectItem:(ETTabBarItem *)item;

@end


@interface ETTabBarItem : UIView

/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  标题label
 */
@property (nonatomic, strong, readonly) UILabel *titleLabel;
/**
 *  默认图片
 */
@property (nonatomic, strong) UIImage *image;
/**
 *  选中时候的图片
 */
@property (nonatomic, strong) UIImage *selectedImage;
/**
 *  图片的偏移
 */
@property (nonatomic) UIEdgeInsets imageInsets;
/**
 *  提示字符
 */
@property (nonatomic, copy) NSString *badgeValue;
/**
 *  显示红点指示
 */
@property (nonatomic) BOOL showIndicate;
/**
 *  是否选中
 */
@property (nonatomic, getter = isSelected) BOOL selected;
/**
 *  代理
 */
@property (nonatomic, weak) id<ETTabBarItemDelegate> delegate;
/**
 *  创建函数
 *
 *  @param title         标题
 *  @param image         默认图片
 *  @param selectedImage 选中时候的图片
 *
 *  @return ETTabBarItem
 */
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;



@end
