//
//  ETNonModelLoadingView.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ETView.h"

@interface ETNonModelLoadingView : ETView

+ (instancetype)showLoadingAddedTo:(UIView *)view animated:(BOOL)animated;

+ (void)hideLoadingForView:(UIView *)view animated:(BOOL)animated;


@end
