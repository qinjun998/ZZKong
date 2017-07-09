//
//  UIViewController+custom.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ETNaviButtonNone = 0,        //空的，无图片
    ETNaviButtonReturn,          //返回，白色箭头
} ETNaviButtonType;



@interface ETDataNaviBtn : UIButton

@property(nonatomic, copy) NSString *href;
@property(nonatomic, strong) NSArray *items;

@end

@interface ETUpdownLayoutNaviBtn : ETDataNaviBtn

@end

@interface UIViewController (custom)


#pragma mark - navi button

- (void)setNaviButtonType:(ETNaviButtonType)aType
                  isBgImg:(BOOL)aIsBgImg
                    frame:(CGRect)aFrame
                     text:(NSString *)aText
                    color:(UIColor *)aColor
                     font:(UIFont *)aFont
             shadowOffset:(CGSize)aShadowOffset
                alignment:(UIControlContentHorizontalAlignment)aAlignment
               edgeInsets:(UIEdgeInsets)aEdgeInsets
                   isLeft:(BOOL)aLeft;

/**
 *  功能:设置左/右按钮的类型（图片）和文字（包括颜色大小样式）
 *  type:按钮类型   text:文字   color:颜色  font:样式   alignment:对齐方式  edgeInsets:边距 shadowOffset:阴影偏移量  aLeft:是否是左按钮
 */
- (void)setNaviButtonType:(ETNaviButtonType)aType
                    frame:(CGRect)aFrame
                     text:(NSString *)aText
                    color:(UIColor *)aColor
                     font:(UIFont *)aFont
             shadowOffset:(CGSize)aShadowOffset
                alignment:(UIControlContentHorizontalAlignment)aAlignment
               edgeInsets:(UIEdgeInsets)aEdgeInsets
                   isLeft:(BOOL)aLeft;


/**
 *  功能:设置左按钮类型（图片）
 *  type:按钮类型
 */
- (void)setNaviButtonType:(ETNaviButtonType)aType isLeft:(BOOL)aLeft;

/**
 *  功能:设置按钮文字
 *  aText:按钮文字
 */
- (void)setNaviButtonText:(NSString *)aText isLeft:(BOOL)aLeft;

/**
 *  功能:上下布局的按钮，上面图片，下面文字
 */
- (void)setUpdownLayoutNaviButtonType:(ETNaviButtonType)aType text:(NSString *)aText href:(NSString *)aHref items:(NSArray *)aItems isLeft:(BOOL)aLeft;

/**
 *  功能:左按钮点击行为，可在子类重写此方法
 */
- (void)leftBtnClicked:(id)sender;

/**
 *  功能:右按钮点击行为，可在子类重写此方法
 */
- (void)rightBtnClicked:(id)sender;


@end
