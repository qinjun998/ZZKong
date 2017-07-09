//
//  ETWebVC.h
//  ZZKong
//
//  Created by lee on 16/10/7.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETVC.h"


@interface ETWebVC : ETVC

-(instancetype)initWithUrl:(NSString *)aURL naviTitle:(NSString *)aNaviTitle;

@property (nonatomic, strong)UIWebView *webView;

@property (copy) NSString *urlStr;
@property (copy) NSString *naviTitle;


@end
