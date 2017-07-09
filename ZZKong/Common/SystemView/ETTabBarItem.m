//
//  ETTabBarItem.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETTabBarItem.h"
#import "UIView+create.h"
#import "ETColor.h"
#import "UIColor+Base.h"

@interface ETTabBarItem ()

@property (nonatomic, strong) UIImageView *background;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *badgeLabel;
@property (nonatomic, strong) UIView *indicateView;
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *separatorLine;

@property (nonatomic, strong) NSLayoutConstraint *hConstraint;
@property (nonatomic, strong) NSLayoutConstraint *vConstraint;

@end

@implementation ETTabBarItem

- (UIView *)topLine{
    if (!_topLine) {
        _topLine = [UIView newAutoLayoutView];
        _topLine.backgroundColor = [UIColor colorMajor];
        _topLine.hidden = YES;
    }
    return _topLine;
}

- (UIView *)separatorLine{
    if (!_separatorLine) {
        _separatorLine = [UIView newAutoLayoutView];
        _separatorLine.backgroundColor = UIColorFromRGB(0xd2d2d2);
        _separatorLine.hidden = NO;
    }
    return _separatorLine;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.imageInsets = UIEdgeInsetsZero;
        [self _ETTabBarItem_setupViews];
        
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPressTabbarItem)];
        [self addGestureRecognizer:ges];
    }
    return self;
}

- (void)_ETTabBarItem_setupViews
{
    
   [self addSubview:self.topLine];
   [self.topLine autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 46, 0)];
    
    [self addSubview:self.separatorLine];
  // [self.separatorLine autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 2)];
    

    [self.separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self).offset(20);
        make.bottom.equalTo(self).offset(-15);
        make.leading.equalTo(self);
        make.width.equalTo(@0.5);
    }];
 /*   */
    
    self.background = [UIImageView viewWithFrame:CGRectZero];
    self.background.backgroundColor = [UIColor clearColor];
//    self.background.contentMode = UIViewContentModeScaleToFill;
    self.background.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:self.background];
    
    self.background.translatesAutoresizingMaskIntoConstraints = NO;
    self.hConstraint = [NSLayoutConstraint constraintWithItem:self.background attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f];
    [self addConstraint:self.hConstraint];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.background attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:20.f]];
    
    self.vConstraint = [NSLayoutConstraint constraintWithItem:self.background attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.f constant:0.f];
    [self addConstraint:self.vConstraint];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.background attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:20.f]];
    
    self.titleLabel = [UILabel viewWithFrame:CGRectZero];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = [UIFont systemFontOfSize:10.f];
    self.titleLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:.6];
    [self addSubview:self.titleLabel];
    
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.f constant:-4.f]];
    
    self.badgeLabel = [UILabel viewWithFrame:CGRectZero];
    self.badgeLabel.textAlignment = NSTextAlignmentCenter;
    self.badgeLabel.textColor = [UIColor whiteColor];
//    self.badgeLabel.backgroundColor = [ETColor colorWithRGB:0xff3c25];
    self.badgeLabel.backgroundColor = [ETColor colorWithRGB:0xffb400];
    self.badgeLabel.font = [UIFont systemFontOfSize:12.f];
    self.badgeLabel.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.badgeLabel.adjustsFontSizeToFitWidth = YES;
    self.badgeLabel.clipsToBounds = YES;
    self.badgeLabel.layer.cornerRadius = 7.f;
    self.badgeLabel.hidden = YES;
    [self addSubview:self.badgeLabel];
    
    self.indicateView = [UIView autolayoutView];
    self.indicateView.backgroundColor = [ETColor colorWithRGB:0xff3c25];
    self.indicateView.clipsToBounds = YES;
    self.indicateView.layer.cornerRadius = 4.f;
    self.indicateView.hidden = YES;
    [self addSubview:self.indicateView];
    
    self.badgeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.badgeLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.f constant:3.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.badgeLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.f constant:5.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.badgeLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:14.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.badgeLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:14.f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicateView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:8.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicateView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:8.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicateView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.f constant:-14.f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicateView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.f constant:6]];
}

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    ETTabBarItem *item = [self viewWithFrame:CGRectZero];
    
    item.title = title;
    item.image = image;
    item.selectedImage = selectedImage;
    
    return item;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self _ETTabBarItem_resizeViews];
}

- (void)setImageInsets:(UIEdgeInsets)imageInsets
{
    _imageInsets = imageInsets;
    [self _ETTabBarItem_resizeViews];
}

- (void)_ETTabBarItem_resizeViews
{
    self.hConstraint.constant = self.imageInsets.left - self.imageInsets.right;
    self.vConstraint.constant = self.imageInsets.top - self.imageInsets.bottom;
}

- (void)setTitle:(NSString *)title
{
    if (title) {
        _title = title;
        self.titleLabel.text = _title;
    }else{
        self.imageInsets = UIEdgeInsetsMake(10, 0, 9, 0);
    }
    
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = badgeValue;
    self.badgeLabel.text = _badgeValue;
    self.badgeLabel.hidden = !_badgeValue;
    
    if (_showIndicate && self.badgeLabel.hidden) {
        self.indicateView.hidden = NO;
    }
    else {
        self.indicateView.hidden = YES;
    }
}

- (void)setShowIndicate:(BOOL)showIndicate
{
    _showIndicate = showIndicate;
    
    if (_showIndicate && self.badgeLabel.hidden) {
        self.indicateView.hidden = NO;
    }
    else {
        self.indicateView.hidden = YES;
    }
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    if (!self.isSelected) {
        self.background.image = _image;
    }
}

- (void)setSelectedImage:(UIImage *)selectedImage
{
    _selectedImage = selectedImage;
    if (self.isSelected) {
        self.background.image = _selectedImage;
    }
}

- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    self.background.image = selected ? self.selectedImage : self.image;
    
    self.topLine.hidden = selected ?NO:YES;
}

- (void)onPressTabbarItem
{
    if ([self.delegate respondsToSelector:@selector(tabBarItemDidSelectItem:)]) {
        [self.delegate tabBarItemDidSelectItem:self];
    }
}

@end
