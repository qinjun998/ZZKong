//
//  ETSwitch.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETSwitch.h"
//category
#import "NSObject+BeeNotification.h"

@interface ETSwitch ()

@property (nonatomic, copy) ETSwitchBlock block;

@end

@implementation ETSwitch

- (void)changeValue
{
    if (self.block) {
        self.block(self,self.isOn);
    }
}

+ (instancetype)switchWithChangeValueBlock:(ETSwitchBlock)aBlock
{
    ETSwitch *etSwitch = [[self alloc] initWithFrame:CGRectZero];
    [etSwitch addTarget:etSwitch action:@selector(changeValue) forControlEvents:UIControlEventValueChanged];
    etSwitch.block = aBlock;
    return etSwitch;
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}


@end
