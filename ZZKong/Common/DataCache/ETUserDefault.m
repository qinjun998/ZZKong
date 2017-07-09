//
//  ETUserDefault.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETUserDefault.h"

@implementation ETUserDefault

+ (void)setValue:(id)anObject forKey:(NSString *)aKey
{
    if ( ! aKey || ! [aKey isKindOfClass:[NSString class]]) {
        return ;
    }
    
    if (anObject)
    {
        [[NSUserDefaults standardUserDefaults] setObject:anObject forKey:aKey];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:aKey];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)getValueForKey:(NSString *)aKey
{
    if ( ! aKey || ! [aKey isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:aKey];
}

@end
