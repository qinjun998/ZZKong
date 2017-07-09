//
//  UIView+CornerRadius.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIView (CornerRadius)

typedef NS_OPTIONS(NSUInteger, ETBorderSide) {
    ETSideLeft,
    ETSideRight,
    ETSideTop,
    ETSideBottom
};

@property (nonatomic) IBInspectable CGFloat cornerRadius;

- (void)roundSide:(ETBorderSide)borderSide;

@end
