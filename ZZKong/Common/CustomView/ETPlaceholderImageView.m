//
//  ETPlaceholderImageView.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETPlaceholderImageView.h"
#import "UIView+create.h"

@interface ETPlaceholderImageView ()

@property (nonatomic, strong) UIImageView *placeholder;

@end

@implementation ETPlaceholderImageView

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupView];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupView];
    }
    
    return self;
}

- (void)setupView
{
    self.placeholder = [UIImageView autolayoutView];
    [self addSubview:self.placeholder];
    
    self.placeholder.image = [UIImage imageNamed:@"loadingimg"];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholder attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholder attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.f constant:0.f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholder attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.f constant:0.f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholder attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.f constant:0.f]];
}

- (void)setImage:(UIImage *)image
{
    [super setImage:image];
    self.placeholder.hidden = (self.image ? YES : NO);
}

@end
