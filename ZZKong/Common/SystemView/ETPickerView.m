//
//  ETPickerView.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETPickerView.h"

#import "NSObject+BeeNotification.h"

@implementation ETPickerView

- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated
{
    NSInteger rowCount = [self numberOfRowsInComponent:component];
    if (row>=0 && row<=rowCount-1) {
        [super selectRow:row inComponent:component animated:animated];
    }
    else {
        [super selectRow:0 inComponent:component animated:animated];
    }
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}

@end
