//
//  ETCircleTouchImageView.m
//  ZZKong
//
//  Created by lee on 2016/11/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETCircleTouchImageView.h"
#import "NSObject+BeeNotification.h"

@implementation ETCircleTouchImageView

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self doInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
              [self doInit];
    }
    return self;
}

-(void) doInit{
        self.userInteractionEnabled = YES;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}


-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL flag = [super pointInside:point withEvent:event];
    if (flag) {
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
        if ([path containsPoint:point]) {
            return YES;
        }
        return NO;
    }
    return NO;
}


- (void)dealloc
{
    [self unobserveAllNotifications];
}

@end
