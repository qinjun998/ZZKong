//
//  ECDTabBarItem.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ECDTabBarItem.h"

@implementation ECDTabBarItemVO

@end

@interface ETTabBarItem ()

@property (nonatomic, strong) UIImageView *background;

@end

@implementation ECDTabBarItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textColor = UIColorFromRGB(0x686868);
        self.imageInsets = UIEdgeInsetsMake(0, 0, 6, 0);
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        self.titleLabel.textColor = UIColorFromRGB(0x409dea);
    }
    else {
        self.titleLabel.textColor = UIColorFromRGB(0x686868);
    }
}

- (void)setDefaultVO:(ECDTabBarItemVO *)defaultVO
{
    _defaultVO = defaultVO;
    self.title = _defaultVO.title;
    self.image = _defaultVO.image;
    self.selectedImage = _defaultVO.selectedImage;
    self.hostString = _defaultVO.hostString;
}


@end

@implementation UITabBarItem (ECDTabBarItem)

- (void)setTitle:(NSString *)title
{
    
}

@end
