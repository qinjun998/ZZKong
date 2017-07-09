//
//  ETWeakObjectDeathNotifier.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETWeakObjectDeathNotifier.h"

#import "NSObject+category.h"

@interface ETWeakObjectDeathNotifier ()

@property (nonatomic, copy) ETWeakObjectDeathNotifierBlock aBlock;

@end

@implementation ETWeakObjectDeathNotifier

- (void)setBlock:(ETWeakObjectDeathNotifierBlock)block
{
    self.aBlock = block;
}

- (void)dealloc
{
    if (self.aBlock) {
        self.aBlock(self);
    }
    
    self.aBlock = nil;
}

- (void)setOwner:(id)owner
{
    _owner = owner;
    
    [owner objc_setAssociatedObject:[NSString stringWithFormat:@"observerOwner_%p",self] value:self policy:OBJC_ASSOCIATION_RETAIN_NONATOMIC];
}

@end
