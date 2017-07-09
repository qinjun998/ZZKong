//
//  ECDTBC.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ECDTBC.h"

//view
#import "ETTabBar.h"
#import "ECDTabBarItem.h"
#import "ETNC.h"
#import "ECDVC.h"
#import "ECDNC.h"
#import "ECDTVC.h"
#import "UIView+create.h"
#import "UIImage+tool.h"

#import "ETStoryboard.h"
#import "ZZKHomeVC.h"
#import "ZZKPageVC.h"

#import "ZZKLoginVC.h"
//#import "MJOrderListVC.h"
//#import "MJOrderIndexVC.h"
//#import "MJMessageListVC.h"

@interface ETTabBar ()

@property (nonatomic, copy) NSArray *items;
@property (nonatomic, weak)ETTabBarItem *selectedItem;

@end
//ECDHomeVCDelegate选中item
@interface ECDTBC () <ETTabBarDelegate,ECDHomeVCDelegate>

@property (nonatomic, strong) ETTabBar *customTabBar;

@property (nonatomic, assign) NSUInteger lastSelectedIndex;

@end

@implementation ECDTBC


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self _ECDTBC_setup];
    }
    return self;
}

- (void)_ECDTBC_setup
{
    self.delegate = self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self _ECDTBC_setupVCs];
    [self _ECDTBC_setupViews];
    
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleLogin) name:NotificationLogined object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orderTab) name:@"NotificationOrderNewOrder" object:nil];
}

- (void)_ECDTBC_setupViews
{
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    self.tabBar.itemWidth = 0;
    self.customTabBar = [ETTabBar viewWithFrame:CGRectMake(0, 0, UI_CURRENT_SCREEN_WIDTH, 49)];
    self.customTabBar.backgroundColor = [UIColor whiteColor];
    self.customTabBar.delegate = self;
    
    [self.tabBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    
    [self.tabBar addSubview:self.customTabBar];
    
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBar.translucent = NO;

    
    ECDTabBarItemVO *fristItemVO = [ECDTabBarItemVO new];
    fristItemVO.title = @"首页";
    fristItemVO.image = [UIImage imageNamed:@"tabbar_home_20"];
    fristItemVO.selectedImage = [UIImage imageNamed:@"tabbar_home_sel_20"];
    
    ECDTabBarItemVO *cashItemVO = [ECDTabBarItemVO new];
    cashItemVO.title = @"任务列表";
    
    cashItemVO.image = [UIImage imageNamed:@"tabbar_withdraw_20"];
    cashItemVO.selectedImage = [UIImage imageNamed:@"tabbar_withdraw_sel_20"];
    
    ECDTabBarItemVO *myItemVO = [ECDTabBarItemVO new];
    myItemVO.title = @"我的";
    myItemVO.image = [UIImage imageNamed:@"tabbar_my_20"];
    myItemVO.selectedImage = [UIImage imageNamed:@"tabbar_my_sel_20"];
    
    ECDTabBarItemVO *moreItemVO = [ECDTabBarItemVO new];
    moreItemVO.title = @"用户中心";
    moreItemVO.image = [UIImage imageNamed:@"tabbar_more_20"];
    moreItemVO.selectedImage = [UIImage imageNamed:@"tabbar_more_sel_20"];
    
    NSArray *vos = @[fristItemVO, cashItemVO, myItemVO, moreItemVO];
    
    NSMutableArray *items = @[].mutableCopy;

    WEAK_SELF;
    [vos enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        STRONG_SELF;
        ECDTabBarItem *item = [ECDTabBarItem new];
        item.defaultVO = obj;
//        item.showIndicate = YES;
//        item.badgeValue = [@(idx) stringValue];
        [items addObject:item];
        [self.viewControllers[idx] setTabbarItem:item];
    }];
    self.customTabBar.items = items.copy;

}


-(void)handleLogin {
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UINavigationController class]]) {
            [(UINavigationController *)obj popToRootViewControllerAnimated:NO];
        }
    }];
    
    self.selectedIndex = 0; 
}

//tab对应的页面初始化设置
- (void)_ECDTBC_setupVCs
{
    
    ZZKPageVC *vc1 = [[ZZKPageVC alloc] init];
    [vc1 backColor:[UIColor redColor] aTitle:@"首页"] ;
    ZZKPageVC *vc2 = [[ZZKPageVC alloc] init];
    [vc2 backColor:[UIColor blueColor] aTitle:@"任务列表"] ;
    ZZKPageVC *vc3 = [[ZZKPageVC alloc] init];
    [vc3 backColor:[UIColor purpleColor] aTitle:@"我的"] ;
    ZZKPageVC *vc4 = [[ZZKPageVC alloc] init];
    [vc4 backColor:[UIColor brownColor] aTitle:@"用户中心"] ;
    
    ECDNC *nc1 = [[ECDNC alloc] initWithRootViewController:vc1];
    ECDNC *nc2 = [[ECDNC alloc] initWithRootViewController:vc2];
    ECDNC *nc3 = [[ECDNC alloc] initWithRootViewController:vc3];
    ECDNC *nc4 = [[ECDNC alloc] initWithRootViewController:vc4];
    
    [self setViewControllers:@[nc1, nc2, nc3, nc4] animated:NO];
    
    //首页页面设置
//    [ETStoryboard setStoryboardName:@"Login"];
//    ECDHomeVC *vc1 = (ECDHomeVC *)[ETStoryboard viewControllerByName:@"ECDHomeVC"]; //for test
//    vc1.ecdtbcDelegate = self;
//    ECDTVC *vc2 =  (ECDTVC *)[MJOrderIndexVC new];
//    ECDTVC *vc3 = (ECDTVC *)[ETStoryboard viewControllerBySBName:@"Message" avcName:@"MJMessageListVC"];
//    ECDTVC *vc4 = (ECDTVC *)[ETStoryboard viewControllerBySBName:@"MyAccount" avcName:@"MJPersonCenterVC"];
//    
//    ECDNC *nc1 = [[ECDNC alloc] initWithRootViewController:vc1];
//    ECDNC *nc2 = [[ECDNC alloc] initWithRootViewController:vc2];
//    ECDNC *nc3 = [[ECDNC alloc] initWithRootViewController:vc3];
//    ECDNC *nc4 = [[ECDNC alloc] initWithRootViewController:vc4];
//    
//    [self setViewControllers:@[nc1, nc2, nc3, nc4] animated:NO];
    
}



#pragma mark - ETTBCDelegate

- (void)customTabBar:(ETTabBar *)tabBar didSelectItem:(ETTabBarItem *)item
{
    
    self.customTabBar.selectedItem = item;
    [super setSelectedIndex:self.customTabBar.selectedIndex];
    //custom tabbar
    if ([self.selectedViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nc = (id)self.selectedViewController;
        UIViewController *vc = nc.topViewController;
        self.tabBar.hidden = vc.hidesBottomBarWhenPushed;
    }
    
    static NSInteger count = 0;
    if (self.selectedIndex != self.lastSelectedIndex) {
        count = 0;
    }
    else {
        count++;
    }
    
    //如果选中VC是NC
    //    if ([self.selectedViewController isKindOfClass:[UINavigationController class]]) {
    //        UIViewController *vc = [(UINavigationController *)self.selectedViewController topViewController];
    
    //         UINavigationController *vc = [(UINavigationController *)self.selectedViewController topViewController];
    //        [vc repeateClickTabBarItem:@(count)];
    //    }
    //本次选中项不等于上次选中项
    //    if (self.selectedIndex != self.lastSelectedIndex) {
    //        ETVC *afromVc = nil;
    //        UIViewController *vc = self.viewControllers[self.lastSelectedIndex]; //上次
    //        if ([vc isKindOfClass:[UINavigationController class]]) {
    //            UINavigationController *nc = (id)vc;
    //            afromVc = (id)nc.topViewController;
    //        }
    //
    //        ETVC *aDestVC = nil;
    //        vc = self.selectedViewController;   //本次选中
    //        if ([vc isKindOfClass:[UINavigationController class]]) {
    //            UINavigationController *nc = (id)vc;
    //            aDestVC = (id)nc.topViewController;
    //        }
    //
    //    }
    
    self.lastSelectedIndex = self.selectedIndex;
}

- (void)enterLastTab
{
    [self customTabBar:self.customTabBar didSelectItem:self.customTabBar.items[self.lastSelectedIndex]];
    //当切换tab的时候，如果tabbar的显示状态不一样，那么tbc的显示会有问题，所以要强制刷新一下
    [self.view setNeedsUpdateConstraints];
    [self.view setNeedsLayout];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    
    [self customTabBar:self.customTabBar didSelectItem:self.customTabBar.items[selectedIndex]];
    
    //当切换tab的时候，如果tabbar的显示状态不一样，那么tbc的显示会有问题，所以要强制刷新一下
    [self.view setNeedsUpdateConstraints];
    [self.view setNeedsLayout];
}

//首页跳转到订单管理tab
-(void)orderTab{
      [self setSelectedIndex:1];
}


- (void)setTabSelectIndex:(NSUInteger)index{
    [self setSelectedIndex:index];
}

@end
