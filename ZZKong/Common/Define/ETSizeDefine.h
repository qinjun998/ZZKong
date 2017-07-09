//
//  ETSizeDefine.h
//  ZZKong
//
//  Created by lee on 16/9/12.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#ifndef ETSizeDefine_h
#define ETSizeDefine_h



//#define  kCellHeight 95
//#define  kCellHeight   (SCREEN_WIDTH-60)/3+20




#define  kInsetSpace 10
#define  kNumbersPerRow 3

#define  kCellHeight   floor((SCREEN_WIDTH-(kNumbersPerRow+1)*kInsetSpace)/kNumbersPerRow)
#define  kCellWidth   floor((SCREEN_WIDTH-(kNumbersPerRow+1)*kInsetSpace)/kNumbersPerRow)


#define kZZKongHelpCenterURL @"service/reurl/user_manual"
#define kZZKongManualURL  @"service/reurl/user_agreement"

#define kSendTimeSchdue 10

#define kBaiduMapKey @"y5cCTmbwMGS77KcnDWguHYdUKWCuwsqK"
#define kBundleIdentifier @"net.ZZKong.c"

#define kServerEnv @"def_key_server_env"
#define kRequestTimeoutInterval 30




#define WEBSERVERHOST @"http://mj.wotuan.com/app/"

#define APIHOST @"http://mj.wotuan.com:8088/demo"


//横竖屏宽度
#define UI_CURRENT_SCREEN_HEIGHT (IS_LANDSCAPE?(IOS_SDK_LESS_THAN(8.0)?([[UIScreen mainScreen] bounds].size.width):([[UIScreen mainScreen] bounds].size.height)):([[UIScreen mainScreen] bounds].size.height))

#define UI_CURRENT_SCREEN_WIDTH (IS_LANDSCAPE?\
(IOS_SDK_LESS_THAN(8.0)?([[UIScreen mainScreen] bounds].size.height):([[UIScreen mainScreen] bounds].size.width))\
:([[UIScreen mainScreen] bounds].size.width))




#define IOS_VERSION_LOWER_THAN_8 (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1)

#define SCREEN_WIDTH (IOS_VERSION_LOWER_THAN_8 ? (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height) : [[UIScreen mainScreen] bounds].size.width)

#define SCREEN_HEIGHT (IOS_VERSION_LOWER_THAN_8 ? (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width) : [[UIScreen mainScreen] bounds].size.height)





#endif /* ETSizeDefine_h */
