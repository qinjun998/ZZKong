//
//  ETNotificationDefine.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


UIKIT_EXTERN NSString *const NotificationRefreshLogin;
/**
 *  注销
 */
UIKIT_EXTERN NSString *const NotificationLogout;
/**
 *  登录成功
 */
UIKIT_EXTERN NSString *const NotificationLogined;
/**
 *  登录失败
 */
UIKIT_EXTERN NSString *const NotificationLoginFailed;
//修改用户信息
UIKIT_EXTERN NSString *const NotificationModifyInfo;
//新消息
UIKIT_EXTERN NSString *const NotificationNewNotice;
//消息更新
UIKIT_EXTERN NSString *const NotificationUpdateNotice;



/**
 *  网络状态更新
 */
UIKIT_EXTERN NSString *const NotificationNetworkStatusChange;

/**
 *  有网络
 */
UIKIT_EXTERN NSString *const NotificationNetworkStatusReachable;

/**
 *  微信支付返回APP时的通知
 */
UIKIT_EXTERN NSString *const NotificationWeichatPay;




//网络
#define ET_SHOW_ERROR_VIEW                 @"ET_SHOW_ERROR_VIEW"//显示错误界面(无网络连接，或者服务器忙)

#define ET_HIDE_NO_CONNECT_ERROR_VIEW      @"ET_HIDE_NO_CONNECT_ERROR_VIEW"//隐藏无网络错误界面

#define ET_SHOW_NETWORK_FORCE              @"ET_SHOW_NETWORK_FORCE"//显示网络强制提示

#define ET_SHOW_VERSION_UPDATE             @"ET_SHOW_VERSION_UPDATE"//显示版本更新空态界面



//音频相关
#define ET_NOTIFICATION_STK_AUDIO_PLAYING      @"ET_NOTIFICATION_STK_AUDIO_PLAYING"//播放
#define ET_NOTIFICATION_STK_AUDIO_BUFFERING    @"ET_NOTIFICATION_STK_AUDIO_BUFFERING"//缓冲
#define ET_NOTIFICATION_STK_AUDIO_PAUSED       @"ET_NOTIFICATION_STK_AUDIO_PAUSED"//暂停
#define ET_NOTIFICATION_STK_AUDIO_STOPPED      @"ET_NOTIFICATION_STK_AUDIO_STOPPED"//停止
#define ET_NOTIFICATION_PLAYER_STATE_CHANGED   @"ET_NOTIFICATION_PLAYER_STATE_CHANGED"//播放器状态改变


