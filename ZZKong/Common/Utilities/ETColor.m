//
//  ETColor.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ETColor.h"

@implementation ETColor

+ (UIColor *)colorWithRGB:(NSUInteger)aRGB
{
    return [UIColor colorWithRed:((float)((aRGB & 0xFF0000) >> 16))/255.0 green:((float)((aRGB & 0xFF00) >> 8))/255.0 blue:((float)(aRGB & 0xFF))/255.0 alpha:1.0];
}

+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length
{
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat:@"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString:fullHex] scanHexInt:&hexComponent];
    
    return hexComponent / 255.0;
}
+ (UIColor *)hex:(NSString *)hexString
{
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch([colorString length])
    {
        case 3: // #RGB
            alpha = 1.0f;
            red = [self colorComponentFrom:colorString start:0 length:1];
            green = [self colorComponentFrom:colorString start:1 length:1];
            blue = [self colorComponentFrom:colorString start:2 length:1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom:colorString start:0 length:1];
            red = [self colorComponentFrom:colorString start:1 length:1];
            green = [self colorComponentFrom:colorString start:2 length:1];
            blue = [self colorComponentFrom:colorString start:3 length:1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red = [self colorComponentFrom:colorString start:0 length:2];
            green = [self colorComponentFrom:colorString start:2 length:2];
            blue = [self colorComponentFrom:colorString start:4 length:2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom:colorString start:0 length:2];
            red = [self colorComponentFrom:colorString start:2 length:2];
            green = [self colorComponentFrom:colorString start:4 length:2];
            blue = [self colorComponentFrom:colorString start:6 length:2];
            break;
        default:
            return nil;
            break;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)bgColor
{
    return [ self colorWithRGB:0xeeeeee];
}

+ (UIColor *)gray
{
    return [self colorWithRGB:0x757575];
}

+ (UIColor *)lightGray
{
    return [self colorWithRGB:0xbdbdbd];
}


+(UIColor *)darkGray
{
    return [self colorWithRGB:0x212121];
}

+ (UIColor *)red
{
    return [self colorWithRGB:0xff3c25];
}

+ (UIColor *)orange
{
    return [self colorWithRGB:0xff9800];
}

+ (UIColor *)green
{
    return [self colorWithRGB:0x97d054];
}

+ (UIColor *)darkRed
{
    return [self colorWithRGB:0xd32d21];
}
/**
 *	我店红，擦擦
 *
 *	@return UIColor
 */
+(UIColor*)bgRed {
    return [UIColor colorWithRed:220.0/255 green:0/255 blue:0/255 alpha:1];
}

/**
 *	我店字体灰，呵呵呵
 *
 *	@return UIColor
 */
+(UIColor*)textGray {
    return [UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1];
}

+ (UIColor *)randomColor
{
    CGFloat hue = (arc4random() % 256 / 256.0);
    CGFloat saturation = (arc4random() % 128 / 256.0) + 0.5;
    CGFloat brightness = (arc4random() % 128 / 256.0) + 0.5;
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}



@end
