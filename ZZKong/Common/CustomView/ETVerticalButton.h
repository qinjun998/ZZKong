//
//  ETVerticalButton.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import <UIKit/UIKit.h>

/// 图片在上，文字在下的按钮
@interface ETVerticalButton : UIButton


@property (strong, nonatomic)  UIImageView  *ivLogo;
@property (strong, nonatomic)  UILabel      *lblTitle;

@end
