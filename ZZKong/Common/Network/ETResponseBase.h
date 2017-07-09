//
//  ResponseBase.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface ETResponseBase : MTLModel <MTLJSONSerializing>

/// basic json key paths for all models
+(NSDictionary *) baseJSONKeyPathsByPropertyKey;

/// for subclass to overwrite, defining its own json-to-property map
+(NSDictionary *) jsonMap;


@end
