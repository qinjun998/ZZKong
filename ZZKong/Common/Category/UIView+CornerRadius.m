//
//  UIView+CornerRadius.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "UIView+CornerRadius.h"



@implementation UIView (CornerRadius)

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

- (void)roundSide:(ETBorderSide)borderSide
{
    UIBezierPath *maskPath;
    
    if (borderSide == ETSideLeft)
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                         byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomLeft)
                                               cornerRadii:CGSizeMake(8.f, 8.f)];
    else if (borderSide == ETSideRight)
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                         byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomRight)
                                               cornerRadii:CGSizeMake(8.f, 8.f)];
    else if (borderSide == ETSideTop)
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                         byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
                                               cornerRadii:CGSizeMake(8.f, 8.f)];
    else if (borderSide == ETSideBottom)
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                         byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                               cornerRadii:CGSizeMake(8.f, 8.f)];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the image view's layer
    self.layer.mask = maskLayer;
    
    [self.layer setMasksToBounds:YES];
}

//_titleLabel.layer.masksToBounds = YES;
//
//CAShapeLayer *maskLayer = [CAShapeLayer layer];
//maskLayer.path = [UIBezierPath bezierPathWithRoundedRect:_titleLabel.bounds byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii: (CGSize){5.0f, 5.0f}].CGPath;
//
//_titleLabel.layer.mask = maskLayer;

@end
