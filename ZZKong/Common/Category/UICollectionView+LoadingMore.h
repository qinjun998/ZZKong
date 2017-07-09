//
//  UICollectionView+LoadingMore.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (LoadingMore)

- (void)showLoadingMore;

- (void)stopLoadingMore;

- (BOOL)isLoading;

@end
