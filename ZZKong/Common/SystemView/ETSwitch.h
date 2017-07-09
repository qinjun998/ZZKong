//
//  ETSwitch.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ETSwitch;

typedef void(^ETSwitchBlock)(ETSwitch *ETSwitch, BOOL isOn);

@interface ETSwitch : UISwitch

@property (nonatomic, strong) id data;

+ (instancetype)switchWithChangeValueBlock:(ETSwitchBlock)aBlock;
@end
