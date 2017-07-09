//
//  ETAlertView.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ETAlertView;
/**
 *  alertview点击按钮之后的回调block
 *
 *  @param alertView   对象
 *  @param buttonIndex 点击的button的序号，从0开始
 */
typedef void(^ETAlertViewBlock)(ETAlertView
                                
                                *alertView, NSInteger buttonIndex);

@interface ETAlertView : UIAlertView

@property (nonatomic, copy) ETAlertViewBlock block;

@property (nonatomic, strong) id data;
/**
 *  弹框AlertView（默认有一个标题为确定的按钮）
 *
 *  @param aMessage 内容
 *  @param aBlock   回调block
 *
 *  @return ETAlertView
 */
+ (instancetype)alertWithMessage:(NSString *)aMessage andCompleteBlock:(ETAlertViewBlock)aBlock;
/**
 *  弹框AlertView（默认有一个标题为确定的按钮）
 *
 *  @param aTitle   标题
 *  @param aMessage 内容
 *  @param aBlock   回调block
 *
 *  @return ETAlertView
 */
+ (instancetype)alertWithTitle:(NSString *)aTitle message:(NSString *)aMessage andCompleteBlock:(ETAlertViewBlock)aBlock;
/**
 *  弹框AlertView
 *
 *  @param aTitle       标题
 *  @param aMessage     内容
 *  @param leftBtnName  左按钮标题
 *  @param rightBtnName 右按钮标题
 *  @param aData        保存的数据
 *  @param aBlock       回调block
 *
 *  @return ETAlertView
 */
+ (instancetype)alertWithTitle:(NSString *)aTitle message:(NSString *)aMessage leftBtn:(NSString *)leftBtnName rightBtn:(NSString *)rightBtnName extraData:(id)aData andCompleteBlock:(ETAlertViewBlock)aBlock;
@end
