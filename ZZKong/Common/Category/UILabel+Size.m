//
//  UILabel+DynamicSize.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "UILabel+Size.h"
#import "UIView+Extension.h"

@implementation UILabel(Size)

- (void)resizeToFit
{
    float height = [self expectedHeight];
    CGRect newFrame = [self frame];
    newFrame.size.height = height;
    [self setFrame:newFrame];
}

- (float)expectedHeight
{
    [self setNumberOfLines:0];
    [self setLineBreakMode:NSLineBreakByWordWrapping];
    float width = self.frame.size.width;
    if(-0.0001 < width && width < 0.0001){
        CGSize size = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
        width = size.width;
		self.width = width;
    }
    
    CGSize maximumLabelSize = CGSizeMake(width ,9999);
    
    CGSize expectedLabelSize = [[self text] boundingRectWithSize:maximumLabelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[self font]} context:nil].size;
    return expectedLabelSize.height;
}

- (void)resizeToStretch
{
    float width = [self expectedWidth];
    CGRect newFrame = [self frame];
    newFrame.size.width = width;
    [self setFrame:newFrame];
}

- (float)expectedWidth
{
    [self setNumberOfLines:1];
    float height = self.frame.size.height;
    if(-0.0001 < height && height < 0.0001){
        height = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}].height;
		self.height = height;
    }
    CGSize maximumLabelSize = CGSizeMake(9999, height);
    
    CGSize expectedLabelSize = [[self text] boundingRectWithSize:maximumLabelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[self font]} context:nil].size;
    return expectedLabelSize.width + 20.f;
}

//获得动态高度
//- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font aWidth:(CGFloat )aWidth{
//    CGSize maxSize = CGSizeMake(aWidth, MAXFLOAT);
//    NSDictionary *attrs = @{NSFontAttributeName : font};
//    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
//}
//获得动态高度
- (CGSize)textSizeWithWidth:(CGFloat )aWidth{
    self.numberOfLines = 0;
    CGSize maxSize = CGSizeMake(aWidth, MAXFLOAT);
    NSDictionary *attrs = @{NSFontAttributeName : self.font};
    return [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
}


@end
