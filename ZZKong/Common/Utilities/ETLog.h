//
//  ETLog.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "CocoaLumberjack.h"


#ifdef DEBUG

static const DDLogLevel ddLogLevel = DDLogLevelVerbose;

#define NSLog(...) NSLog(__VA_ARGS__)

#else

static const DDLogLevel ddLogLevel = DDLogLevelOff;
//干掉log
#define NSLog(...) {}
//干掉断言
#define NS_BLOCK_ASSERTIONS

#endif

#define ETLogV(frmt, ...) DDLogVerbose(frmt, ##__VA_ARGS__)

#define ETLogD(frmt, ...) DDLogDebug(frmt, ##__VA_ARGS__)

#define ETLogI(frmt, ...) DDLogInfo(frmt, ##__VA_ARGS__)

#define ETLogW(frmt, ...) DDLogWarn(frmt, ##__VA_ARGS__)

#define ETLogE(frmt, ...) DDLogError(frmt, ##__VA_ARGS__)

#define ETLog(frmt, ...) DDLogDebug(frmt, ##__VA_ARGS__)

//log
#define LOG_PRETTY_FUNCTION ETLogV(@"%s", __PRETTY_FUNCTION__)
#define LOG_LINE_PRETTY_FUNCTION ETLogV(@"line[%d] %s", __LINE__, __PRETTY_FUNCTION__)

//func log
#define ETLogFuncV ETLogV(@"[%@ call %@]", [self class], THIS_METHOD)
#define ETLogFuncD ETLogD(@"[%@ call %@]", [self class], THIS_METHOD)
#define ETLogFuncI ETLogI(@"[%@ call %@]", [self class], THIS_METHOD)
#define ETLogFuncW ETLogW(@"[%@ call %@]", [self class], THIS_METHOD)
#define ETLogFuncE ETLogE(@"[%@ call %@]", [self class], THIS_METHOD)

@interface ETLog : NSObject

+ (void)setupLogerStatus;


@end
