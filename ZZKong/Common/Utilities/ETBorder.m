//
//  ETBorder.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETBorder.h"
#import "UIView+create.h"


typedef NS_ENUM(NSInteger, ETBorderViewType) {
    ETBorderViewTypeTop    = 10086,
    ETBorderViewTypeLeft,
    ETBorderViewTypeBottom,
    ETBorderViewTypeRight,
};

@implementation ETBorder

+ (void)addBorderWithView:(UIView *)aView type:(ETBorderType)aType andColor:(UIColor *)aColor
{
    [self addBorderWithView:aView type:aType andColor:aColor andEdgeInset:UIEdgeInsetsZero];
}

+ (void)addBorderWithView:(UIView *)aView type:(ETBorderType)aType andColor:(UIColor *)aColor andEdgeInset:(UIEdgeInsets)aEdgeInset
{
    UIView *copyView = [UIView newAutoLayoutView];
    copyView.backgroundColor = aColor;
    
    NSDictionary *insets = @{@"left": @(aEdgeInset.left), @"right": @(aEdgeInset.right), @"top": @(aEdgeInset.top), @"bottom": @(aEdgeInset.bottom)};
    
    CGFloat defaultBorderWidth = 1 / [UIScreen mainScreen].scale;
    
    if (aType & ETBorderTypeTop) {
        UIView *borderView = [UIView duplicate:copyView];
        borderView.tag = ETBorderViewTypeTop;
        [aView addSubview:borderView];
        
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[borderView]-(right)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[borderView]" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:defaultBorderWidth + aEdgeInset.bottom]];
    }
    
    if (aType & ETBorderTypeLeft) {
        UIView *borderView = [UIView duplicate:copyView];
        borderView.tag = ETBorderViewTypeLeft;
        [aView addSubview:borderView];
        
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[borderView]-(bottom)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[borderView]" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:defaultBorderWidth + aEdgeInset.right]];
    }
    
    if (aType & ETBorderTypeBottom) {
        UIView *borderView = [UIView duplicate:copyView];
        borderView.tag = ETBorderViewTypeBottom;
        [aView addSubview:borderView];
        
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[borderView]-(right)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[borderView]-(bottom)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:defaultBorderWidth + aEdgeInset.bottom]];
    }
    
    if (aType & ETBorderTypeRight) {
        UIView *borderView = [UIView duplicate:copyView];
        borderView.tag = ETBorderViewTypeRight;
        [aView addSubview:borderView];
        
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[borderView]-(bottom)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:aView attribute:NSLayoutAttributeRight multiplier:1.f constant:0.f]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:defaultBorderWidth + aEdgeInset.right]];
    }
}

+ (void)removeBorderWithView:(UIView *)aView type:(ETBorderType)aType
{
    if (aType & ETBorderTypeTop) {
        UIView *borderView = [aView viewWithTag:ETBorderViewTypeTop];
        [borderView removeFromSuperview];
    }
    
    if (aType & ETBorderTypeLeft) {
        UIView *borderView = [aView viewWithTag:ETBorderViewTypeLeft];
        [borderView removeFromSuperview];
    }
    
    if (aType & ETBorderTypeBottom) {
        UIView *borderView = [aView viewWithTag:ETBorderViewTypeBottom];
        [borderView removeFromSuperview];
    }
    
    if (aType & ETBorderTypeRight) {
        UIView *borderView = [aView viewWithTag:ETBorderViewTypeRight];
        [borderView removeFromSuperview];
    }
}


@end
