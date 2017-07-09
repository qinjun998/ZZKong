//
//  ETFont.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETFont : UIFont

+ (UIFont *)etNumberFontOfSize:(CGFloat)fontSize;

/**
 * 小号字体
 * iPhone:10,ipad:12
 *
 *  @return
 */
+ (UIFont *)small;

/**
 *  中号字体
 * iPhone:12,ipad:14
 *  @return
 */
+ (UIFont *)medium;

/**
 *  大号字体
 * iPhone:14,ipad:16
 *  @return
 */
+ (UIFont *)large;

/**
 *  超大号字体
 * iPhone:18,ipad:20
 *  @return
 */
+ (UIFont *)bigLarge;

@end
