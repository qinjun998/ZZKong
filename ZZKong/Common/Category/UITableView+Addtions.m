//
//  UITableView+Addtions.m
//  ZZKong
//
//  Created by lee on 16/9/29.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "UITableView+Addtions.h"

@implementation UITableView (Addtions)

- (void)hideFooterSeparatorLine{
    UIView *view = [[UIView alloc] init];
    [view setBackgroundColor:[UIColor clearColor]];
    self.tableFooterView = view;
}

- (void)scrollToTop{
       [self setContentOffset:CGPointZero animated:YES];
}

@end
