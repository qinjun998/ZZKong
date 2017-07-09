//
//  ETTableViewHeaderFooterView.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETTableViewHeaderFooterView.h"
//category
#import "NSObject+BeeNotification.h"

@implementation ETTableViewHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    CGRect rc = CGRectMake(frame.origin.x + self.cellEdgeInsets.left, frame.origin.y + self.cellEdgeInsets.top, frame.size.width - self.cellEdgeInsets.left - self.cellEdgeInsets.right, frame.size.height - self.cellEdgeInsets.top - self.cellEdgeInsets.bottom);
    [super setFrame:rc];
}

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

- (void)updateWithCellData:(id)aData
{
    
}

+ (CGFloat)heightForCellData:(id)aData
{
    return 0;
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}


@end
