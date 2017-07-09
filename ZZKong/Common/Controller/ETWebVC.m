//
//  ETWebVC.m
//  ZZKong
//
//  Created by lee on 16/10/7.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETWebVC.h"

#define WEB_PREFIX_HTTP     @"http://"
#define WEB_PREFIX_HTTPS     @"https://"


@interface ETWebVC ()<UIWebViewDelegate>

@end

@implementation ETWebVC

-(instancetype)initWithUrl:(NSString *)aURL naviTitle:(NSString *)aNaviTitle {
    self = [super init];
    if (self) {
        _naviTitle = aNaviTitle;
        _urlStr = aURL;
    }
    return self;
}

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        _showUrlBar = YES;
//    }
//    return self;
//}

-(void)dealloc
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    _webView.delegate = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = _naviTitle.length ? _naviTitle : @"网页";
    [self initViews];
}

-(void)initViews {
    
    _webView = [UIWebView new];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self startRequest];
}


#pragma mark - start request
-(void)startRequest {
    if (_urlStr
        && [_urlStr rangeOfString:WEB_PREFIX_HTTP].location == NSNotFound
        && [_urlStr rangeOfString:WEB_PREFIX_HTTPS].location == NSNotFound)
    {
        _urlStr = [NSString stringWithFormat:@"%@%@", WEB_PREFIX_HTTP, _urlStr];
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]];
    [_webView loadRequest:request];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSLog(@"webview loading: {%@}", _urlStr);
}

#pragma mark - web view delegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
