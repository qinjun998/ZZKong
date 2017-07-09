//
//  ETVC.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETVC.h"


//define
#import "ETFuncDefine.h"
//category
#import "NSObject+BeeNotification.h"
#import "UINavigationController+et.h"
//tool
#import "ETColor.h"
#import "ETLog.h"
//
#import "ETNC.h"
#import "ETStoryboard.h"




@interface ETVC ()

@property (nonatomic, strong) NSMutableDictionary *updateModelWhenViewLoadedBlocks;
@property (nonatomic, strong) NSMutableDictionary *updateModelWhenViewLoadedOnceBlocks;
@property (nonatomic, strong) NSMutableDictionary *updateViewWhenViewdidAppearBlocks;
@property (nonatomic, strong) NSMutableDictionary *updateViewWhenViewdidAppearOnceBlocks;
@property (nonatomic, getter=isViewAppeared) BOOL viewAppeared;

@end

@implementation ETVC
@synthesize
//ui
statusBarStyle      = _statusBarStyle,
navigationBarHidden = _navigationBarHidden,
toolbarHidden       = _toolbarHidden,
titleColor          = _titleColor,
navigationBarImage  = _navigationBarImage,
tabbarImage         = _tabbarImage,
canDragBack,
titleTextAttributes,
showGlobalMessageTip;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self _ETVC_setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self _ETVC_setup];
}

- (void)_ETVC_setup
{
    self.updateModelWhenViewLoadedBlocks = @{}.mutableCopy;
    self.updateModelWhenViewLoadedOnceBlocks = @{}.mutableCopy;
    self.updateViewWhenViewdidAppearBlocks = @{}.mutableCopy;
    self.updateViewWhenViewdidAppearOnceBlocks = @{}.mutableCopy;
    

    self.canDragBack = YES;
    self.navigationBarHidden = NO;
    self.toolbarHidden = YES;
    self.showGlobalMessageTip = YES;
    self.titleColor = [ETColor colorWithRGB:0x212121];
    
    //服务器错误处理
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleServerErrorNotification:) name:ET_SHOW_ERROR_VIEW object:self.operationManager];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleServerErrorNotification:) name:ET_HIDE_NO_CONNECT_ERROR_VIEW object:self.operationManager];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleServerErrorNotification:) name:ET_SHOW_VERSION_UPDATE object:self.operationManager];
}

#pragma mark- LifeCyle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //设置背景、bar隐藏、文字颜色等
    [self.navigationController setNavigationBarImage:self.navigationBarImage];
    self.navigationController.toolbarHidden = self.toolbarHidden;
    self.navigationController.navigationBarHidden = self.navigationBarHidden;
    self.statusBarStyle = self.statusBarStyle;
    
    self.navigationController.navigationBar.titleTextAttributes = self.titleTextAttributes ?: @{NSForegroundColorAttributeName: self.titleColor, NSFontAttributeName: [UIFont systemFontOfSize:18.0f]};
    
    //调用系统启动的block
    [self.updateModelWhenViewLoadedBlocks.copy enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        ETNoParamNoReturnBlock block = obj;
        if (block) {
            block();
        }
    }];
    
    [self.updateModelWhenViewLoadedOnceBlocks.copy enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        ETNoParamNoReturnBlock block = obj;
        if (block) {
            block();
        }
    }];
    
    [self.updateModelWhenViewLoadedOnceBlocks removeAllObjects];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.viewAppeared = YES;
    
    [self.updateViewWhenViewdidAppearBlocks.copy enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        ETNoParamNoReturnBlock block = obj;
        if (block) {
            block();
        }
    }];
    
    [self.updateViewWhenViewdidAppearOnceBlocks.copy enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        ETNoParamNoReturnBlock block = obj;
        if (block) {
            block();
        }
    }];
    
    [self.updateViewWhenViewdidAppearOnceBlocks removeAllObjects];
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.viewAppeared = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ETLogFuncI;
    if ( ! self.view.backgroundColor || [self.view.backgroundColor isEqual:[UIColor clearColor]]) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    //为了隐藏默认的返回按钮，因为是用一个空白按钮隐藏掉默认的返回按钮，所以返回按钮显示...的bug也就不会出现了
    if (!self.navigationItem.leftBarButtonItem) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
    }
    

}

- (void)dealloc
{
    ETLogFuncW;
    [self unobserveAllNotifications];
}

#pragma mark - title color
- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: self.titleColor, NSFontAttributeName: [UIFont systemFontOfSize:18.0f]};
}

#pragma mark - status bar
- (void)setStatusBarStyle:(ETStatusBarStyle)style
{
    //ios10下存在问题
    _statusBarStyle = style;
    if (style == ETStatusBarStyleWhiteFont) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
}

#pragma mark - Tabbar

- (void)setTabbarImage:(UIImage *)tabbarImage
{
    _tabbarImage = tabbarImage;
    [self.tabBarController.tabBar setBackgroundImage:tabbarImage];
    
}
#pragma mark - navigation

- (void)setNavigationBarImage:(UIImage *)aImage
{
    _navigationBarImage = aImage;
    [self.navigationController setNavigationBarImage:_navigationBarImage];
}

- (void)setNavigationBarHidden:(BOOL)navigationBarHidden
{
    _navigationBarHidden = navigationBarHidden;
    if (self.isViewLoaded) {
        [((ETNC *)self.navigationController) setNavigationBarHidden:_navigationBarHidden];
    }
}

- (void)setToolbarHidden:(BOOL)toolbarHidden
{
    _toolbarHidden = toolbarHidden;
    if (self.isViewLoaded) {
        [((ETNC *)self.navigationController) setToolbarHidden:_toolbarHidden];
    }
}

#pragma mark - Orientations
- (BOOL)shouldAutorotate
{
    if (IS_IPAD_DEVICE) {
        return YES;
    } else {
        return NO;
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

#pragma mark - Notification
- (void)handleServerErrorNotification:(NSNotification *)aNotification
{
    //do nothing
}

#pragma mark - for vc perfomace

- (void)updateModelWhenViewLoaded:(ETNoParamNoReturnBlock)aBlock
{
    [self updateModelWhenViewLoaded:aBlock andIdentifier:@"updateModelWhenViewLoaded"];
}

- (void)updateModelWhenViewLoadedOnce:(ETNoParamNoReturnBlock)aBlock
{
    [self updateModelWhenViewLoadedOnce:aBlock andIdentifier:@"updateModelWhenViewLoadedOnce"];
}

-(void)updateViewWhenViewdidAppear:(ETNoParamNoReturnBlock)aBlock
{
    [self updateViewWhenViewdidAppear:aBlock andIdentifier:@"updateViewWhenViewdidAppear"];
}

-(void)updateViewWhenViewdidAppearOnce:(ETNoParamNoReturnBlock)aBlock
{
    [self updateViewWhenViewdidAppearOnce:aBlock andIdentifier:@"updateViewWhenViewdidAppearOnce"];
}

//当vc的view加载完成之后，将要显示的时候，调用传入的block刷新数据
- (void)updateModelWhenViewLoaded:(void (^)(void))aBlock andIdentifier:(NSString *)identifier
{
    self.updateModelWhenViewLoadedBlocks[identifier] = aBlock;
    
    if (self.isViewLoaded && aBlock) {
        aBlock();
    }
}

//当vc的view加载完成之后，将要显示的时候，调用传入的block刷新数据，只调用一次
- (void)updateModelWhenViewLoadedOnce:(void (^)(void))aBlock andIdentifier:(NSString *)identifier
{
    self.updateModelWhenViewLoadedOnceBlocks[identifier] = aBlock;
    
    if (self.isViewLoaded && aBlock) {
        aBlock();
        self.updateModelWhenViewLoadedOnceBlocks[identifier] = nil;
    }
}
//当vc完全呈现之后调用传入的block
- (void)updateViewWhenViewdidAppear:(void (^)(void))aBlock andIdentifier:(NSString *)identifier
{
    self.updateViewWhenViewdidAppearBlocks[identifier] = aBlock;
    
    if (self.isViewAppeared && aBlock) {
        aBlock();
    }
}

//当vc完全呈现之后调用传入的block，只调用一次
- (void)updateViewWhenViewdidAppearOnce:(void (^)(void))aBlock andIdentifier:(NSString *)identifier
{
    self.updateViewWhenViewdidAppearOnceBlocks[identifier] = aBlock;
    
    if (self.isViewAppeared && aBlock) {
        aBlock();
        self.updateViewWhenViewdidAppearOnceBlocks[identifier] = nil;
    }
}

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

//设置sb名称
-(void)setStoryboardName:(NSString *)name{
    [ETStoryboard setStoryboardName:name];
}
//获取默认sb中的vc
-(UIViewController *)viewControllerByName:(NSString *) vcName{
   return  [ETStoryboard viewControllerByName:vcName];
}
//获取指定sb名称下的指定vc
-(UIViewController *)viewControllerBySBName:(NSString *) sbName aVcName:(NSString *) vcName{
   return [ETStoryboard viewControllerBySBName:sbName avcName:vcName];
}
//获得指定名称的view
- (id)nibView:(NSString *)viewName
{
    return [[[NSBundle mainBundle] loadNibNamed:viewName owner:self options:nil] objectAtIndex:0];
}


@end
