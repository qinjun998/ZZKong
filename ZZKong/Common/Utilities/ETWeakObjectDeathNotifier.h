//
//  ETWeakObjectDeathNotifier.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>

//当owner释放的时候通知block
@class ETWeakObjectDeathNotifier;

typedef void(^ETWeakObjectDeathNotifierBlock)(ETWeakObjectDeathNotifier *sender);

@interface ETWeakObjectDeathNotifier : NSObject

@property (nonatomic, weak) id owner;
@property (nonatomic, strong) id data;

- (void)setBlock:(ETWeakObjectDeathNotifierBlock)block;

@end
