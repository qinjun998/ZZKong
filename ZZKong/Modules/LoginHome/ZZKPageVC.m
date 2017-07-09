//
//  ZZKPageVC.m
//  ZZKong
//
//  Created by lee on 2017/7/9.
//  Copyright © 2017年 zzk. All rights reserved.
//

#import "ZZKPageVC.h"

@interface ZZKPageVC ()

@end

@implementation ZZKPageVC


-(void) backColor:(UIColor *) bgColor aTitle:(NSString *)title{
    self.title = title;
//  [self setNaviButtonText:title isLeft:NO];
    
    self.navigationBarHidden = YES;
    [self setNaviButtonType:ETNaviButtonReturn isLeft:YES];
    self.view.backgroundColor = bgColor;
}


- (void)viewDidLoad {
    

    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
