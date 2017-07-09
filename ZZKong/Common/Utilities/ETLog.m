//
//  ETLog.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETLog.h"

@implementation ETLog

+ (void)setupLogerStatus
{
#ifdef DEBUG
    //set color on
    setenv("XcodeColors", "YES", 0);
    
    //This class provides a logger for Terminal output or Xcode console output
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    //This class provides a logger for the Apple System Log facility
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    
    // And then enable colors
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor lightGrayColor] backgroundColor:nil forFlag:DDLogFlagVerbose];
    
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor cyanColor] backgroundColor:nil forFlag:DDLogFlagDebug];
    
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor magentaColor] backgroundColor:nil forFlag:DDLogFlagInfo];
    
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor brownColor] backgroundColor:nil forFlag:DDLogFlagWarning];
    
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor redColor] backgroundColor:nil forFlag:DDLogFlagError];
#endif
}




@end
