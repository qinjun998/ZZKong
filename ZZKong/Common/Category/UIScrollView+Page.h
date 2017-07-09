//
//  UIScrollView+Page.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIScrollView (Page)

- (void)scrollToPage:(NSInteger)toIndex of:(NSInteger)ofCount;

- (void)scrollToTop;

@end
