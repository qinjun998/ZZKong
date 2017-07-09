//
//  UIButton+Expand.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ETUIButtonLayoutStyle) {
	ETImageLeftTitleRightStyle = 0, //默认的方式 image左 title右
	ETTitleLeftImageRightStyle = 1, // image右,title左
	ETImageTopTitleBottomStyle = 2, //image上，title下
	ETTitleTopImageBottomStyle = 3, // image下,title上
};
@interface UIButton(Expand)

/**
 *	功能:设置UIButton的布局，图片和文字按照指定方向显示
 *
 *	@param aLayoutStyle:参见ETUIButtonLayoutStyle
 *	@param aSpacing:图片和文字之间的间隔
 */
- (void)setLayout:(ETUIButtonLayoutStyle )aLayoutStyle
		  spacing:(CGFloat)aSpacing;
@end
