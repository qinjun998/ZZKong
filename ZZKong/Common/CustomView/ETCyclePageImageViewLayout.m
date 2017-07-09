//
//  ETCyclePageImageViewLayout.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETCyclePageImageViewLayout.h"

@implementation ETCyclePageImageViewLayout

- (instancetype)init
{
    if (self = [super init]) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing = 0;
    }
    return self;
}

- (CGSize)itemSize
{
    return self.collectionView.bounds.size;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    [self invalidateLayout];
    return YES;
}



@end
