//
//  ECDLoginModel.h
//  ZZKong
//
//  Created by lee on 16/10/5.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ETCommonResponse.h"

//{"messageDTO":{"MessageCode":"0","MessageText":"操作成功"},"userId":"1c08253cc37a4a248dc3f20dfba3706b","userPassword":"25d55ad283aa400af464c76d713c07ad",
//"userName":"病人1","userRole":"1","userSex":"0","userBirth":"2017-03-26","userAddress":"湖北省襄阳市","userPhone":"13345678900","userMail":"12345@163.com",
//"userContact":"病人1",
//"userContactPhone":"13345678900",
//"userUpdated":"2017-04-20 00:00:00.0","userStatus":"1","userRight":"0"}


@interface ECDLoginModel : ETCommonResponse

@property (copy, nonatomic) NSString * loginUsername;
@property (copy, nonatomic) NSString * loginPassword;


@property (copy, nonatomic) NSString * userId;
@property (copy, nonatomic) NSString * userPassword;

@property (copy, nonatomic) NSString * userRole;
@property (copy, nonatomic) NSString * userSex;
@property (copy, nonatomic) NSString * userBirth;
@property (copy, nonatomic) NSString * userAddress;
@property (copy, nonatomic) NSString * userPhone;
@property (copy, nonatomic) NSString * userMail;

@property (copy, nonatomic) NSString * userContact;
@property (copy, nonatomic) NSString * userContactPhone;
@property (copy, nonatomic) NSString * userUpdated;
@property (copy, nonatomic) NSString * userStatus;
@property (copy, nonatomic) NSString * userRight;

@property (copy, nonatomic) NSString * userIcon;
@property (copy, nonatomic) NSString * userName;
@property (copy, nonatomic) NSString * userWeichatOpenId;
@property (copy, nonatomic) NSString * userAlipayAccount;
@property (copy, nonatomic) NSString * userAlipayName;


//@property (copy, nonatomic) NSString * MessageCode;
//@property (copy, nonatomic) NSString * MessageText;



-(void)save;
-(void)save:(NSString *) value aKey:(NSString *)key;
+(void)clear;
+(void)clearPassword;
+(ECDLoginModel *)load;

+(NSNumber *)getRemember;  //是否记住用户名和密码
+(void)updateRemember:(NSNumber *) remember; //更新记住用户名和密码
+(NSString *)getUserId;  //获得登录用户userId
+(NSString *)getUserPhone;
+(NSString *)getPassword;

//+(void)updateToken:(NSString *) token;  //更新失效token
//+(NSNumber *)getToken; //单独获得存储的token




@end
