//
//  ETTVC.h
//  ZZKong
//
//  Created by lee on 16/9/21.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETVC.h"

@interface ETTVC : UITableViewController<ETUIKitDelegate>



//设置sb名称
-(void)setStoryboardName:(NSString *)name;
//获取默认sb中的vc

-(UIViewController *)viewControllerByName:(NSString *) vcName;

//获取指定sb名称下的指定vc
-(UIViewController *)viewControllerBySBName:(NSString *) sbName aVcName:(NSString *) vcName;



@end
