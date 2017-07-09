//
//  NSString+ConvertType.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ConvertType)

+(NSString *) unicodeToUtf8:(NSString *)string;
+(NSString *) utf8ToUnicode:(NSString *)string;


@end
