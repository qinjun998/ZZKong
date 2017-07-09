//
//  ETBorder.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ETBorderType) {
    ETBorderTypeNone      = 0,
    ETBorderTypeTop    = 1 << 0,
    ETBorderTypeLeft   = 1 << 1,
    ETBorderTypeBottom = 1 << 2,
    ETBorderTypeRight  = 1 << 3,
    ETBorderTypeAll    = ETBorderTypeTop | ETBorderTypeLeft | ETBorderTypeBottom | ETBorderTypeRight
};

@interface ETBorder : NSObject

/**
 *  为view添加边线
 *
 *  @param aView  view
 *  @param aType  边线类型，可以累计
 *  @param aColor 颜色
 */
+ (void)addBorderWithView:(UIView *)aView type:(ETBorderType)aType andColor:(UIColor *)aColor;

/**
 *  为view添加边线，可以设置缩进
 *
 *  @param aView  view
 *  @param aType  边线类型，可以累计
 *  @param aColor 颜色
 *  @param aEdgeInset 缩进
 */
+ (void)addBorderWithView:(UIView *)aView type:(ETBorderType)aType andColor:(UIColor *)aColor andEdgeInset:(UIEdgeInsets)aEdgeInset;

/**
 *  删除border
 *
 *  @param aView view
 *  @param aType 边线类型，可以累计
 */
+ (void)removeBorderWithView:(UIView *)aView type:(ETBorderType)aType;

@end
