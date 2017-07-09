//
//  ECDTableViewCell.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ECDTableViewCell.h"

@implementation ECDTableViewCell

+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font aWidth:(CGFloat )aWidth{
    CGSize maxSize = CGSizeMake(aWidth, MAXFLOAT);
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
}

@end
