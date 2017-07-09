//
//  ETVerticalButton.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ETIconTextButton.h"
#import "UIColor+Base.h"


@implementation ETIconTextButton

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self doInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self doInit];
    }
    return self;
}

-(void)doInit {
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorMajor] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor colorMajor] forState:UIControlStateSelected];
}

@end
