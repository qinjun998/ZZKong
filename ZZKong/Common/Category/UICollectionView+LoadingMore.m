//
//  UICollectionView+LoadingMore.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "UICollectionView+LoadingMore.h"
#import "UIView+create.h"

@implementation UICollectionView (LoadingMore)

- (void)showLoadingMore
{
    [self showLoadingMoreWithHeight:40.f andEdgeInsets:UIEdgeInsetsZero];
}

- (void)showLoadingMoreWithHeight:(CGFloat)aHeight andEdgeInsets:(UIEdgeInsets)aInsets
{
    CGFloat width = self.frame.size.width;
    CGFloat height = aHeight;
    
    UIView *footerView = [UIView viewWithFrame:CGRectMake(0, self.contentSize.height, width, height)];
    self.contentInset = UIEdgeInsetsMake(0, 0, aHeight, 0);
    self.contentSize = CGSizeMake(width, self.contentSize.height);
    footerView.tag = 1000;
    
    UIActivityIndicatorView *indicatorView = [UIActivityIndicatorView autolayoutView];
    [indicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [indicatorView startAnimating];
    [footerView addSubview:indicatorView];
    
    UILabel *label = [UILabel autolayoutView];
    label.tag = 999;
    [label setBackgroundColor:[UIColor clearColor]];
    [label setText:@"正在加载"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [label setFont:[UIFont systemFontOfSize:15.0]];
    [footerView addSubview:label];
    
    [self addSubview:footerView];
    
    [footerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[indicatorView][label]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(indicatorView, label)]];
    
    [footerView addConstraint:[NSLayoutConstraint constraintWithItem:indicatorView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:footerView attribute:NSLayoutAttributeCenterY multiplier:1.f constant:aInsets.top - aInsets.bottom]];
    
    [footerView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:footerView attribute:NSLayoutAttributeCenterX multiplier:1.f constant:aInsets.left - aInsets.right]];
}

- (void)stopLoadingMore
{
    for (UIView *subView in self.subviews) {
        if (subView.tag == 1000) {
            [subView removeFromSuperview];
            self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            break;
        }
    }
}

- (BOOL)isLoading
{
    return self.contentInset.bottom > 0;
}

@end
