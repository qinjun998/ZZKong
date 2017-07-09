//
//  ETAlertView.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETAlertView.h"
@interface ETAlertView () <UIAlertViewDelegate>


@end

@implementation ETAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (instancetype)alertWithMessage:(NSString *)aMessage andCompleteBlock:(ETAlertViewBlock)aBlock
{
    return [self alertWithTitle:nil message:aMessage andCompleteBlock:aBlock];
}

+ (instancetype)alertWithTitle:(NSString *)aTitle message:(NSString *)aMessage andCompleteBlock:(ETAlertViewBlock)aBlock
{
    return [self alertWithTitle:aTitle message:aMessage leftBtn:@"确定" rightBtn:nil extraData:nil andCompleteBlock:aBlock];
}

+ (instancetype)alertWithTitle:(NSString *)aTitle message:(NSString *)aMessage leftBtn:(NSString *)leftBtnName rightBtn:(NSString *)rightBtnName extraData:(id)aData andCompleteBlock:(ETAlertViewBlock)aBlock
{
    if (!leftBtnName) {
        leftBtnName = @"确定";
    }
    
    if (!aTitle) {
        aTitle = @"";
    }
    
    ETAlertView *alertView = nil;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        alertView = [[ETAlertView alloc] init];
        
        alertView.data = aData;
        alertView.block = aBlock;
        alertView.delegate = alertView;
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:aTitle message:aMessage preferredStyle:UIAlertControllerStyleAlert];
        
        if (leftBtnName) {
            UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:leftBtnName style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                if (aBlock) {
                    aBlock(alertView,0);
                }
            }];
            [alertController addAction:cancelButton];
        }
        
        if (rightBtnName) {
            UIAlertAction *okButton = [UIAlertAction actionWithTitle:rightBtnName style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                if (aBlock) {
                    aBlock(alertView,1);
                }
            }];
            
            [alertController addAction:okButton];
        }

//        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
        
        [[[ETAlertView window] rootViewController] presentViewController:alertController animated:YES completion:nil];

        return nil;
    } else {
        alertView = [[self alloc] initWithTitle:aTitle message:aMessage delegate:nil cancelButtonTitle:leftBtnName otherButtonTitles:nil];
        
        alertView.delegate = alertView;
        
        if (rightBtnName) {
            [alertView addButtonWithTitle:rightBtnName];
        }
        
        alertView.data = aData;
        alertView.block = aBlock;
        alertView.delegate = alertView;
    }
    
    return alertView;
}

+ (UIWindow *) window {

    UIWindow *window = nil;
    if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(window)]) {
        window = [[UIApplication sharedApplication].delegate window];
    }
    // For keyboard
    for (UIWindow *seprateWindow in [UIApplication sharedApplication].windows) {
        if (![[seprateWindow class] isEqual:[UIWindow class]]) {
            window = seprateWindow;
            break;
        }
    }
    
    if (window == nil) {
        window = [UIApplication sharedApplication].keyWindow;
    }
    
    return window;
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(ETAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.block) {
        self.block(alertView,buttonIndex);
    }
    
    self.block = nil;
}

@end
