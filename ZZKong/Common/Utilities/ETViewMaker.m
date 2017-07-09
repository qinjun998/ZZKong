//
//  ETViewMaker.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETViewMaker.h"

@interface ETViewMaker()

@property(nonatomic, strong)UIView *view;

@end
@implementation ETViewMaker

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame  = CGRectZero;
        self.bounds = CGRectZero;
        self.isAutoLayout = YES;
        self.borderColor = [UIColor blackColor];
        self.borderWidth = 0;
        self.cornerRadius = 0;
    }
    return self;
}

- (instancetype)initWithView:(UIView *)aView
{
    self = [self init];
    if (self) {
        self.view = aView;
    }
    return self;
}

- (void)install
{
    if (self.isAutoLayout) {
        self.view.frame = CGRectZero;
        self.view.translatesAutoresizingMaskIntoConstraints = NO;
    }else{
        self.view.frame = self.frame;
        self.view.bounds = self.bounds;
    }
    
    self.view.backgroundColor = self.backgroundColor;
    self.view.layer.cornerRadius = self.cornerRadius;
    self.view.layer.borderWidth = self.borderWidth;
    self.view.layer.borderColor = self.borderColor.CGColor;
}

@end
