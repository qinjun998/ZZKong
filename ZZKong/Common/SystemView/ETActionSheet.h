//
//  ETActionSheet.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ETActionSheet;
/**
 *  actionSheet点击按钮之后的回调block
 *
 *  @param actionSheet   对象
 *  @param buttonIndex 点击的button的序号，从0开始
 */
typedef void(^ETActionSheetBlock)(ETActionSheet *actionSheet, NSInteger buttonIndex);

@interface ETActionSheet : UIActionSheet

/**
 *  创建action sheet
 *
 *  @param aTitle                  标题
 *  @param aCancelButtonTitle      取消按钮
 *  @param aDestructiveButtonTitle 确定按钮
 *  @param aBlock                  回调block
 *
 *  @return actionSheet
 */
+ (instancetype)actionSheetWithTitle:(NSString *)aTitle cancelButtonTitle:(NSString *)aCancelButtonTitle destructiveButtonTitle:(NSString *)aDestructiveButtonTitle andCompleteBlock:(ETActionSheetBlock)aBlock;

@end
