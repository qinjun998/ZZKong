//
//  UIView+Border.m
//  ZZKong
//
//  Created by lee on 16/9/28.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "UIView+Border.h"

@implementation UIView (Border)

- (void)borderWith:(CGFloat )width aColor:(UIColor *)borderColor  aRadius:(CGFloat)radius{
    self.layer.borderWidth = width;
    self.layer.borderColor =borderColor?[borderColor CGColor ]:[[UIColor grayColor] CGColor];
    
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = radius > 0;
}



@end
