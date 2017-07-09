//
//  UIView+loading.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "UIView+loading.h"

#import "MBProgressHUD.h"

#import "ETNonModelLoadingView.h"

@implementation UIView (loading)

#pragma mark - loading

- (void)showLoading
{
    [self showLoadingWithMessage:nil];
}

- (void)showLoadingWithMessage:(NSString *)message
{
    [self showLoadingWithMessage:message hideAfter:0];
}

- (void)showLoadingWithMessage:(NSString *)message hideAfter:(NSTimeInterval)second
{
    [self showLoadingWithMessage:message onView:self hideAfter:second];
}

- (void)showLoadingWithMessage:(NSString *)message onView:(UIView *)aView hideAfter:(NSTimeInterval)second
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:aView animated:YES];
    
    if (message) {
        hud.labelText = message;
        hud.mode = MBProgressHUDModeText;
    }
    else {
        hud.mode = MBProgressHUDModeIndeterminate;
    }
    
    if (second > 0) {
        [hud hide:YES afterDelay:second];
    }
}

- (void)hideLoading
{
    [self hideLoadingOnView:self];
}

- (void)hideLoadingOnView:(UIView *)aView
{
    [MBProgressHUD hideAllHUDsForView:aView animated:YES];
}

- (void)showNonModelLoading
{
    [ETNonModelLoadingView showLoadingAddedTo:self animated:YES];
}

- (void)hideNonModelLoading
{
    [ETNonModelLoadingView hideLoadingForView:self animated:YES];
}

@end
