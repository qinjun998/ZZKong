//
//  ECDLoginModel.m
//  ZZKong
//
//  Created by lee on 16/10/5.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ECDLoginModel.h"
#import "ETUserDefault.h"




@implementation ECDLoginModel



+(NSDictionary *) jsonMap {
 
    return @{
             @"userId": @"userId"
             , @"userPassword":@"userPassword"
             , @"userRole":@"userRole"
             , @"userSex":@"userSex"
             , @"userBirth":@"userBirth"
             , @"userAddress":@"userAddress"
             , @"userPhone":@"userPhone"
             , @"userMail":@"userMail"
             , @"userContact":@"userContact"
             , @"userContactPhone":@"userContactPhone"
             , @"userUpdated":@"userUpdated"
             , @"userStatus":@"userStatus"
             , @"userRight":@"userRight"
             , @"userName":@"userName"
             , @"userIcon":@"userIcon"
             };
}



+(NSString *)savingKey:(NSString *)varName {
    return [kECDUserInfoPrefix stringByAppendingFormat:@"_%@", varName];
}



-(void)save{

     [ETUserDefault setValue:self.loginUsername forKey:[[self class] savingKey:@"loginUsername"]];
     [ETUserDefault setValue:self.loginPassword forKey:[[self class] savingKey:@"loginPassword"]];
    
     [ETUserDefault setValue:@(self.success) forKey:[[self class] savingKey:@"success"]];
     [ETUserDefault setValue:self.MessageCode forKey:[[self class] savingKey:@"MessageCode"]];
     [ETUserDefault setValue:self.MessageText forKey:[[self class] savingKey:@"MessageText"]];
    
     [ETUserDefault setValue:self.userId forKey:[[self class] savingKey:@"userId"]];
     [ETUserDefault setValue:self.userPassword forKey:[[self class] savingKey:@"userPassword"]];
     [ETUserDefault setValue:self.userRole forKey:[[self class] savingKey:@"userRole"]];
     [ETUserDefault setValue:self.userSex forKey:[[self class] savingKey:@"userSex"]];
     [ETUserDefault setValue:self.userBirth forKey:[[self class] savingKey:@"userBirth"]];
     [ETUserDefault setValue:self.userAddress forKey:[[self class] savingKey:@"userAddress"]];
    
     [ETUserDefault setValue:self.userPhone forKey:[[self class] savingKey:@"userPhone"]];
     [ETUserDefault setValue:self.userMail forKey:[[self class] savingKey:@"userMail"]];
     [ETUserDefault setValue:self.userContact forKey:[[self class] savingKey:@"userContact"]];
     [ETUserDefault setValue:self.userContactPhone forKey:[[self class] savingKey:@"userContactPhone"]];
     [ETUserDefault setValue:self.userUpdated forKey:[[self class] savingKey:@"userUpdated"]];
     [ETUserDefault setValue:self.userStatus forKey:[[self class] savingKey:@"userStatus"]];
     [ETUserDefault setValue:self.userRight forKey:[[self class] savingKey:@"userRight"]];
    
    [ETUserDefault setValue:self.userIcon forKey:[[self class] savingKey:@"userIcon"]];
    [ETUserDefault setValue:self.userName forKey:[[self class] savingKey:@"userName"]];
    [ETUserDefault setValue:self.userWeichatOpenId forKey:[[self class] savingKey:@"userWeichatOpenId"]];
    [ETUserDefault setValue:self.userAlipayAccount forKey:[[self class] savingKey:@"userAlipayAccount"]];
    [ETUserDefault setValue:self.userAlipayName forKey:[[self class] savingKey:@"userAlipayName"]];
}

-(void)save:(NSString *) value aKey:(NSString *)key{
    [ETUserDefault setValue:value forKey:[[self class] savingKey:key]];
}


+(void)clear{
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"success"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"MessageCode"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"MessageText"]];
    
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userId"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userPassword"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userRole"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userSex"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userBirth"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userAddress"]];
    
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userPhone"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userMail"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userContact"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userContactPhone"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userUpdated"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userStatus"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userRight"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userIcon"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userName"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userWeichatOpenId"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userAlipayAccount"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"userAlipayName"]];

    
}



//修改密码之后清理保存密码
+(void)clearPassword{
       [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"loginPassword"]];
}

+(ECDLoginModel *)load{
    
    ECDLoginModel *login= [ECDLoginModel new];
    login.loginUsername = [ETUserDefault getValueForKey:[[self class] savingKey:@"loginUsername"]];
    login.loginPassword = [ETUserDefault getValueForKey:[[self class] savingKey:@"loginPassword"]];

    login.success = [[ETUserDefault getValueForKey:[[self class] savingKey:@"success"]] boolValue];
    login.MessageCode =[ETUserDefault getValueForKey:[[self class] savingKey:@"MessageCode"]];
    login.MessageText =[ETUserDefault getValueForKey:[[self class] savingKey:@"MessageText"]];
    
    login.userId = [ETUserDefault getValueForKey:[[self class] savingKey:@"userId"]];
    login.userPassword =[ETUserDefault getValueForKey:[[self class] savingKey:@"userPassword"]];
    login.userRole =[ETUserDefault getValueForKey:[[self class] savingKey:@"userRole"]];
    login.userSex = [ETUserDefault getValueForKey:[[self class] savingKey:@"userSex"]];
    login.userBirth =[ETUserDefault getValueForKey:[[self class] savingKey:@"userBirth"]];
    login.userAddress =[ETUserDefault getValueForKey:[[self class] savingKey:@"userAddress"]];

    
    login.userPhone =[ETUserDefault getValueForKey:[[self class] savingKey:@"userPhone"]];
    login.userMail =[ETUserDefault getValueForKey:[[self class] savingKey:@"userMail"]];
    login.userContact =[ETUserDefault getValueForKey:[[self class] savingKey:@"userContact"]];
    login.userContactPhone =[ETUserDefault getValueForKey:[[self class] savingKey:@"userContactPhone"]];
    login.userUpdated =[ETUserDefault getValueForKey:[[self class] savingKey:@"userUpdated"]];
    login.userStatus =[ETUserDefault getValueForKey:[[self class] savingKey:@"userStatus"]];
    login.userRight =[ETUserDefault getValueForKey:[[self class] savingKey:@"userRight"]];
    login.userIcon =[ETUserDefault getValueForKey:[[self class] savingKey:@"userIcon"]];
    login.userName =[ETUserDefault getValueForKey:[[self class] savingKey:@"userName"]];
    login.userWeichatOpenId =[ETUserDefault getValueForKey:[[self class] savingKey:@"userWeichatOpenId"]];
    login.userAlipayAccount =[ETUserDefault getValueForKey:[[self class] savingKey:@"userAlipayAccount"]];
    login.userAlipayName =[ETUserDefault getValueForKey:[[self class] savingKey:@"userAlipayName"]];

    
    return login;
}

+(void)updateRemember:(NSNumber *) remember{
    [ETUserDefault setValue:remember forKey:[[self class] savingKey:@"remember"]];
}

+(NSNumber *)getRemember{
    return [ETUserDefault getValueForKey:[[self class] savingKey:@"remember"]];
}


+(NSString *)getUserId{
    return [ETUserDefault getValueForKey:[[self class] savingKey:@"userId"]];
}

+(NSString *)getUserPhone{
    return [ETUserDefault getValueForKey:[[self class] savingKey:@"userPhone"]];
}

+(NSString *)getPassword{
    return [ETUserDefault getValueForKey:[[self class] savingKey:@"userPassword"]];
}







@end
