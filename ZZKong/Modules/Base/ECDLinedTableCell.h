//
//  ECDLinedTableCell.h
//  ZZKong
//
//  Created by lee on 2017/3/28.
//  Copyright © 2017年 ZZKong. All rights reserved.
//

#import "ETTableViewCell.h"

@interface ECDLinedTableCell : ETTableViewCell

@property (nonatomic, strong) UIView    *topLine;
@property (nonatomic, strong) UIView    *bottomLine;

-(void)doInit1;

@end
