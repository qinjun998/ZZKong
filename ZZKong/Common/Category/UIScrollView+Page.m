//
//  UIScrollView+Page.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "UIScrollView+Page.h"

@implementation UIScrollView (Page)

- (void)scrollToPage:(NSInteger)toIndex of:(NSInteger)ofCount {
    CGFloat pageWidth = self.contentSize.width / ofCount;
    CGFloat x = toIndex * pageWidth;
    [self setContentOffset:CGPointMake(x, 0) animated:YES];
}

- (void)scrollToTop {
    [self scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
}

@end
