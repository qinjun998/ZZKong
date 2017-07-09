//
//  UIImage+Tint.h
//
//  Created by Matt Gemmell on 04/07/2010.
//  Copyright 2010 Instinctive Code.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tint)
// 根据Color生成Image(1*1)
- (UIImage *)imageTintedWithColor:(UIColor *)color;
// 根据Color和alpha生成Image
- (UIImage *)imageTintedWithColor:(UIColor *)color fraction:(CGFloat)fraction;

@end
