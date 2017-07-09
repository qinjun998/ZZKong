//
//  NSObject+BeeNotification.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "NSObject+BeeNotification.h"
//category
#import "NSObject+PerformBlock.h"


@implementation NSObject (BeeNotification)

- (void)handleNotification:(NSNotification *)notification
{
    
}

- (void)observeNotification:(NSString *)name
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:name
                                               object:nil];
}

- (void)unobserveNotification:(NSString *)name
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:name
                                                  object:nil];
}

- (void)unobserveAllNotifications
{
#warning 这是一个不安全的方法，通知应该都用blocks－kvo替代
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)postNotification:(NSString *)name
{
    [self postNotification:name withObject:nil userInfo:nil];
}

- (void)postNotification:(NSString *)name withObject:(NSObject *)object
{
    [self postNotification:name withObject:object userInfo:nil];
}

- (void)postNotification:(NSString *)name withObject:(NSObject *)object userInfo:(NSDictionary *)info
{
    [self performInMainThreadBlock:^{
        @try {
            [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:info];
        }
        @catch (NSException *exception) {}
        @finally {}
    }];
}


@end
