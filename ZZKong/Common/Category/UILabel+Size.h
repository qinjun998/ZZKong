//
//  UILabel+Size.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UILabel(Size)


//获得指定宽度的高度
- (CGSize)textSizeWithWidth:(CGFloat )aWidth;

//获得默认全屏宽度下的高度
- (float)expectedHeight;
/**
 *	功能:根据内容动态适应高度
 */
- (void)resizeToFit;

/**
 *	功能:根据内容动态适应宽度
 */
- (void)resizeToStretch;
@end
