//
//  ETVC.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+et.h"
//define
#import "ETFuncDefine.h"



@protocol ETUIKitDelegate <NSObject>

/**
 *  是否能右滑返回
 */
@property (nonatomic) BOOL canDragBack;
/**
 *  是否显示导航栏的toolbar
 */
@property (nonatomic, getter=isToolbarHidden) BOOL toolbarHidden;
/**
 *  是否显示Navigation bar
 */
@property (nonatomic, getter=isNavigationBarHidden) BOOL navigationBarHidden;
/**
 *  导航栏背景图
 */
@property (nonatomic, copy) UIImage *navigationBarImage;

/**
 *  底部tabbar背景图
 */
@property (nonatomic, copy) UIImage *tabbarImage;
/**
 *  状态栏样式
 */
@property (nonatomic) ETStatusBarStyle statusBarStyle;
/**
 *  title颜色
 */
@property (nonatomic, copy) UIColor *titleColor;
/**
 *  富文本title，如果设置了则title，titlecolor失效
 */
@property (nonatomic,copy) NSDictionary *titleTextAttributes;

/**
 *  显示全局消息提醒
 */
@property (nonatomic) BOOL showGlobalMessageTip;

@end


@interface ETVC : UIViewController<ETUIKitDelegate>

//当vc的view加载完成之后，将要显示的时候，调用传入的block刷新数据
- (void)updateModelWhenViewLoaded:(ETNoParamNoReturnBlock)aBlock;
- (void)updateModelWhenViewLoaded:(ETNoParamNoReturnBlock)aBlock andIdentifier:(NSString *)identifier;
//当vc的view加载完成之后，将要显示的时候，调用传入的block刷新数据，只调用一次
- (void)updateModelWhenViewLoadedOnce:(ETNoParamNoReturnBlock)aBlock;
- (void)updateModelWhenViewLoadedOnce:(ETNoParamNoReturnBlock)aBlock andIdentifier:(NSString *)identifier;
//当vc完全呈现之后调用传入的block
- (void)updateViewWhenViewdidAppear:(ETNoParamNoReturnBlock)aBlock;
- (void)updateViewWhenViewdidAppear:(ETNoParamNoReturnBlock)aBlock andIdentifier:(NSString *)identifier;
//当vc完全呈现之后调用传入的block，只调用一次
- (void)updateViewWhenViewdidAppearOnce:(ETNoParamNoReturnBlock)aBlock;
- (void)updateViewWhenViewdidAppearOnce:(ETNoParamNoReturnBlock)aBlock andIdentifier:(NSString *)identifier;

- (void)_ETVC_setup;

+ (NSString *)cellReuseIdentifier;


//设置sb名称
-(void)setStoryboardName:(NSString *)name;
//获取默认sb中的vc
-(UIViewController *)viewControllerByName:(NSString *) vcName;
//获取指定sb名称下的指定vc
-(UIViewController *)viewControllerBySBName:(NSString *) sbName aVcName:(NSString *) vcName;

- (id)nibView:(NSString *)viewName;


@end
