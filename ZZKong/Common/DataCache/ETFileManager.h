//
//  ETFileManager.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import <Foundation/Foundation.h>

#define ET_DOC_PATH    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject]

@interface ETFileManager : NSObject

/**
 *  获得app文档目录
 *
 *  @return 目录地址
 */
+ (NSString *)appDocPath;

/**
 *  获得app文档目录
 *
 *  @return 目录地址
 */
+ (NSString *)appCachePath;

/**
 *  获得app的lib目录
 *
 *  @return lib目录地址
 */
+ (NSString *)appLibPath;

/**
 *  判断文件是否存在
 *
 *  @param aPath 地址
 *
 *  @return BOOL
 */
+ (BOOL)isFileExsit:(NSString *)aPath;
/**
 *  判断Doc目录中是否存在某文件
 *
 *  @param aPath 地址
 *
 *  @return BOOL
 */
+ (BOOL)isFileExsitInDoc:(NSString *)aPath;
/**
 *  判断bundle是否存在
 *
 *  @param aBundleName bundle名称
 *
 *  @return BOOL
 */
+ (BOOL)isBundleExsit:(NSString *)aBundleName;

/**
 *  获得该文件夹下指定类型的文件或者所有文件
 *
 *  @param type 文件类型
 *  @param path 文件夹路径
 *
 *  @return BOOL
 */
+(NSArray *)getFileNameListOfType:(NSString *)type from:(NSString *)path;
/**
 *  获得Doc文件夹下指定类型的文件或者所有文件
 *
 *  @param aBundleName bundle名称
 *
 *  @return BOOL
 */
+(NSArray *) getAllDocumentNameOfType:(NSString *)type;


// 根据路径返回目录或文件的大小
+ (double)sizeWithFilePath:(NSString *)path;
// 得到指定目录下的所有文件
+ (NSArray *)getAllFileNames:(NSString *)dirPath;
// 删除指定目录或文件
+ (BOOL)clearCachesWithFilePath:(NSString *)path;
// 清空指定目录下文件
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath;

#pragma mark - 获得临时目录下文件大小
+(double) getTmpPathFileSize;
#pragma mark - 清空临时目录下文件
+(BOOL) clearAllTmpPathFiles;

//获得缓存
+(CGFloat)cacheSizeInMega;
//清理缓存
+(void)clearCache;



@end
