//
//  ECDTableViewCell.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ETTableViewCell.h"



@protocol MJOrderListCellDelegate <NSObject>

- (void)clickCell:(UIImage *)imgName aTitle:(NSString *)aTitle aReturn:(BOOL) aReturn;

@end




@interface ECDTableViewCell : ETTableViewCell

+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font aWidth:(CGFloat )aWidth;

@end
