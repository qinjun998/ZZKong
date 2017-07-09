//
//  ETStretchableButton.m
//  ZZKong
//
//  Created by lee on 16/9/21.
//  Copyright © 2016年 ZZKong. All rights reserved.


//  未完成

#import "ETStretchableButton.h"

@implementation ETStretchableButton

//@property (nonatomic, strong) NSString *bgImageName;

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
    
}

@end
