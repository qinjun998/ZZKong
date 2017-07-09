//
//  NSString+JSON.h
//  ZZKong
//
//  Created by lee on 16/10/21.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)

+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;
+(NSString *) jsonStringWithArray:(NSArray *)array;
+(NSString *) jsonStringWithString:(NSString *) string;
+(NSString *) jsonStringWithObject:(id) object;

-(id)JSONValue;
-(NSData *)JSONData;
-(NSString *)JSONString;

@end
