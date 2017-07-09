//
//  ETPriceLabel.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ETPriceLabel.h"

@implementation ETPriceLabel


- (id)init
{
    self = [super init];
    if (self) {
        self.adjustsFontSizeToFitWidth = YES;
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.adjustsFontSizeToFitWidth = YES;
    }
    
    return self;
}

- (void)updateWithPrice:(CGFloat)aPrice color:(UIColor *)aColor integerFont:(UIFont *)aIntrgerFont decimalFont:(UIFont *)aDecimalFont
{
    [self updateWithPriceText:[NSString stringWithFormat:@"￥%.2f",aPrice] color:aColor integerFont:aIntrgerFont decimalFont:aDecimalFont];
}

- (void)updateWithPriceText:(NSString *)aPriceText color:(UIColor *)aColor integerFont:(UIFont *)aIntrgerFont decimalFont:(UIFont *)aDecimalFont
{
    if (aPriceText.length <= 0) {
        return;
    }
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:aPriceText];
    [string addAttribute:NSForegroundColorAttributeName value:aColor range:NSMakeRange(0, string.length)];
    
    NSRange range = [aPriceText rangeOfString:@"."];
    [string addAttribute:NSFontAttributeName value:aIntrgerFont range:NSMakeRange(0, range.location)];
    [string addAttribute:NSFontAttributeName value:aDecimalFont range:NSMakeRange(range.location,  string.length - range.location)];
    
    self.attributedText = string;
}





/**
 *  功能:带币种符号的刷新 保留两位小数
 */
- (void)updateWithPrice:(CGFloat)aPrice color:(UIColor *)aColor integerFont:(UIFont *)aIntrgerFont decimalFont:(UIFont *)aDecimalFont signFont:(UIFont*)signFont {
    
    [self updateWithPrice:aPrice color:aColor integerFont:aIntrgerFont oneDecimalFont:aDecimalFont signFont:signFont isOneDecimal:NO];
}

/**
 *  功能:带币种符号的刷新 保留一位小数
 */
- (void)updateWithPrice:(CGFloat)aPrice color:(UIColor *)aColor integerFont:(UIFont *)aIntrgerFont oneDecimalFont:(UIFont *)aDecimalFont signFont:(UIFont*)signFont isOneDecimal:(BOOL)isOneDecimal {
    NSString* aPriceText = nil;
    if (isOneDecimal) {
        aPriceText = [NSString stringWithFormat:@"￥%.1f",aPrice];
    } else {
        aPriceText = [NSString stringWithFormat:@"￥%.2f",aPrice];
    }
    
    if (aPriceText.length <= 0) {
        return;
    }
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:aPriceText];
    [string addAttribute:NSForegroundColorAttributeName value:aColor range:NSMakeRange(0, string.length)];
    
    NSRange range = [aPriceText rangeOfString:@"."];
    [string addAttribute:NSFontAttributeName value:signFont range:NSMakeRange(0, 1)];
    [string addAttribute:NSFontAttributeName value:aIntrgerFont range:NSMakeRange(1, range.location)];
    [string addAttribute:NSFontAttributeName value:aDecimalFont range:NSMakeRange(range.location,  string.length - range.location)];
    
    self.attributedText = string;
}
/**
 *  功能:带产品数量的刷新
 */

-(void)updateWithPrice:(NSString *)aPrice color:(UIColor *)aColor integerFont:(UIFont *)aIntrgerFont decimalFont:(UIFont *)aDecimalFont signFont:(UIFont *)signFont productNub:(NSString *)aproductNub{
    NSString *priceStr = @"";
    if ([aPrice isEqualToString:@"0"]) {
        priceStr = [NSString stringWithFormat:@"￥%@.0",aPrice];
    }else{
        priceStr = [NSString stringWithFormat:@"￥%.2f",[aPrice floatValue]];
    }
    NSString* aPriceText = [NSString stringWithFormat:@"%@  X%@",priceStr,aproductNub];
    if (aPriceText.length <= 0) {
        return;
    }
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:aPriceText];
    [string1 addAttribute:NSForegroundColorAttributeName value:aColor range:NSMakeRange(0, priceStr.length)];
    
    NSRange range = [aPriceText rangeOfString:@"."];
    [string1 addAttribute:NSFontAttributeName value:signFont range:NSMakeRange(0, 1)];
    [string1 addAttribute:NSFontAttributeName value:aIntrgerFont range:NSMakeRange(1, range.location)];
    [string1 addAttribute:NSFontAttributeName value:aDecimalFont range:NSMakeRange(range.location,  string1.length - range.location - aproductNub.length)];
    [string1 addAttribute:NSFontAttributeName value:aDecimalFont range:NSMakeRange(priceStr.length, aproductNub.length+3)];
    [string1 addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(priceStr.length, aproductNub.length+3)];
    self.attributedText = string1;
}



@end
