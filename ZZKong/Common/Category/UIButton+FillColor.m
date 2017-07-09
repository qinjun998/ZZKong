//
//  UIButton+FillColor.m
//  ZZKong
//
//  Created by lee on 16/10/4.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "UIButton+FillColor.h"
#import "UIImage+tool.h"


@implementation UIButton (FillColor)

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIImage imageWithColor:backgroundColor] forState:state];
}

@end
