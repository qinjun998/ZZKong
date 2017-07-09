//
//  ETCollectionView.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETCollectionView.h"
#import "ETFuncDefine.h"

#import "ETCollectionViewCell.h"
#import "ETCollectionReusableView.h"
#import "ETWeakObjectDeathNotifier.h"

//category
#import "NSObject+BeeNotification.h"

@implementation ETCollectionView

- (id)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [super dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[ETCollectionViewCell class]]) {
        [(ETCollectionViewCell *)cell setIndexPath:indexPath];
    }
    
    return cell;
}

- (id)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [super dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[ETCollectionReusableView class]]) {
        [(ETCollectionReusableView *)cell setIndexPath:indexPath];
    }
    
    return cell;
}

- (void)scrollToItemAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated
{
    if (indexPath.section >= [self numberOfSections] || indexPath.item >= [self numberOfItemsInSection:indexPath.section]) {
        return ;
    }
    
    [super scrollToItemAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

- (void)selectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UICollectionViewScrollPosition)scrollPosition
{
    if (indexPath.section >= [self numberOfSections] || indexPath.item >= [self numberOfItemsInSection:indexPath.section]) {
        return ;
    }
    
    [super selectItemAtIndexPath:indexPath animated:animated scrollPosition:scrollPosition];
}
- (void)dealloc
{
    [self unobserveAllNotifications];
}

- (void)setDelegate:(id<UICollectionViewDelegate>)delegate
{
    [super setDelegate:delegate];
    
    if (delegate == nil) {
        return;
    }
    
    ETWeakObjectDeathNotifier *wo = [ETWeakObjectDeathNotifier new];
    [wo setOwner:delegate];
    WEAK_SELF;
    [wo setBlock:^(ETWeakObjectDeathNotifier *sender) {
        STRONG_SELF;
        self.delegate = nil;
        self.dataSource = nil;
    }];
}

- (void)reloadData
{
    [self.collectionViewLayout invalidateLayout];
    [super reloadData];
}


@end
