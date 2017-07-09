//
//  ETVerticalButton.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ETVerticalButton.h"
#import <Masonry/Masonry.h>
#import "UIColor+Base.h"
#import "UIImage+tool.h"


@interface ETVerticalButton ()

@end

@implementation ETVerticalButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self doInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self doInit];
    }
    return self;
}

-(void)doInit {
    
    [self setBackgroundImage:[UIImage imageWithColor:[UIColor colorWhiteHighlighted]] forState:UIControlStateHighlighted];
    
    _ivLogo = [[UIImageView alloc] initWithImage:nil];
    [self addSubview:_ivLogo];
    [_ivLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(-10);
        make.width.equalTo(@48);
        make.height.equalTo(_ivLogo.mas_width);
    }];
    
    _lblTitle = [[UILabel alloc] init];
    _lblTitle.font = [UIFont systemFontOfSize:14];
    _lblTitle.textColor = [UIColor colorGrayDark];
    [self addSubview:_lblTitle];
    [_lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.ivLogo.mas_bottom).offset(5);
    }];
    
}


@end
