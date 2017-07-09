//
//  ECDUserDetailModel.m
//  ZZKong
//
//  Created by lee on 16/10/12.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ECDUserDetailModel.h"
#import "ETUserDefault.h"

static  ECDUserDetailModel *loginDetail;

@implementation ECDUserDetailModel

+(NSDictionary *) jsonMap {
    return @{
             @"uid": @"body.uid"
             , @"lv": @"body.lv"
             , @"mobile": @"body.mobile"
             , @"name": @"body.name"
             , @"sex": @"body.sex"
             , @"birthday": @"body.birthday"
             , @"exp": @"body.exp"
             , @"subCount": @"body.subCount"
             , @"teamCount": @"body.teamCount"
             , @"coin": @"body.coin"
             , @"idCard": @"body.idCard"
             , @"lastOnline": @"body.lastOnline"
             };
}




+(NSString *)savingKey:(NSString *)varName {
    return [kECDUserInfoPrefix stringByAppendingFormat:@"_%@", varName];
}

-(void)saveUserDetail{
    [ETUserDefault setValue:self.uid forKey:[[self class] savingKey:@"uid"]];
    [ETUserDefault setValue:self.lv forKey:[[self class] savingKey:@"lv"]];
    [ETUserDefault setValue:self.mobile forKey:[[self class] savingKey:@"mobile"]];
    [ETUserDefault setValue:self.name forKey:[[self class] savingKey:@"name"]];
    [ETUserDefault setValue:self.sex forKey:[[self class] savingKey:@"sex"]];
    [ETUserDefault setValue:self.birthday forKey:[[self class] savingKey:@"birthday"]];
    [ETUserDefault setValue:self.exp forKey:[[self class] savingKey:@"exp"]];
    [ETUserDefault setValue:self.subCount forKey:[[self class] savingKey:@"subCount"]];
    [ETUserDefault setValue:self.teamCount forKey:[[self class] savingKey:@"teamCount"]];
    [ETUserDefault setValue:self.coin forKey:[[self class] savingKey:@"coin"]];
    [ETUserDefault setValue:self.idCard forKey:[[self class] savingKey:@"idCard"]];
    [ETUserDefault setValue:self.lastOnline forKey:[[self class] savingKey:@"lastOnline"]];
}

+(void)clearUserDetail{
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"uid"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"lv"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"mobile"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"name"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"sex"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"birthday"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"exp"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"subCount"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"teamCount"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"coin"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"idCard"]];
    [ETUserDefault setValue:nil forKey:[[self class] savingKey:@"lastOnline"]];
    
}

+(ECDUserDetailModel *)loadUserDetail{
    if (!loginDetail) {
        loginDetail = [ECDUserDetailModel new];
    }
    
    loginDetail.uid = [ETUserDefault getValueForKey:[[self class] savingKey:@"uid"]];
    loginDetail.lv = [ETUserDefault getValueForKey:[[self class] savingKey:@"lv"]];
    loginDetail.mobile = [ETUserDefault getValueForKey:[[self class] savingKey:@"mobile"]];
    loginDetail.name =[ETUserDefault getValueForKey:[[self class] savingKey:@"name"]];
    loginDetail.sex =[ETUserDefault getValueForKey:[[self class] savingKey:@"sex"]];
    loginDetail.birthday = [ETUserDefault getValueForKey:[[self class] savingKey:@"birthday"]];
    loginDetail.exp =[ETUserDefault getValueForKey:[[self class] savingKey:@"exp"]];
    loginDetail.subCount =[ETUserDefault getValueForKey:[[self class] savingKey:@"subCount"]];
    loginDetail.teamCount = [ETUserDefault getValueForKey:[[self class] savingKey:@"teamCount"]];
    loginDetail.coin =[ETUserDefault getValueForKey:[[self class] savingKey:@"coin"]];
    loginDetail.idCard =[ETUserDefault getValueForKey:[[self class] savingKey:@"idCard"]];
    loginDetail.lastOnline =[ETUserDefault getValueForKey:[[self class] savingKey:@"lastOnline"]];
    
    return loginDetail;
}

+(void)updateCoin:(NSNumber *) coin{
    [ETUserDefault setValue:coin forKey:[[self class] savingKey:@"coin"]];
}

+(NSNumber *)getLat{
    return [ETUserDefault getValueForKey:[[self class] savingKey:@"lat"]];
}

+(NSString *)getAdcode{
    return [ETUserDefault getValueForKey:[[self class] savingKey:@"adcode"]];
}
+(void)updateAdcode:(NSString *) adcode{
    [ETUserDefault setValue:adcode forKey:[[self class] savingKey:@"adcode"]];
}

+(void)updateLat:(NSNumber *) lat{
    [ETUserDefault setValue:lat forKey:[[self class] savingKey:@"lat"]];
}

+(NSNumber *)getLng{
    return [ETUserDefault getValueForKey:[[self class] savingKey:@"lng"]];
}

+(void)updateLng:(NSNumber *) lng{
    [ETUserDefault setValue:lng forKey:[[self class] savingKey:@"lng"]];
}


@end
