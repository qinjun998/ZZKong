//
//  UIView+Plus.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (Plus)

/**
 *  取消第一响应
 */
- (void)resignAllResonders;

/**
 *	功能:删除view的某种子视图
 *
 *	@param aClass :要被删除子视图类
 */
-(void)removeAllSubsWithClass:(Class)aClass;

/**
 *	功能:获取某种类型的子视图
 *
 *	@param aClass :子视图类型
 *
 *	@return
 */
- (NSArray *)subViewsWithClass:(Class)aClass;

/**
 *	功能:在当前view里面现实laoding信息
 *
 *	@param aMessage:现实的信息内容
 */
- (void)showLoadingWithMessage:(NSString *)aMessage;

/**
 *	功能:隐藏当前view里面的loading信息
 */
- (void)hideLoading;
@end
