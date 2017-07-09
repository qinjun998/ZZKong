//
//  ETPageControl.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETPageControl : UIPageControl

@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) UIColor *pageFillColor; //没有选中点的颜色
@property (nonatomic, assign) NSInteger borderWidth;
@property (nonatomic, strong) UIColor *changeColor;
@property (nonatomic, assign) BOOL isChangeColor;

@end
