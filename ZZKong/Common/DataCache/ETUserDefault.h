//
//  ETUserDefaultDefine.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETUserDefaultDefine.h"

@interface ETUserDefault : NSObject

/**
 *  存储数据到userdefault
 *
 *  @param anObject 数据
 *  @param aKey     标识
 */
+ (void)setValue:(id)anObject forKey:(NSString *)aKey;
/**
 *  从userdefault获取数据
 *
 *  @param aKey 标识
 *
 *  @return 数据
 */
+ (id)getValueForKey:(NSString *)aKey;

@end
