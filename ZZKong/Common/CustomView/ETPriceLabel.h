//
//  ETPriceLabel.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  显示整数，小数字体大小不一样的label
 */
@interface ETPriceLabel : UILabel


/**
 *  功能:刷新显示
 */
- (void)updateWithPrice:(CGFloat)aPrice color:(UIColor *)aColor integerFont:(UIFont *)aIntrgerFont decimalFont:(UIFont *)aDecimalFont;

/**
 *  功能:刷新显示
 */
- (void)updateWithPriceText:(NSString *)aPriceText color:(UIColor *)aColor integerFont:(UIFont *)aIntrgerFont decimalFont:(UIFont *)aDecimalFont;

/**
 *  功能:带币种符号的刷新 保留一位小数
 */
- (void)updateWithPrice:(CGFloat)aPrice color:(UIColor *)aColor integerFont:(UIFont *)aIntrgerFont decimalFont:(UIFont *)aDecimalFont signFont:(UIFont*)signFont;
/**
 *  功能:带币种符号的刷新 保留一位小数
 */
- (void)updateWithPrice:(CGFloat)aPrice color:(UIColor *)aColor integerFont:(UIFont *)aIntrgerFont oneDecimalFont:(UIFont *)aDecimalFont signFont:(UIFont*)signFont isOneDecimal:(BOOL)isOneDecimal;
/**
 *  功能:数字后边带个数量
 */
-(void)updateWithPrice:(NSString *)aPrice color:(UIColor *)aColor integerFont:(UIFont *)aIntrgerFont decimalFont:(UIFont *)aDecimalFont signFont:(UIFont*)signFont productNub:(NSString *)aproductNub;


@end
