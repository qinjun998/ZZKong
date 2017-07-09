//
//  ETBlockImageView.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ETBlockImageView;

typedef void(^ETBlockImageViewClickBlock)(ETBlockImageView *sender);

@interface ETBlockImageView : UIImageView

@property (nonatomic, strong) id data;

- (void)setBlock:(ETBlockImageViewClickBlock)block;

@end
