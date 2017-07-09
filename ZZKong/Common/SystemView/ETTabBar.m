//
//  ETTabBar.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETTabBar.h"
#import "ETTabBarItem.h"
//tool
#import "ETLog.h"
#import "ETConstraintHelper.h"
//category
#import "UIView+create.h"

@interface ETTabBar () <ETTabBarItemDelegate>

@property (nonatomic, copy) NSArray *items;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation ETTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    self.backgroundView = [UIImageView viewWithFrame:CGRectZero];
    [self addSubview:self.backgroundView];
    [ETConstraintHelper setView:self.backgroundView fullAsSuperview:self];
    
    self.backgroundImageView = [UIImageView viewWithFrame:CGRectZero];
    [self.backgroundView addSubview:self.backgroundImageView];
    [ETConstraintHelper setView:self.backgroundImageView fullAsSuperview:self.backgroundView];
}

- (void)__resizeItems
{
    for (ETTabBarItem *item in _items) {
        item.tag = [_items indexOfObject:item];
        [self addSubview:item];
        item.delegate = self;
        
        item.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.f constant:0.f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.f constant:0.f]];
    }
    
    [ETConstraintHelper setViews:self.items equalToSuperview:self isHorizontal:YES];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    self.backgroundImageView.image = backgroundImage;
}

- (void)setItems:(NSArray *)items
{
    for (id object in items) {
        if (![object isKindOfClass:[ETTabBarItem class]]) {
            ETLogE(@"%@ is not kind of ETTabBarItem",object);
            return ;
        }
    }
    
    [_items makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    _items = [items copy];
    
    self.selectedItem = _items[0];
    
    [self __resizeItems];
}

- (void)setSelectedItem:(ETTabBarItem *)selectedItem
{
    if (_selectedItem == selectedItem) {
        _selectedItem.selected = YES;
        return ;
    }
    
    _selectedItem.selected = NO;
    _selectedItem = selectedItem;
    _selectedItem.selected = YES;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [self.delegate customTabBar:self didSelectItem:_items[selectedIndex]];
}

- (NSUInteger)selectedIndex
{
    return self.selectedItem.tag;
}

#pragma mark - ETTabBarItem delegate
- (void)tabBarItemDidSelectItem:(ETTabBarItem *)item
{
    [self.delegate customTabBar:self didSelectItem:item];
}


@end
