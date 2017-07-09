//
//  ETPageControl.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETPageControl.h"

@implementation ETPageControl

- (void)setNumberOfPages:(NSInteger)numberOfPages
{
    [super setNumberOfPages:numberOfPages];
    [self updateDots];
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    if ([super respondsToSelector:@selector(setCurrentPage:)]) {
        [super setCurrentPage:currentPage];
        [self updateDots];
    }
}

-(void)updateDots
{
    for (UIView *subView in self.subviews) {
        UIColor *currentColor = self.isChangeColor ?self.changeColor :[UIColor whiteColor];
        if (self.currentPage == [self.subviews indexOfObject:subView]) {
            subView.backgroundColor = self.fillColor ?: currentColor;
        }
        else {
            subView.backgroundColor = self.pageFillColor ?: [UIColor clearColor];
        }
        
        subView.layer.borderColor = self.borderColor.CGColor ?: currentColor.CGColor;
        
        subView.layer.borderWidth = self.borderWidth?:1.f;
    }
}


@end
