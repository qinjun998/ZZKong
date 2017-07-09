//
//  ECDLinedTableCell.m
//  ZZKong
//
//  Created by lee on 2017/3/28.
//  Copyright © 2017年 ZZKong. All rights reserved.
//

#import "ECDLinedTableCell.h"

@implementation ECDLinedTableCell


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self doInit1];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self doInit1];
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self doInit1];
    }
    return self;
}

-(void)doInit1 {
    
    ///
    _topLine = [UIView new];
    _topLine.backgroundColor =  UIColorFromRGB(0xeaeef9);
    [self.contentView addSubview:_topLine];
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.and.top.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    _topLine.hidden = YES;
    
    
    ///
    _bottomLine = [UIView new];
    _bottomLine.backgroundColor =  UIColorFromRGB(0xeaeef9);
    [self.contentView addSubview:_bottomLine];
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.and.bottom.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
}


@end
