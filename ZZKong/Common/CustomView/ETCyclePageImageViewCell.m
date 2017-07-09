//
//  ETCyclePageImageViewCell.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETCyclePageImageViewCell.h"

#import "ETConstraintHelper.h"
//category
#import "UIView+create.h"


@interface ETCyclePageImageViewCell ()

@property (nonatomic, strong) ETPlaceholderImageView *imageView;

@end

@implementation ETCyclePageImageViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView = [ETPlaceholderImageView autolayoutView];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
        [self.contentView addSubview:self.imageView];
        [ETConstraintHelper setView:self.imageView fullAsSuperview:self.contentView];
    }
    return self;
}

- (void)updateWithImageUrlString:(NSString *)aUrlString andClickBlock:(ETBlockImageViewClickBlock)aBlock andImageNilBlock:(ETBlockImageViewClickBlock)bBlock
{
    [self.imageView setBlock:^(ETBlockImageView *sender) {
        aBlock(sender);
    }];
    
    if (aUrlString) {
        if (self.contentView.bounds.size.width && self.contentView.bounds.size.height) {
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:aUrlString] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (error) {
                    [self.imageView sd_setImageWithURL:[NSURL URLWithString:aUrlString]];
                    bBlock(nil);
                }
            }];
        }
        else {
            self.imageView.image = nil;
            bBlock(nil);
        }
    }else{
        bBlock(nil);
    }
}

- (void)updateWithImageUrlString:(NSString *)aUrlString andClickBlock:(ETBlockImageViewClickBlock)aBlock
{
    
    [self.imageView setBlock:^(ETBlockImageView *sender) {
        aBlock(sender);
    }];
    
    if (aUrlString) {
        if (self.contentView.bounds.size.width && self.contentView.bounds.size.height) {
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:aUrlString] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (error) {
                    [self.imageView sd_setImageWithURL:[NSURL URLWithString:aUrlString]];
                }
            }];
        }
        else {
            self.imageView.image = nil;
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
