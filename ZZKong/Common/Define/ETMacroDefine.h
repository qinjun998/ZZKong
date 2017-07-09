//
//  ETMacroDefine.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#ifndef ETMacroDefine_h
#define ETMacroDefine_h

#warning 分了工程之后,预编译宏的作用范围只能在各自的工程中,所以没有办法设置全局的DEBUG或者Release\
只能在公用的头文件中声明DEBUG,发包的时候请删除即可

//#define DEBUG 1

#define STRINGIFY(S) #S
#define DEFER_STRINGIFY(S) STRINGIFY(S)
#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(message(MSG)))
#define FORMATTED_MESSAGE(TYPE, MSG)  "//"#TYPE ": " MSG " \n" \
DEFER_STRINGIFY(__FILE__) " line " DEFER_STRINGIFY(__LINE__)
//#define KEYWORDIFY try {} @catch (...) {}
//todo 宏
#define TODO(MSG) PRAGMA_MESSAGE(FORMATTED_MESSAGE(TODO,MSG))
//fixme 宏
#define FIXME(MSG) PRAGMA_MESSAGE(FORMATTED_MESSAGE(FIXME,MSG))

#define SHARED_APP_DELEGATE (ETAppDelegate *)[UIApplication sharedApplication].delegate
#define kWindow ([UIApplication sharedApplication].keyWindow)
#define SHARED_APP_KEY_WINDOW_ROOT_VIEW ([UIApplication sharedApplication].keyWindow.rootViewController.view)


//property
#define ET_PROPERTY(...) @property(nonatomic, ##__VA_ARGS__)
#define ET_PROPERTY_STRONG ET_PROPERTY(strong)
#define ET_PROPERTY_ASSIGN ET_PROPERTY(assign)
#define ET_PROPERTY_WEAK   ET_PROPERTY(weak)
#define ET_PROPERTY_COPY   ET_PROPERTY(copy)

//默认
#define ETToast(str)  CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle]; \
[kWindow  makeToast:str duration:3 position:CSToastPositionBottom style:style];\
kWindow.userInteractionEnabled = NO; \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{\
kWindow.userInteractionEnabled = YES;\
});\

//设置delay时间
#define ETToastWithDelay(str,delay)  CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle]; \
[kWindow  makeToast:str duration:delay position:CSToastPositionBottom style:style];\
kWindow.userInteractionEnabled = NO; \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{\
kWindow.userInteractionEnabled = YES;\
});\



#endif /* ETMacroDefine_h */
