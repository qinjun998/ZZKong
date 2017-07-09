//
//  ETTBC.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ETTBC.h"

//category
#import "NSObject+BeeNotification.h"

@implementation ETTBC

- (void)updateViewController:(UIViewController *)aVC atIndex:(NSUInteger)aIndex
{
    if (!aVC) {
        return ;
    }
    
    NSMutableArray *viewControllers = self.viewControllers.mutableCopy;
    [viewControllers replaceObjectAtIndex:aIndex withObject:aVC];
    [self setViewControllers:viewControllers animated:NO];
}

#pragma mark - Orientations
- (BOOL)shouldAutorotate
{
    return self.selectedViewController ? [self.selectedViewController shouldAutorotate] : [super shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return self.selectedViewController ? [self.selectedViewController supportedInterfaceOrientations] : [super supportedInterfaceOrientations];
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}


@end
