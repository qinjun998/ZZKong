//
//  NSObject+category.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "NSObject+category.h"

#import "ETLog.h"

@implementation NSObject (category)

static char associatedObjectNamesKey;

- (void)setAssociatedObjectNames:(NSMutableArray *)associatedObjectNames
{
    objc_setAssociatedObject(self, &associatedObjectNamesKey, associatedObjectNames,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)associatedObjectNames
{
    NSMutableArray *array = objc_getAssociatedObject(self, &associatedObjectNamesKey);
    if (!array) {
        array = [NSMutableArray array];
        [self setAssociatedObjectNames:array];
    }
    return array;
}

- (void)objc_setAssociatedObject:(NSString *)propertyName value:(id)value policy:(objc_AssociationPolicy)policy
{
//    objc_setAssociatedObject(self, objc_unretainedPointer(propertyName), value, policy);
    
    objc_setAssociatedObject(self, (__bridge void *)(propertyName), value, policy);
    [self.associatedObjectNames addObject:propertyName];
}

- (id)objc_getAssociatedObject:(NSString *)propertyName
{
    //return objc_getAssociatedObject(self, objc_unretainedPointer(propertyName));
    return objc_getAssociatedObject(self, (__bridge void *)(propertyName));
}

- (void)objc_removeAssociatedObjects
{
    [self.associatedObjectNames removeAllObjects];
    objc_removeAssociatedObjects(self);
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    ETLogW(@"setValue %@ forUndefinedKey %@",value,key);
}

- (void)setNilValueForKey:(NSString *)key
{
    ETLogW(@"setNilValue forKey %@",key);
}


@end
