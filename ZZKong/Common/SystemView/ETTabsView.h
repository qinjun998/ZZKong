//
//  JPTabsView.h
//  DymIOSApp
//
//  Created by Dong Yiming on 15/10/22.
//  Copyright (c) 2015年 Dong Yiming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETTabsView : UIView

@property (nonatomic, readonly) NSInteger tabCount;

@property (nonatomic, readonly) CGFloat buttonWidth;

@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, copy) dispatch_block_t indexChangedBlock;
@property (nonatomic, copy) dispatch_block_t buttonClickBlock;

-(void)setTitles:(NSArray *)titles normalImages:(NSArray *)normalImages selectedImages:(NSArray *)selectedImages;

-(void)setIndicatorLeadingOffset:(CGFloat)leadingOffset;

-(void)setTitles:(NSArray *)titles;
@end
