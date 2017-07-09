//
//  AppDelegate.m
//  ZZKong
//
//  Created by lee on 2017/7/5.
//  Copyright © 2017年 zzk. All rights reserved.
//



#import "AppDelegate.h"
#import <YTKNetwork/YTKNetworkConfig.h>
#import "ECDTBC.h"
#import "ECDNC.h"
#import "ZZKLoginVC.h"
#import "ECDAppStatus.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import <EAIntroView/EAIntroView.h>
#import "NSData+AESEncryption.h"
#import "NSString+MD5.h"
#import "UIView+Border.h"
#import "ECDSetting.h"


#import "ETUserDefault.h"
#import "ETStoryboard.h"

#import "ETAppDelegate.h"
#import "ECDWindow.h"

//友盟分享
#define kUMSocialAppKey @"583501e8b27b0a09a1000411"

#define kWeiChatAppKey @"wx2241c764da3eeedf"
#define kWeiChatSecret @"d18cba53aa7ac5b8b2cfed12dbcd938b"

#define kQQAppKey @"1105766097"
#define kQQSecret @"Ba7PA50hucqyewDw"


// 个推开发者网站中申请App时注册的AppId、AppKey、AppSecret

//服务器的key
#define kGtAppId           @"Y05Kaz18SQ6byaqErzSDG1"
#define kGtAppKey          @"NpAHvKPqQ5AhxiKdiaONO1"
#define kGtAppSecret       @"sI6AXsxFcz7eH6OYi3qDd7"


//BMKMapManager* _mapManager;
//,WXApiDelegate
@interface AppDelegate ()<EAIntroDelegate> {
    
    //@interface AppDelegate ()<EAIntroDelegate,BMKGeneralDelegate,BMKLocationServiceDelegate> {
    EAIntroView *_intro;
    EAIntroPage *_page3;
}

@property(nonatomic,strong) UIView *rootView;

//@property(strong,nonatomic)  BMKLocationService* locService;  //百度地理位置服务
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) EAIntroPage *latestView;


@property (nonatomic, strong) UIView *maskView;
//@property (nonatomic, strong) UIButton *registerButton;
//@property (nonatomic, strong) UIButton *loginButton;
//@property (nonatomic, strong) UILabel *centerLabel;

@property (nonatomic, strong) EAIntroView *introView;


@property (nonatomic, strong) ECDTBC *tabbarController;



@end

@implementation AppDelegate
@synthesize window;

#pragma mark --Properties



-(EAIntroPage *)latestView {
    if(!_latestView){
        _latestView = [EAIntroPage page];
        _latestView.bgImage = [UIImage imageNamed:@"Flash03.png"];
    }
    return _latestView;
}

-(ECDTBC *)tabbarController {
    if(!_tabbarController){
        _tabbarController =  [ECDTBC new];
    }
    return _tabbarController;
}



-(UIView *)maskView {
    if(!_maskView){
        _maskView = [[UIView alloc] initWithFrame:kWindow.bounds];
        _maskView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    }
    return _maskView;
}

-(EAIntroView *)introView {
    if(!_introView){
        _introView = [[EAIntroView alloc] initWithFrame:kWindow.bounds];
        [_introView setDelegate:self];
        _introView.tapToNext = NO;
        _introView.swipeToExit = YES;
    }
    return _introView;
}



#pragma mark --LifeCycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NSThread sleepForTimeInterval:1.0];//设置启动页面时间
    
    
    //    application.statusBarHidden = NO;
    
    //    NSAssert(ETWC_AppID.length, @"请填写微信AppKey");
    //    [WXApi registerApp:ETWC_AppID withDescription:@"亿财道"];  //注册应用,用于微信绑定
    //
    //    [self initShare];  //初始化友盟分享
    //    [self initGetui];  //初始化个推
    
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"ECDDataModel"];
    
    //     [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.keyboardDistanceFromTextField = 50;
    
    [ECDSetting  setDefaultServerEnvironment];
    
    
    self.window = [[ECDWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    //设置为第一次出现
    self.window.rootViewController = vc;
    //    self.window.rootViewController.view = self.latestView.pageView;
    [self.window makeKeyAndVisible];
    
    //    [self showTabbarController];
    //    [self.window.rootViewController.view addSubview:self.maskView];
    
    //    self.maskView.hidden = YES;
    
    //    [WXApi registerApp:@"wx38b1d2219017c6bc" withDescription:@"demo2.0"];
    //    [WXApi reg];
    
    if (![ECDAppStatus haveSeenIntroBefore]) {
        [ECDAppStatus setHaveSeenIntroBefore:YES];
        [self showIntroWithCrossDissolve];
        
    }
    else{
        //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self checkLogin];
        //        });
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkLogin) name:NotificationLogout object:nil];
    return YES;
}



- (void)showIntroWithCrossDissolve {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.bgImage = [UIImage imageNamed:@"Flash01"];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.bgImage = [UIImage imageNamed:@"Flash02"];
    
    //    EAIntroPage *page3 = [EAIntroPage page];
    //    page3.bgImage = [UIImage imageNamed:@"Flash3"];
    
    
    [self.introView setPages:@[page1,page2,self.latestView]];
    
    [self.introView showInView:kWindow animateDuration:0.5];
    //    [self.introView showInView:self.pcWindow animateDuration:0.5];
}

- (void)intro:(EAIntroView *)introView pageAppeared:(EAIntroPage *)page withIndex:(NSUInteger)pageIndex {
    
    NSLog(@"%s,pageIndex=%lu",__FUNCTION__,(unsigned long)pageIndex);
    
    //    if (pageIndex == 4) {
    //
    //        [self.introView addSubview:self.loginButton];
    //        [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
    //            make.size.mas_equalTo(CGSizeMake(120, 50));
    //            make.centerY.equalTo(self.centerLabel.mas_centerY);
    //            make.trailing.equalTo(self.centerLabel.mas_leading).offset(-8);
    //        }];
    //
    //        [self.introView addSubview:self.registerButton];
    //
    //        [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
    //            make.size.mas_equalTo(CGSizeMake(120, 50));
    //            make.centerY.equalTo(self.centerLabel.mas_centerY);
    //            make.leading.equalTo(self.centerLabel.mas_trailing).offset(8);
    //        }];
    //
    //        self.registerButton.alpha = 1.f;
    //        self.loginButton.alpha = 1.f;
    //    } else {
    //        self.registerButton.alpha = 0.f;
    //        self.loginButton.alpha = 0.f;
    //    }
    
}

/*
 - (void)onResp:(BaseResp *)resp{
 
 NSLog(@"dfadfadfa");
 
 //    if (resp.errCode == 0) {
 
 NSMutableDictionary *dic=[NSMutableDictionary new];
 
 [dic setObject:[NSString stringWithFormat:@"%d",resp.errCode] forKey:@"errorCode"];
 
 [[NSNotificationCenter defaultCenter] postNotificationName:@"wxPayResult" object:nil userInfo:dic];
 
 //    }
 
 }
 
 - (void)onReq:(BaseReq *)req{
 
 NSLog(@"erara");
 
 }
 
 */

- (void)introDidFinish:(EAIntroView *)introView wasSkipped:(BOOL)wasSkipped{
    NSLog(@"%s",__FUNCTION__);
    [self checkLogin];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
//
//
//    return  [WXApi handleOpenURL:url delegate:self];
//
//}
//
//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
//
//    [WXApi handleOpenURL:url delegate:self];
//
//    return YES;
//
//}
//
//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
//
//    return  [WXApi handleOpenURL:url delegate:self];
//
//    return YES;
//
//}

#pragma mark login
- (void)checkLogin{
    if (![ECDAppStatus isLoggedIn]) {
        [self showLoginVC];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:NotificationLogined object:nil];
        [self showTabbarController];
    }
    
}

//导航到登录
-(BOOL)showLoginVC {
    if (_isPresentingLoginVC) {
        return YES;
    }
    
    _isPresentingLoginVC = YES;
    ZZKLoginVC *loginVC = (ZZKLoginVC *)[ETStoryboard getLoginVC];
    
    ETNC *loginNC = [[ETNC alloc]initWithRootViewController:loginVC];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    self.window.rootViewController = loginNC;
    [self.window.layer addAnimation:transition forKey:@"animation"];
    
    _isPresentingLoginVC = NO;

    return YES;
}


//导航到主界面
-(void)showTabbarController;{
    ECDTBC * tbc = [self tabbarController];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    self.window.rootViewController =tbc;
    [self.window.layer addAnimation:transition forKey:@"animation"];
    
}

@end

