//
//  ETTabView.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ETTabView;

@protocol ETTabViewDelegate <NSObject>

- (void)tabView:(ETTabView *)aTabView changeToIndex:(int)aIndex;

@end

@interface ETTabView : UIView

@property(nonatomic, assign) NSInteger currentIndex;
@property(nonatomic, strong) UIView* backgroundView;

@property(nonatomic, strong) NSMutableArray* imageViews;

@property(nonatomic, strong) NSArray *normalImages;
@property(nonatomic, strong) NSArray *selImages;

@property(nonatomic, strong) NSMutableArray* labels;
@property(nonatomic, assign) CGSize imageSize;

@property(nonatomic, assign) BOOL imageSizeToFit; //

@property(nonatomic, weak) id<ETTabViewDelegate> delegate;
@property(nonatomic, copy) NSString *imgBundleName;

- (id)initWithFrame:(CGRect)frame
              texts:(NSArray *)aArray
              color:(UIColor *)aColor
               font:(UIFont *)aFont
       normalImages:(NSArray *)bArray
          selImages:(NSArray *)cArray;

/**
 *  功能:更新View的label的文字内容
 */
- (void)updateWithTextAry:(NSArray *)aTextAry;

/**
 *  功能:选中某个tab
 */
- (void)selectIndex:(NSInteger)index;


@end
