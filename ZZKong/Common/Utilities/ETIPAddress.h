//
//  ETIPAddress.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ETFuncDefine.h"

@interface ETIPAddress : NSObject

AS_SINGLETON(ETIPAddress);

/**
 *  功能:获取IP地址
 */
- (NSString *)getIPAddress;
/**
 *  功能:获取mac地址
 */
- (NSString *)getHWAddress;
@end
