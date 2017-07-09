//
//  CommonResponse.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETCommonResponse.h"

@implementation ETCommonResponse

+(NSDictionary *) baseJSONKeyPathsByPropertyKey {
    
    return @{
             @"MessageCode": @"MessageCode"
             , @"MessageText": @"MessageText"
//             , @"body": @"body"
             };
    
}

- (BOOL)success{
//    if ([_MessageText isKindOfClass:[NSNumber class]]) {
      if ([_MessageCode isKindOfClass:[NSString class]]) {
        return ([_MessageCode integerValue]==0);
    }
    return NO;
}


@end
