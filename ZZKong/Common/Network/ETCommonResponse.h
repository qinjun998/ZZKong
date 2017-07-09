//
//  CommonResponse.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETResponseBase.h"

@interface ETCommonResponse : ETResponseBase

@property (copy, nonatomic) NSString * MessageCode;
@property (copy, nonatomic) NSString * MessageText;

//@property (copy, nonatomic) NSNumber     *code;
//@property (copy, nonatomic) NSString     *msg;
@property (strong, nonatomic) id         body;   //多余字段

@property (assign, nonatomic) BOOL  success;


@end
