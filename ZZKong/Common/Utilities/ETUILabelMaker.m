//
//  ETUILabelMaker.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ETUILabelMaker.h"

@interface ETUILabelMaker()

@property(nonatomic, strong)UILabel *label;

@end
@implementation ETUILabelMaker

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization
{
    self.backgroundColor = [UIColor clearColor];
    self.fontSize = [UIFont systemFontSize];
    self.numberOfLines = 1;
}

- (instancetype)initWithView:(UIView *)aView
{
    self = [super initWithView:aView];
    if (self) {
        [self initialization];
        if ([aView isKindOfClass:[UILabel class]]) {
            self.label = (UILabel*)aView;
        }
    }
    return self;
}

- (void)install
{
    [super install];
    [self.label setFont:[UIFont systemFontOfSize:self.fontSize]];
    self.label.numberOfLines = self.numberOfLines;
    self.label.textColor = self.textColor;
}


@end
