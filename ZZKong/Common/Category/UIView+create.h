//
//  UIView+create.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import <PureLayout/PureLayout.h>

@interface UIView (create)

/**
 *  快捷创建UIView及其子类,backgroundcolor=[uicolor clear]
 *
 *  @param frame 大小
 *
 *  @return kind of UIView
 */
+ (instancetype)viewWithFrame:(CGRect)frame;


/**
 *  生成一个frame = CGRectZero的 View，并设置translatesAutoresizingMaskIntoConstraints = NO
 *  backgroundcolor=[uicolor clear]
 *  @return view
 */
+ (instancetype)autolayoutView;

/**
 *  完全复制一个view
 *
 *  @param view 需要复制的view
 *
 *  @return 复制的view
 */
+ (UIView *)duplicate:(UIView *)view;

/**
 *  多段落文本view
 *
 *  @param attributs 属性字典数组
 *
 *  @return 复制的view
 */
+ (UIView *)createViewWithAttriutes:(NSArray *)attributs;

@end
