//
//  ETColor.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ETColor : UIColor

/**
 *  Create a color from a HEX string.
 *  It supports the following type:
 *  - #RGB
 *  - #ARGB
 *  - #RRGGBB
 *  - #AARRGGBB
 *
 *  @param hex HEX string
 *
 *  @return Returns the UIColor instance
 */
+ (UIColor *)hex:(NSString *)hexString;

/**
 *  通过0xffffff的16进制数字创建颜色
 *
 *  @param aRGB 0xffffff
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithRGB:(NSUInteger)aRGB;

/**
 *  公用颜色系.背景颜色#eeeeee
 *
 *  @return
 */
+ (UIColor *)bgColor;
/**
 *	公用的颜色系 #757575
 *
 *	@return UIColor
 */
+ (UIColor *)gray;

/**
 *	公用的颜色系 #0xbdbdbd
 *
 *	@return UIColor
 */
+ (UIColor *)lightGray;

/**
 *	公用的颜色系 #0x212121
 *
 *	@return UIColor
 */
+(UIColor *)darkGray;
/**
 *	公用的颜色系 #0xff3c25
 *
 *	@return UIColor
 */
+ (UIColor *)red;

/**
 *	公用的颜色系 #0xff9800
 *
 *	@return UIColor
 */
+ (UIColor *)orange;
/**
 *	公用的颜色系 #0xd32d21
 *
 *	@return UIColor
 */
+ (UIColor *)darkRed;
/**
 *	公用的颜色系 #0x97d054
 *
 *	@return UIColor
 */
+ (UIColor *)green;
/**
 *	我店红，擦擦
 *
 *	@return UIColor
 */
+(UIColor*)bgRed;

/**
 *	灰色字体
 *
 *	@return UIColor
 */
+(UIColor*)textGray;


//随机颜色
+ (UIColor *)randomColor;


@end
