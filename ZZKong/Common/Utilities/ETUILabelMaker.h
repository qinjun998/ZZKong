//
//  ETUILabelMaker.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETViewMaker.h"


@interface ETUILabelMaker : ETViewMaker

@property(nonatomic, strong)UIColor *textColor;

/**
 *  UILabel的字体大小,默认的是[UIFont systemFontSize]
 */
@property(nonatomic, assign)CGFloat fontSize;

/**
 *  UILabel的行数，0表示支持多行，默认是1行
 */
@property(nonatomic) NSInteger numberOfLines;

@end
