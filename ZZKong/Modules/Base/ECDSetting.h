//
//  ECDSetting.h
//  ZZKong
//
//  Created by lee on 2016/11/9.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ECDSetting : NSObject


+(NSArray *)serverURLs;
+(NSArray *)serverNames;


+(NSString *)envirmentDescription:(NSInteger)row;  //显示文字

//默认设置上次使用网络环境
+(void)setDefaultServerEnvironment;

//设置环境
+(void)setServerEnvironment:(NSInteger )serverRow;

//获得当前app处于debug还是release状态.
+(BOOL)getAppStatus;

+(NSInteger)lastServerEnvironment;



@end
