//
//  ETViewMaker.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETViewMaker : NSObject

/**
 *  UIView的Frame
 */
@property(nonatomic, assign)CGRect frame;

/**
 *  UIView的bounds
 */
@property(nonatomic, assign)CGRect  bounds;

/**
 *  当前视图的背景颜色，默认为nil
 */
@property(nonatomic,copy) UIColor *backgroundColor;
/**
 *  当前视图是在父视图中是否是自动布局，默认为YES
 */
@property(nonatomic, assign)BOOL  isAutoLayout;

/**
 *  UIView.layer.cornerRadius 默认为0
 */
@property(nonatomic, assign)CGFloat  cornerRadius;

/**
 *  UIView.layer.borderWidth,默认为0
 */

@property(nonatomic, assign) CGFloat borderWidth;

/**
 *  UIView.layer.borderColor,Defaults to opaque black
 */
@property(nonatomic, strong)UIColor *borderColor;

@property(nonatomic, readonly)UIView *view;

- (instancetype)initWithView:(UIView *)aView;

- (void)install;


@end
