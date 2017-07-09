//
//  ETContainerController.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+base.h"

@interface ETContainerController : UIViewController

//call child view controllers life cycle methods
- (void)callChildVCsViewWillAppear:(BOOL)animated;
- (void)callChildVCsViewDidAppear:(BOOL)animated;
- (void)callChildVCsViewWillDisappear:(BOOL)animated;
- (void)callChildVCsViewDidDisappear:(BOOL)animated;

@end
