//
//  NSObject+coder.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (coder)
/**
 *  快捷从归档恢复方法
 *
 *  @param aDecoder
 *
 *  @return
 */
- (id)etDecodeWithCoder:(NSCoder *)aDecoder;
/**
 *  快捷归档方法
 *
 *  @param aCoder
 */
- (void)etEncodeWithCoder:(NSCoder *)aCoder;

@end
