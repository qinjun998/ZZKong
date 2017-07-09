//
//  UIImageView+LoadingIndicator.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIImageView (LoadingIndicator)

- (void)et_setImageWithURL:(NSURL *)url
                showLoading:(BOOL)showLoading
             indicatorStype:(UIActivityIndicatorViewStyle)style
           placeholderImage:(UIImage *)image
                    options:(SDWebImageOptions)options;

@end
