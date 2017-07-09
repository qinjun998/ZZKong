//
//  ETTimeCountLabel.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import <UIKit/UIKit.h>
@protocol ETTimeCountLabelDelegate <NSObject>
@required
- (void)timeDrained;
@end

@interface ETTimeCountLabel : UILabel

@property(nonatomic, weak) id<ETTimeCountLabelDelegate> delegate;
@property(nonatomic, strong)NSString *timeFormat;
/**
 *  功能：设置倒计时时间，time单位为毫秒
 */
- (void)setCountDownTime:(SInt64)time;

/**
 *  功能：设置倒计时的时间，time单位是秒
 */
- (void)setCountDownSecTime:(SInt64)time;
@end
