//
//  ETFileManager.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETFileManager.h"

@implementation ETFileManager

+ (NSString *)appDocPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)appLibPath
{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)appCachePath
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

#pragma mark - 获取沙盒tmp的文件目录
+ (NSString *)appTempPath{
    return NSTemporaryDirectory();
}



+ (BOOL)isFileExsit:(NSString *)aPath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    return [manager fileExistsAtPath:aPath];
}

+ (BOOL)isFileExsitInDoc:(NSString *)aPath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *path = [ETFileManager appDocPath];
    [path stringByAppendingPathComponent:aPath];
    return [manager fileExistsAtPath:path];
}

+ (BOOL)isBundleExsit:(NSString *)aBundleName
{
    return [[NSBundle mainBundle] URLForResource:aBundleName withExtension:@"bundle"] ? YES : NO;
}

+(NSArray *)getFileNameListOfType:(NSString *)type from:(NSString *)path{
    NSMutableArray *filenamelist = [NSMutableArray arrayWithCapacity:10];
    NSArray *tmplist = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    if(type){
        for (NSString *filename in tmplist) {
            NSString *fullpath = [path stringByAppendingPathComponent:filename];
            if ([self isFileExsit:fullpath]) {
                if ([[filename pathExtension] isEqualToString:type]) {
                    [filenamelist  addObject:filename];
                }
            }
        }
        return filenamelist;
    }else{
        return tmplist;
    }
}

+(NSArray *) getAllDocumentNameOfType:(NSString *)type{
    NSString *docPath = [ETFileManager appDocPath];
    NSArray *tmplist = [ETFileManager getFileNameListOfType:type from:docPath];
    return tmplist;
}




#pragma mark - 根据路径返回目录或文件的大小
+ (double)sizeWithFilePath:(NSString *)path{
    // 1.获得文件夹管理者
    NSFileManager *manger = [NSFileManager defaultManager];
    // 2.检测路径的合理性
    BOOL dir = NO;
    BOOL exits = [manger fileExistsAtPath:path isDirectory:&dir];
    if (!exits) return 0;
    // 3.判断是否为文件夹
    if (dir) { // 文件夹, 遍历文件夹里面的所有文件
        // 这个方法能获得这个文件夹下面的所有子路径(直接\间接子路径)
        NSArray *subpaths = [manger subpathsAtPath:path];
        int totalSize = 0;
        for (NSString *subpath in subpaths) {
            NSString *fullsubpath = [path stringByAppendingPathComponent:subpath];
            BOOL dir = NO;
            [manger fileExistsAtPath:fullsubpath isDirectory:&dir];
            if (!dir) { // 子路径是个文件
                NSDictionary *attrs = [manger attributesOfItemAtPath:fullsubpath error:nil];
                totalSize += [attrs[NSFileSize] intValue];
            }
        }
        return totalSize / (1024 * 1024.0);
    } else { // 文件
        NSDictionary *attrs = [manger attributesOfItemAtPath:path error:nil];
        return [attrs[NSFileSize] intValue] / (1024.0 * 1024.0);
    }
}

#pragma mark - 得到指定目录下的所有文件
+ (NSArray *)getAllFileNames:(NSString *)dirPath{
    NSArray *files = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:dirPath error:nil];
    return files;
}
#pragma mark - 删除指定目录或文件
+ (BOOL)clearCachesWithFilePath:(NSString *)path{
    NSFileManager *mgr = [NSFileManager defaultManager];
    return [mgr removeItemAtPath:path error:nil];
}

#pragma mark - 清空指定目录下文件
+ (BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath{
    //获得全部文件数组
    NSArray *fileAry =  [ETFileManager getAllFileNames:dirPath];
    //遍历数组
    BOOL flag = NO;
    for (NSString *fileName in fileAry) {
        NSString *filePath = [dirPath stringByAppendingPathComponent:fileName];
        flag = [ETFileManager clearCachesWithFilePath:filePath];
        if (!flag)
            break;
    }
    return flag;
}

#pragma mark - 获得临时目录下文件大小
+(double) getTmpPathFileSize{
    double tmpSize=  [ETFileManager sizeWithFilePath: [ETFileManager appTempPath]];
    return tmpSize;
}
#pragma mark - 清空临时目录下文件
+(BOOL) clearAllTmpPathFiles{
    return [ETFileManager clearCachesFromDirectoryPath: [ETFileManager appTempPath]];
}

//获得缓存
+(CGFloat)cacheSizeInMega {
    //    NSString *path = [AudioAmrUtil convertDir];
    //    long long fileSize = [self folderSizeAtPath:path];
    long long fileSize =0;
    fileSize += [[SDImageCache sharedImageCache] getSize];
    return  fileSize / (1024.0 * 1024.0);
}

+(void)clearCache {
    [[SDImageCache sharedImageCache] clearDisk];
}

#pragma mark -- 私有函数缓存
+(long long)fileSizeAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path]){
        long long size = [fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size;
    }
    return 0;
}
//  缓存私有函数，获得指定目录的文件大小
+(CGFloat)folderSizeAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    float folderSize;
    
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            folderSize += [self fileSizeAtPath:absolutePath];
        }
        
        return folderSize;
    }
    
    return 0;
}


@end
