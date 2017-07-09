//
//  AspectFitImageView.m
//  ZZKong

//   http://www.jianshu.com/p/9526a976b2e9
//  Autolayout下UIImageView设置Aspect Fit上下留白问题

//  Created by lee on 2017/3/22.
//  Copyright © 2017年 ZZKong. All rights reserved.
//

#import "AspectFitImageView.h"

@implementation AspectFitImageView

- (CGSize)intrinsicContentSize {
    CGSize s =[super intrinsicContentSize];
    s.height = self.frame.size.width / self.image.size.width  * self.image.size.height;
    return s;
}

@end
