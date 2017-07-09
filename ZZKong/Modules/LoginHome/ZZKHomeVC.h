//
//  ECDHomeVC.h
//  ZZKong
//
//  Created by lee on 16/9/20.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "ECDVC.h"

@protocol ECDHomeVCDelegate <NSObject>

- (void)setTabSelectIndex:(NSUInteger)index;

@end

@interface ZZKHomeVC : ECDVC

@property (nonatomic, weak) id<ECDHomeVCDelegate>ecdtbcDelegate;

@end
