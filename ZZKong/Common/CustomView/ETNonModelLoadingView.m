//
//  ETNonModelLoadingView.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ETNonModelLoadingView.h"
#import "UIView+Extension.h"

#define kWidth 80
#define kHeight 80

@implementation ETNonModelLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [self.layer setCornerRadius:10.0];
        
        UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [activity startAnimating];
        [self addSubview:activity];
        activity.centerX = self.width / 2.0f;
        activity.centerY = self.height / 2.0f;
        
    }
    return self;
}

+ (instancetype)showLoadingAddedTo:(UIView *)view animated:(BOOL)animated
{
    ETNonModelLoadingView *loadingView = [[self alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    loadingView.centerX = view.width / 2.0f;
    loadingView.centerY = view.height / 2.0f;
    [view addSubview:loadingView];
    
    loadingView.alpha = 0.f;
    if (animated) {
        [UIView animateWithDuration:.3f animations:^{
            loadingView.alpha = 1.f;
        }];
    }
    else {
        loadingView.alpha = 1.0;
    }
    return loadingView;
}

+ (void)hideLoadingForView:(UIView *)view animated:(BOOL)animated
{
    NSMutableArray *viewsToRemove = [NSMutableArray array];
    
    for (UIView *v in [view subviews]) {
        if ([v isKindOfClass:[ETNonModelLoadingView class]]) {
            [viewsToRemove addObject:v];
        }
    }
    
    for (ETNonModelLoadingView *loadingView in viewsToRemove){
        if (animated) {
            
            [UIView animateWithDuration:.3f animations:^{
                loadingView.alpha = 0.0;
            } completion:^(BOOL finished) {
                [loadingView removeFromSuperview];
            }];
        }
        else {
            loadingView.alpha = 0.0;
            [loadingView removeFromSuperview];
        }
        
    }
}

@end
