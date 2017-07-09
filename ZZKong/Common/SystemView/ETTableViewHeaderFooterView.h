//
//  ETTableViewHeaderFooterView.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETTableViewHeaderFooterView : UITableViewHeaderFooterView

/**
 *  代理
 */
@property (nonatomic, weak) id delegate;

/**
 *  缩进边界
 */
@property (nonatomic) UIEdgeInsets cellEdgeInsets;

/**
 *  功能:获取cell的唯一标识符
 */
+ (NSString *)cellReuseIdentifier;

/**
 *	功能:cell根据数据显示ui
 *
 *	@param aData:cell数据
 */
- (void)updateWithCellData:(id)aData;

/**
 *	功能:获取cell的高度
 *
 *	@param aData:cell的数据
 *
 *	@return
 */
+ (CGFloat)heightForCellData:(id)aData;

@end
