//
//  ETCyclePageImageView.h
//  ZZKong
//  轮播存在问题
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ETView.h"
@class ETCyclePageImageView,ETPageControl;

@protocol ETCyclePageImageViewDataSource <NSObject>

@required
/**
 *  轮播图数量
 *
 *  @param aPageView
 *
 *  @return
 */
- (NSUInteger)numberOfPagesInPageView:(ETCyclePageImageView *)aPageView;
/**
 *  轮播图view
 *
 *  @param aPageView self
 *  @param aIndex    次序
 *
 *  @return
 */
- (NSString *)pageView:(ETCyclePageImageView *)aPageView imageUrlStringAtIndex:(NSUInteger)aIndex;

@optional

- (NSArray *)adsOfPageView:(ETCyclePageImageView *)aPageView;

@end

@protocol ETCyclePageImageViewDelegate <NSObject>

@optional
/**
 *  点击事件
 *
 *  @param aPageView
 *  @param aIndex
 */
- (void)pageView:(ETCyclePageImageView *)aPageView didSelectedPageAtIndex:(NSUInteger)aIndex;

/**
 *	功能:从当前页 切换另一页时,此方法会被调用
 *
 *	@param pageView :
 *	@param aIndex   :另一页面的索引
 */
- (void)pageView:(ETCyclePageImageView *)pageView didChangeToIndex:(NSUInteger)aIndex;

/**
 *  功能:非循环页面，滑动到最后一页继续往后滑动
 */
- (void)pageViewScrollEndOfPage:(ETCyclePageImageView *)aPageView;

@end

@interface ETCyclePageImageView : ETView

@property (nonatomic, weak) id <ETCyclePageImageViewDataSource> dataSource;
@property (nonatomic, weak) id <ETCyclePageImageViewDelegate> delegate;

/**
 *  reload之后显示第几个图片
 */
@property (nonatomic) NSInteger startPageIndex;

/**
 *  轮播循环间隔
 */
@property (nonatomic) NSTimeInterval interval;
/**
 *  分页控件
 */
@property (nonatomic, weak) ETPageControl *pageControl;

@property (nonatomic) BOOL disableAutoRunPage;//是否禁止自动轮播

@property (nonatomic) BOOL disableCycle;//是否禁止循环

@property (nonatomic) BOOL disableClickEffect;//是否禁止点击特效

@property (nonatomic) BOOL emptyGridForMonkeyTest;//检测是否有空窗

/**
 *  显示第n个
 *
 *  @param aIndex
 */
- (void)showPageAtIndex:(NSUInteger)aIndex;
- (void)showPageAtIndex:(NSUInteger)aIndex animated:(BOOL)animated;

/**
 *  刷新数据
 */
- (void)reloadData;

- (NSInteger)curragePage;


@end
