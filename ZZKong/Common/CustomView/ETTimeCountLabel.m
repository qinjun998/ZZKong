//
//  ETTimeCountLabel.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ETTimeCountLabel.h"
@interface ETTimeCountLabel ()
@property(nonatomic, assign) SInt64 mTimeInterVal;
@property(nonatomic, weak) NSTimer *mTimer;
@end

@implementation ETTimeCountLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/**
 *  功能：设置倒计时的时间，time单位是毫秒
 */
- (void)setCountDownTime:(SInt64)time
{
    self.mTimeInterVal = time/1000.0;
    if (self.mTimer == nil) {
        self.mTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop]addTimer:_mTimer forMode:NSDefaultRunLoopMode];
    }
}

/**
 *  功能：设置倒计时的时间，time单位是秒
 */
- (void)setCountDownSecTime:(SInt64)time
{
    self.mTimeInterVal = time;
    if (self.mTimer == nil) {
        self.mTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop]addTimer:_mTimer forMode:NSDefaultRunLoopMode];
    }
}

/**
 *  功能：每一跳的动作
 */
- (void)timeFireMethod
{
    self.mTimeInterVal--;
    if (_mTimeInterVal < 0) {
        [self.mTimer invalidate];
        [self setMTimer:nil];
        [self.delegate timeDrained];
    }else{
        [self setText:[self timeStringFromInterval:_mTimeInterVal]];
    }
}

/**
 *  功能：根据时间计算出显示格式
 */
- (NSString *)timeStringFromInterval:(SInt64)aInterval
{
    int hours = (int)(aInterval / (60 * 60));
    int days = hours/24;
    int hoursInOneDay = hours%24;
    aInterval -= hours * (60 * 60);
    int minutes = (int)(aInterval / 60);
    aInterval -= minutes * 60;
    int seconds =  aInterval % 60;
    
    if (self.timeFormat) {
        NSString *dateStr = [NSString stringWithFormat:self.timeFormat, days, hoursInOneDay, minutes, seconds];
        NSRange range;
        if (days >= 1) {
            range = [dateStr rangeOfString:@"秒"];
        }else{
            range = [dateStr rangeOfString:@"天"];
        }
        if (range.location != NSNotFound) {
            range.location -= 2;
            range.length += 2;
            dateStr = [dateStr stringByReplacingCharactersInRange:range withString:@""];
        }
        return dateStr;
    }else{
        return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
    }
}


/**
 *  功能：父视图发生改变时调用，这里用以使timer失效
 */
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (self.mTimer) {
        [self.mTimer invalidate];
        [self setMTimer:nil];
    }
}

@end
