//
//  NSObject+safe.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSObject (safe)

/**
 *  转换成nsstring－》nsnumber
 *
 *  @return NSnumber
 */
- (NSNumber *)toNumberIfNeeded;

@end

@interface UIView (safe)

@end
