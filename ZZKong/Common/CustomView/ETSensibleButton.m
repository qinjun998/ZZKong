//
//  ETSensibleButton.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ETSensibleButton.h"

@implementation ETSensibleButton


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
    _expandRatio = 0.3;
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect expandRect = CGRectInset(self.bounds, -self.bounds.size.width * _expandRatio, -self.bounds.size.height * _expandRatio);
    if (CGRectContainsPoint(expandRect, point)) {
        return self;
    }
    
    return nil;
}



@end
