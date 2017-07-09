//
//  ECDHomeVC.m
//  ZZKong
//  主界面
//  Created by lee on 16/9/20.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ZZKHomeVC.h"
#import "ETVerticalButton.h"
#import "NSString+plus.h"


#import "ECDUserDetailModel.h"
#import "ECDAppStatus.h"

#import <MagicalRecord/MagicalRecord.h>
#import "ETCircleTouchImageView.h"

#import <ImagePlayerView/ImagePlayerView.h>
#import "ECDTableViewCell.h"
#import "UIView+loading.h"
#import "UIViewController+loading.h"








@interface ZZKHomeVC ()<UITableViewDataSource,UITableViewDelegate,ImagePlayerViewDelegate>
{
       NSArray * _body;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet ImagePlayerView *imagePlayerView;


@property (strong, nonatomic) UILabel *lblEtBalance;

@property(nonatomic,strong)NSArray *imageNames;
@property(nonatomic,strong)NSArray *images;
@property (nonatomic, strong) NSCache *imageCache;

@end

@implementation ZZKHomeVC


#pragma mark LifeCycle


-(NSCache *)imageCache{
    if(!_imageCache){
         _imageCache = [NSCache new];
    }
    return _imageCache;
}


-(NSArray *) imageNames{
    if(!_imageNames){
        _imageNames = @[@"head1280",@"homehead",@"head1280"];
    }
    return _imageNames;
}

-(NSArray *) images{
    NSArray * returnArray = nil;
    NSMutableArray *arrays = [[NSMutableArray alloc] init];
    if(self.imageNames){
        for (int i=0; i<self.imageNames.count; i++) {
            [arrays addObject:[UIImage imageNamed:self.imageNames[i]]];
        }
        returnArray =  [arrays copy];
    }
    return returnArray;
}



-(void) loadPageData{

//    [self getNotice];
//    [self getUserInfo];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loadPageData)
                                                 name:NotificationLogined object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loadPageData)
                                                 name:NotificationRefreshLogin object:nil];
}

-(void)initUI{
    [self initNavigationBar];
    [self initMainView];
}


-(void)initNavigationBar{
    //全屏状态下需要设置两个值
//    self.navigationBarHidden = YES;
//    self.statusBarStyle = ETStatusBarStyleWhiteFont;
    self.title = @"首页";
}

-(void)initMainView{
    self.imagePlayerView.backgroundColor = [UIColor purpleColor];
    self.imagePlayerView.imagePlayerViewDelegate = self;
    self.imagePlayerView.scrollInterval = 4.0f;
    self.imagePlayerView.pageControlPosition = ICPageControlPosition_BottomCenter;
    self.imagePlayerView.hidePageControl = NO;
    self.imagePlayerView.endlessScroll = YES;
    self.imagePlayerView.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.imagePlayerView reloadData];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = UIColorFromRGB(0xeaeef9);
}




#pragma mark - UITableView DataSource & Delegate

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ECDTableViewCell *cell= nil;
//    switch (indexPath.section) {
//        case 0:
//            cell = [tableView dequeueReusableCellWithIdentifier:[MJHomeCell2 cellReuseIdentifier] forIndexPath:indexPath];
//            break;
//        case 1:
//            cell = [tableView dequeueReusableCellWithIdentifier:[MJHomeCell3 cellReuseIdentifier] forIndexPath:indexPath];
//            cell.delegate = self;
//            break;
//        default:
//            break;
//    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}



//
//-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 0.01f;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    if (section==4) {
//        return 15;
//    }
//    return 1;
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *view = [UIView new];
//    view.backgroundColor = [UIColor clearColor];
//    return view;
//    
//}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"----");
//    switch (indexPath.section) {
//        case 0:   //我的账户
//            [self myAccountList];
//            break;
//        case 1:   //我的等级
//            [self myLevel];
//            break;
//        case 2:   //我的人脉
//            [self myConnections];
//            break;
//        case 3:   //我的消息
//            [self myMessages];
//            break;
//        case 4:   //收藏的商家
//            [self collectionBusiness];
//            break;
//        case 5:   //收藏的传单
//            [self collectionLeaflet];
//            break;
//        default:
//            break;
//    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 40;
            break;
        case 1:
             return 201;
            break;
        default:
            break;
    }
    return  0;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark 获取数据
//公告
-(void)getNotice{
//    @weakify(self)
//    [[self getNoticeSignal] subscribeNext:^(NSDictionary *result) {
//        @strongify(self)
//        if (result) {
//            _body = result[@"body"];
//            NSMutableString *string = [NSMutableString new];
//            if ([result[@"code"] isEqual:@200]) {
//                [_body enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                    [string appendFormat:@"%@  ",obj[@"title"]];
//                }];
//                [self setAnnouncementsText:string];
//                
//                [self saveNotice:_body];  
//            }
//        }else{
//            [self setAnnouncementsText:@""];
//        }
//    }];
}

//-(void)saveNotice:(NSArray *)noticeList{
//   NSManagedObjectContext * context = [NSManagedObjectContext MR_defaultContext];
//    [ECDNoticeModel deleteAllNotice:context];
//    for(int i=0;i<noticeList.count;i++){
//        NSDictionary *data = (NSDictionary *)noticeList[i];
//        if(![ECDNoticeModel findLocalNoticeById:[data[@"id"] longLongValue] inContext:context]){
//            ECDNoticeVO *noticeVO  = [ECDNoticeVO new];
//            noticeVO.appType = [data[@"appType"] longLongValue];
//            noticeVO.nid = [data[@"id"] shortValue];
//            noticeVO.title = data[@"title"];
//            noticeVO.detail = data[@"detail"];
//            noticeVO.pubTime = data[@"pubTime"];
//            [ECDNoticeModel saveLocalNotice:noticeVO inContext:context];
//        }
//
//    }
//}


-(RACSignal *)getNoticeSignal {
    ETCommonRequest *request = [ETCommonRequest new];
    request.relativePath =@"service/notices";
    request.method = @"GET";
    return [ETCommonRequest commonApiSignal:request queue:nil isModel:NO];
}


-(void)getUserInfo{
     [self showLoading];
    @weakify(self)
    [[self getUserInfoSignal] subscribeNext:^(ECDUserDetailModel *result) {
        @strongify(self)
        if (result.success) {
//            self.userInfo = result;
            [result saveUserDetail];
//            [self performSelectorOnMainThread:@selector(updateUI:) withObject:result  waitUntilDone:NO];
        }else{
//            ETToast(result.msg);
            [ECDAppStatus logout];
        }
      [self hideLoading];
    }];
}




-(RACSignal *)getUserInfoSignal {
    ETCommonRequest *request = [ETCommonRequest new];
    [request setResponseModelClass:[ECDUserDetailModel class]];
//       [request setResponseModelClass:@"ECDUserDetailModel"];
    request.relativePath =@"user";
    request.method = @"GET";
    return [ETCommonRequest commonApiSignal:request queue:nil];
}




#pragma mark - ImagePlayerViewDelegate
- (NSInteger)numberOfItems
{
    return self.images.count;
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index
{
    // recommend to use SDWebImage lib to load web image
    //    [imageView setImageWithURL:[self.imageURLs objectAtIndex:index] placeholderImage:nil];
    
//    NSURL *imageURL = [self.imageURLs objectAtIndex:index];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        UIImage *image = [self.imageCache objectForKey:imageURL.absoluteString];
//        if (!image) {
//            NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
//            image = [UIImage imageWithData:imageData];
//            [self.imageCache setObject:self.images[index] forKey:self.imageNames[index]];
//        }
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI
            imageView.image = self.images[index];
        });
    });
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index
{
    NSLog(@"did tap index = %d", (int)index);
}
@end
