//
//  ETCollectionViewCell.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETCollectionViewCell : UICollectionViewCell

/**
 *  index
 */
@property (nonatomic, strong) NSIndexPath *indexPath;

/**
 *  代理
 */
@property (nonatomic, weak) id delegate;

/**
 *  功能:获取cell的唯一标识符
 */
+ (NSString *)cellReuseIdentifier;

/**
 *  功能:获取cell对应的xib
 */
+ (UINib *)nib;

/**
 *	功能:cell根据数据显示ui
 *
 *	@param aData:cell数据
 */
- (void)updateWithCellData:(id)aData;

/**
 *	功能:cell根据数据和位置显示ui
 *
 *	@param aData:cell数据
 *	@param indexPath:cell位置
 */
- (void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath;

/**
 *	功能:获取cell的大小
 *
 *	@param aData:cell的数据
 *
 *	@return
 */
+ (CGSize)sizeForCellData:(id)aData;



@end
