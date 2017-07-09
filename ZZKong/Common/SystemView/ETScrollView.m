//
//  ETScrollView.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETScrollView.h"
#import "ETFuncDefine.h"
#import "ETWeakObjectDeathNotifier.h"

@implementation ETScrollView

- (void)setDelegate:(id<UIScrollViewDelegate>)delegate
{
    [super setDelegate:delegate];
    
    if (delegate == nil) {
        return;
    }
    
    ETWeakObjectDeathNotifier *wo = [ETWeakObjectDeathNotifier new];
    [wo setOwner:delegate];
    WEAK_SELF;
    [wo setBlock:^(ETWeakObjectDeathNotifier *sender) {
        STRONG_SELF;
        self.delegate = nil;
    }];
}


@end
