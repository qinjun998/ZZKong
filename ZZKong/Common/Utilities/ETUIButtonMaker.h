//
//  ETUIButtonMaker.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETViewMaker.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ETUIButtonMaker : ETViewMaker

@property(nonatomic, assign)CGFloat titleFontSize;

/**
 *  UIControlStateNormal状态下的title颜色
 */
@property(nonatomic, strong)UIColor *titleColor;

/**
 *  UIControlStateNormal状态下的图片
 */
@property(nonatomic, strong)UIImage *image;

/**
 *  UIControlStateNormal状态下的背景图片
 */
@property(nonatomic, strong)UIImage *backgroundImage;

// default is UIEdgeInsetsZero
@property(nonatomic) UIEdgeInsets contentEdgeInsets;

// default is UIEdgeInsetsZero
@property(nonatomic) UIEdgeInsets imageEdgeInsets;

@property(nonatomic) UIEdgeInsets titleEdgeInsets;

/**
 *  设置button不同状态下的字体颜色，图片icon，背景图
 *
 */
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;
- (void)setImage:(UIImage *)image forState:(UIControlState)state;
- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state;

@end
