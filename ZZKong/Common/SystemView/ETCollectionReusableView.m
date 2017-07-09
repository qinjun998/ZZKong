//
//  ETCollectionReusableView.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETCollectionReusableView.h"
//category
#import "NSObject+BeeNotification.h"

@implementation ETCollectionReusableView

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

+ (UINib *)nib{
    NSString *className = NSStringFromClass([self class]);
    return [UINib nibWithNibName:className bundle:nil];
}

- (void)updateWithCellData:(id)aData
{
    
}

+ (CGSize)sizeForCellData:(id)aData
{
    return CGSizeZero;
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}

@end
