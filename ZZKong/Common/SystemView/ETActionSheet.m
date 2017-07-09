//
//  ETActionSheet.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETActionSheet.h"
//category
#import "NSObject+BeeNotification.h"

@interface ETActionSheet () <UIActionSheetDelegate>

@property (nonatomic, copy) ETActionSheetBlock block;

@end

@implementation ETActionSheet

+ (instancetype)actionSheetWithTitle:(NSString *)aTitle cancelButtonTitle:(NSString *)aCancelButtonTitle destructiveButtonTitle:(NSString *)aDestructiveButtonTitle andCompleteBlock:(ETActionSheetBlock)aBlock
{
    if (!aCancelButtonTitle) {
        aCancelButtonTitle = @"取消";
    }
    
    if (!aDestructiveButtonTitle) {
        aDestructiveButtonTitle = @"确定";
    }
    
    ETActionSheet *actionSheet = [[self alloc] initWithTitle:aTitle delegate:nil cancelButtonTitle:aCancelButtonTitle destructiveButtonTitle:aDestructiveButtonTitle otherButtonTitles:nil];
    
    actionSheet.delegate = actionSheet;
    actionSheet.block = aBlock;
    
    return actionSheet;
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.block) {
        self.block((ETActionSheet *)actionSheet, buttonIndex);
    }
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}

@end
