//
//  ETVAlignmentLabel.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VerticalAlignment) {
    VerticalAlignmentTop      = 0,
    VerticalAlignmentMiddle   = 1,
    VerticalAlignmentBottom   = 2
};




@interface ETVAlignmentLabel : UILabel

@property (nonatomic, assign) VerticalAlignment verticalAlignment;


@end
