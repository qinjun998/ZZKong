//
//  ETCommonRequest+NetworkError.m
//  ZZKong
//
//  Created by lee on 2016/11/28.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "YTKBaseRequest+NetworkError.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "ETCommonRequest.h"

@implementation YTKBaseRequest (NetworkError)

-(NSError *)timeoutError {
    return [ETCommonRequest createTimeoutError:self.userInfo];
}

+(NSError *)createTimeoutError:(NSDictionary *)userInfo {
    [SVProgressHUD dismiss];
    return [NSError errorWithDomain:@"网络好像有点问题哦，请稍候再试" code:REQUEST_ERROR_CODE_TIMEOUT userInfo:userInfo];
}


@end
