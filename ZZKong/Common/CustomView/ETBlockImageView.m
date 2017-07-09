//
//  ETBlockImageView.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETBlockImageView.h"
@interface ETBlockImageView ()

@property (nonatomic, copy) ETBlockImageViewClickBlock clickBlock;

@end

@implementation ETBlockImageView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.userInteractionEnabled = NO;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPressedImageView:)];
    [self addGestureRecognizer:tap];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPressedImageView:)];
        [self addGestureRecognizer:tap];
    }
    
    return self;
}

- (void)onPressedImageView:(ETBlockImageView *)sender;
{
    if (self.clickBlock) {
        self.clickBlock(self);
    }
}

- (void)setBlock:(ETBlockImageViewClickBlock)block
{
    self.clickBlock = block;
    if (self.clickBlock) {
        self.userInteractionEnabled = YES;
    }
    else {
        self.userInteractionEnabled = NO;
    }
}

@end
