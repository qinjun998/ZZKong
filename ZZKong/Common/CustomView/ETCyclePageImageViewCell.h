//
//  ETCyclePageImageViewCell.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETCollectionViewCell.h"
#import "ETPlaceholderImageView.h"


@interface ETCyclePageImageViewCell : ETCollectionViewCell

@property (nonatomic, readonly) ETPlaceholderImageView *imageView;

- (void)updateWithImageUrlString:(NSString *)aUrlString andClickBlock:(ETBlockImageViewClickBlock)aBlock;

- (void)updateWithImageUrlString:(NSString *)aUrlString andClickBlock:(ETBlockImageViewClickBlock)aBlock andImageNilBlock:(ETBlockImageViewClickBlock)bBlock;


@end
