//
//  ETTableView.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETTableView.h"
#import "ETFuncDefine.h"

#import "ETTableViewCell.h"

//category
#import "NSObject+BeeNotification.h"

#import "ETWeakObjectDeathNotifier.h"

@implementation ETTableView

- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier
{
    UITableViewCell *cell = [super dequeueReusableCellWithIdentifier:identifier];
    
    if ([cell isKindOfClass:[ETTableViewCell class]]) {
        [(ETTableViewCell *)cell setIndexPath:nil];
    }
    
    return cell;
}

- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[ETTableViewCell class]]) {
        [(ETTableViewCell *)cell setIndexPath:indexPath];
    }
    
    return cell;
}

- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated
{
    if (indexPath.section >= self.numberOfSections) {
        return ;
    }
    else if (indexPath.row >= [self numberOfRowsInSection:indexPath.section]) {
        return ;
    }
    else {
        return [super scrollToRowAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
    }
}

- (void)selectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition
{
    if (indexPath.section >= self.numberOfSections) {
        return;
    }
    else if (indexPath.row >= [self numberOfRowsInSection:indexPath.section]) {
        return;
    }
    else {
        return [super selectRowAtIndexPath:indexPath animated:animated scrollPosition:scrollPosition];
    }
}

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section >= self.numberOfSections) {
        return nil;
    }
    else if (indexPath.row >= [self numberOfRowsInSection:indexPath.section]) {
        return nil;
    }
    else {
        return [super cellForRowAtIndexPath:indexPath];
    }
}

- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    NSMutableArray *safeIndexPaths = [[NSMutableArray alloc] initWithArray:indexPaths];
    for (NSIndexPath *indexPath in indexPaths) {
        if ([indexPath isKindOfClass:[NSIndexPath class]]) {
            NSInteger section = indexPath.section;
            NSInteger row = indexPath.row;
            if ((section < 0 || section >= self.numberOfSections) ||
                (row < 0 || row >= [self numberOfRowsInSection:section])) {
                [safeIndexPaths removeObject:indexPath];
            }
        }
        else {
            [safeIndexPaths removeObject:indexPath];
        }
    }
    
    if (safeIndexPaths.count) {
        return [super reloadRowsAtIndexPaths:safeIndexPaths withRowAnimation:animation];
    }
}
- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    NSUInteger lastIndex = sections.lastIndex;
    if (sections == nil) {
        return ;
    }
    else if (lastIndex >= self.numberOfSections) {
        return ;
    }
    else {
        return [super reloadSections:sections withRowAnimation:animation];
    }
}


- (void)deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    NSUInteger lastIndex = sections.lastIndex;
    if (sections == nil) {
        return ;
    }
    else if (lastIndex >= self.numberOfSections) {
        return ;
    }
    else {
        return [super deleteSections:sections withRowAnimation:animation];
    }
}

- (void)insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation
{
    NSUInteger lastIndex = sections.lastIndex;
    if (sections == nil) {
        return ;
    }
    else {
        NSInteger sectionIndex = [self.dataSource numberOfSectionsInTableView:self];
        if (lastIndex >= sectionIndex) {
            return ;
        }
        
        return [super insertSections:sections withRowAnimation:animation];
    }
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}

- (void)setDelegate:(id<UITableViewDelegate>)delegate
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


@end
