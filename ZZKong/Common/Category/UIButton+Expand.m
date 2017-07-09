//
//  UIButton+Expand.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "UIButton+Expand.h"

@implementation UIButton(Expand)

- (void)setLayout:(ETUIButtonLayoutStyle )aLayoutStyle
		  spacing:(CGFloat)aSpacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;

    CGFloat totalHeight = (imageSize.height + titleSize.height + aSpacing);
	UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
	UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;
	if (aLayoutStyle == ETImageLeftTitleRightStyle) {
		imageEdgeInsets = UIEdgeInsetsMake(0, -(aSpacing / 2.0f), 0, 0 );
		titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, - (aSpacing / 2.0f));
	}
	else if (aLayoutStyle == ETTitleLeftImageRightStyle) {
		imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -(titleSize.width * 2 + aSpacing / 2.0f));
		titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize.width * 2 + aSpacing / 2.0f), 0, 0);
	}else if (aLayoutStyle == ETImageTopTitleBottomStyle){
		imageEdgeInsets = UIEdgeInsetsMake( -(totalHeight - imageSize.height),
										   0.0,
										   0.0,
										   - titleSize.width);
		titleEdgeInsets  = UIEdgeInsetsMake(0.0,
											-imageSize.width,
											- (totalHeight - titleSize.height),
											0.0);
	}else if (aLayoutStyle == ETTitleTopImageBottomStyle){
		imageEdgeInsets = UIEdgeInsetsMake(0.0,
										   0.0,
										   -(totalHeight - imageSize.height),
										   - titleSize.width);

		titleEdgeInsets = UIEdgeInsetsMake(-(totalHeight - titleSize.height),
										   0.0,
										   -imageSize.width,
										   0.0);
	}
    
    if (!UIEdgeInsetsEqualToEdgeInsets(self.imageEdgeInsets, imageEdgeInsets)
        || !UIEdgeInsetsEqualToEdgeInsets(self.titleEdgeInsets, titleEdgeInsets)) {
        self.imageEdgeInsets = imageEdgeInsets;
        self.titleEdgeInsets = titleEdgeInsets;
        [self layoutIfNeeded];
    }
	
}

@end
