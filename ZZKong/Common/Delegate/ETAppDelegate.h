//
//  ETAppDelegate.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETWindow.h"

@interface ETAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) ETWindow *window;
@property (nonatomic, strong) ETWindow *pcWindow;
@property (nonatomic, strong) ETWindow *topWindow;

- (void)endEditing;

@end
