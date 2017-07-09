//
//  ETCommonRequest+NetworkError.h
//  ZZKong
//
//  Created by lee on 2016/11/28.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "YTKBaseRequest.h"

#define REQUEST_ERROR_CODE_TIMEOUT       (-999)

@interface YTKBaseRequest (NetworkError)


-(NSError *)timeoutError;
+(NSError *)createTimeoutError:(NSDictionary *)userInfo;

@end
