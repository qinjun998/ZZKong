//
//  ETTVC.m
//  ZZKong
//
//  Created by lee on 16/9/21.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETTVC.h"
#import "ETStoryboard.h"
#import "UINavigationController+et.h"
#import "ETNC.h"
#import "NSObject+BeeNotification.h"


@interface ETTVC ()

@end

@implementation ETTVC

@synthesize
statusBarStyle      = _statusBarStyle,
navigationBarHidden = _navigationBarHidden,
toolbarHidden       = _toolbarHidden,
titleColor          = _titleColor,
navigationBarImage  = _navigationBarImage,
tabbarImage         = _tabbarImage,
canDragBack,
titleTextAttributes,
showGlobalMessageTip;


#pragma mark- LifeCyle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //设置背景、bar隐藏、文字颜色等
    [self.navigationController setNavigationBarImage:self.navigationBarImage];
    self.navigationController.toolbarHidden = self.toolbarHidden;
    self.navigationController.navigationBarHidden = self.navigationBarHidden;
    self.statusBarStyle = self.statusBarStyle;

}

- (void)viewDidLoad {
    [super viewDidLoad];
//    if ( ! self.view.backgroundColor || [self.view.backgroundColor isEqual:[UIColor clearColor]]) {
//        self.view.backgroundColor = [UIColor whiteColor];
//    }
    
    //为了隐藏默认的返回按钮，因为是用一个空白按钮隐藏掉默认的返回按钮，所以返回按钮显示...的bug也就不会出现了
    if (!self.navigationItem.leftBarButtonItem) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)dealloc
{
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


/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
 */

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
