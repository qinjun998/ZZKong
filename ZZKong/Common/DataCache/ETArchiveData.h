//
//  ETArchiveData.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETArchiveData : NSObject

/**
 *  功能:存档
 */
+ (void)archiveDataInDoc:(id<NSCoding>)aData withFileName:(NSString *)aFileName;

/**
 *  功能:取档，从document中取文件
 */
+ (id<NSCoding>)unarchiveDataInDocWithFileName:(NSString *)aFileName;

/**
 *  功能:存档到cache
 */
+ (void)archiveDataInCache:(id<NSCoding>)aData withFileName:(NSString *)aFileName;

/**
 *  功能:取档，从cache中取文件
 */
+ (id<NSCoding>)unarchiveDataInCacheWithFileName:(NSString *)aFileName;

/**
 *  功能:取档,从[[NSBundle mainBundle] resourcePath]取文件
 */
+ (id<NSCoding>)unarchiveDataInMainBundleWithFileName:(NSString *)aFileName;

/**
 *  功能:取档,从[[NSBundle mainBundle] resourcePath]取文件
 */
+ (id<NSCoding>)unarchiveDataWithFileName:(NSString *)aFileName andBundleName:(NSString *)aBundleName;


@end
