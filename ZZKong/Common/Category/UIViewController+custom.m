//
//  UIViewController+custom.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "UIViewController+custom.h"

static const CGFloat ETUpdownLayoutNaviBtnImgWidth = 24.0;
static const CGFloat ETUpdownLayoutNaviBtnTitleHeight = 14.0;

@implementation ETDataNaviBtn

@end

@implementation ETUpdownLayoutNaviBtn
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(contentRect.size.width/2-ETUpdownLayoutNaviBtnImgWidth/2, contentRect.size.height/2-(ETUpdownLayoutNaviBtnImgWidth+ETUpdownLayoutNaviBtnTitleHeight)/2, ETUpdownLayoutNaviBtnImgWidth, ETUpdownLayoutNaviBtnImgWidth);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, contentRect.size.height/2-(ETUpdownLayoutNaviBtnImgWidth+ETUpdownLayoutNaviBtnTitleHeight)/2+ETUpdownLayoutNaviBtnImgWidth, contentRect.size.width, ETUpdownLayoutNaviBtnTitleHeight);
}

@end

@implementation UIViewController (custom)

#pragma mark - navi button
- (void)setNaviButtonType:(ETNaviButtonType)aType
                  isBgImg:(BOOL)aIsBgImg
                    frame:(CGRect)aFrame
                     text:(NSString *)aText
                    color:(UIColor *)aColor
                     font:(UIFont *)aFont
             shadowOffset:(CGSize)aShadowOffset
                alignment:(UIControlContentHorizontalAlignment)aAlignment
               edgeInsets:(UIEdgeInsets)aEdgeInsets
                   isLeft:(BOOL)aLeft
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (CGRectEqualToRect(CGRectZero, aFrame)) {
        btn.frame = CGRectMake(0, 0, 24, 24);
    }
    else {
        btn.frame = aFrame;
    }
    
    SEL selector = nil;
    if (aLeft) {
        selector = @selector(leftBtnClicked:);
    }
    else {
        selector = @selector(rightBtnClicked:);
    }
    
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    //根据样式不同更改按钮图片
    UIImage *normalImage = nil;
    UIImage *highlightImage = nil;
    switch (aType) {
        case ETNaviButtonNone: {//空的，无图片
            normalImage = nil;
            highlightImage = nil;
            break;
        }
        case ETNaviButtonReturn: {//返回
            normalImage = [UIImage imageNamed:@"navigationbar_btn_return"];
            highlightImage = [UIImage imageNamed:@"navigationbar_btn_return_sel" ];
            break;
        }
        default:
            normalImage = nil;
            highlightImage = nil;
            break;
    }
    
    if (aIsBgImg) {
        [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
        [btn setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    } else {
        [btn setImage:normalImage forState:UIControlStateNormal];
        [btn setImage:highlightImage forState:UIControlStateHighlighted];
    }
    
    //按钮文字
    if (aText != nil) {
        [btn setTitle:aText forState:UIControlStateNormal];
    }
    
    if (aColor) {
        [btn setTitleColor:aColor forState:UIControlStateNormal];
    }
    
    if (aFont) {
        btn.titleLabel.font = aFont;
    }
    
    if (!CGSizeEqualToSize(CGSizeZero, aShadowOffset)) {
        btn.titleLabel.shadowOffset = aShadowOffset;
    }
    
    btn.contentHorizontalAlignment = aAlignment;
    
    if (!UIEdgeInsetsEqualToEdgeInsets(aEdgeInsets, UIEdgeInsetsZero)) {
        btn.contentEdgeInsets = aEdgeInsets;
    }
    
    
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    if (aLeft) {
        self.navigationItem.leftBarButtonItem = btnItem;
    }
    else {
        self.navigationItem.rightBarButtonItem = btnItem;
    }
}

- (void)setNaviButtonType:(ETNaviButtonType)aType
                    frame:(CGRect)aFrame
                     text:(NSString *)aText
                    color:(UIColor *)aColor
                     font:(UIFont *)aFont
             shadowOffset:(CGSize)aShadowOffset
                alignment:(UIControlContentHorizontalAlignment)aAlignment
               edgeInsets:(UIEdgeInsets)aEdgeInsets
                   isLeft:(BOOL)aLeft
{
    [self setNaviButtonType:aType isBgImg:NO frame:aFrame text:aText color:aColor font:aFont shadowOffset:aShadowOffset alignment:aAlignment edgeInsets:aEdgeInsets isLeft:aLeft];
}

- (void)setNaviButtonType:(ETNaviButtonType)aType isLeft:(BOOL)aLeft
{
    [self setNaviButtonType:aType frame:CGRectZero text:nil color:nil font:nil shadowOffset:CGSizeZero alignment:UIControlContentHorizontalAlignmentLeft edgeInsets:UIEdgeInsetsZero isLeft:aLeft];
}

- (void)setNaviButtonText:(NSString *)aText isLeft:(BOOL)aLeft
{
    [self setNaviButtonType:ETNaviButtonNone frame:CGRectMake(0, 0, 40, 40) text:aText color:[UIColor  whiteColor] font:[UIFont systemFontOfSize:14.0] shadowOffset:CGSizeZero alignment:UIControlContentHorizontalAlignmentCenter edgeInsets:UIEdgeInsetsZero isLeft:aLeft];
}

- (void)setUpdownLayoutNaviButtonType:(ETNaviButtonType)aType text:(NSString *)aText href:(NSString *)aHref items:(NSArray *)aItems isLeft:(BOOL)aLeft
{
    ETDataNaviBtn *btn;
    if (aType!=ETNaviButtonNone && aText.length>0) {
        btn = [ETUpdownLayoutNaviBtn buttonWithType:UIButtonTypeCustom];
    } else {
        btn = [ETDataNaviBtn buttonWithType:UIButtonTypeCustom];
    }
    btn.frame = CGRectMake(0, 0, 44, 44);
    btn.href = aHref;
    btn.items = aItems;
    
    SEL selector = nil;
    if (aLeft) {
        selector = @selector(leftBtnClicked:);
    }
    else {
        selector = @selector(rightBtnClicked:);
    }
    
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    //根据样式不同更改按钮图片
    UIImage *normalImage = nil;
    UIImage *highlightImage = nil;
    switch (aType) {
        case ETNaviButtonNone: {//空的，无图片
            normalImage = nil;
            highlightImage = nil;
            break;
        }
        case ETNaviButtonReturn: {//返回
            normalImage = [UIImage imageNamed:@"navigationbar_btn_return" ];
            highlightImage = [UIImage imageNamed:@"navigationbar_btn_return_sel" ];
            break;
        }

        default:
            normalImage = nil;
            highlightImage = nil;
            break;
    }
    
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn setImage:highlightImage forState:UIControlStateHighlighted];
    
    //按钮文字
    if (aText != nil) {
        [btn setTitle:aText forState:UIControlStateNormal];
    }
    
    //文字颜色
    [btn setTitleColor:[UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1] forState:UIControlStateNormal];
    
    //文字字体
    if (aType!=ETNaviButtonNone && aText.length>0) {
        btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    } else {
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    }
    
    //文字居中
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    if (aLeft) {
        self.navigationItem.leftBarButtonItem = btnItem;
    }
    else {
        self.navigationItem.rightBarButtonItem = btnItem;
    }
}

- (void)leftBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBtnClicked:(id)sender
{
    
}

@end
