//
//  ResponseBase.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETResponseBase.h"

@implementation ETResponseBase



+(NSDictionary *) JSONKeyPathsByPropertyKey {
    
    NSMutableDictionary *finalMap = [self baseJSONKeyPathsByPropertyKey].mutableCopy;
    NSDictionary *jsonMap = [self jsonMap];
    if (jsonMap) {
        [finalMap setValuesForKeysWithDictionary:jsonMap];
    }
    
    return finalMap;
}


+(NSDictionary *) jsonMap {
    
    return @{};
    
}

+(NSDictionary *) baseJSONKeyPathsByPropertyKey {
    
    return @{};
    
}


-(void)setNilValueForKey:(NSString *)key {
    [self setValue:@0 forKey:key];
}
@end
