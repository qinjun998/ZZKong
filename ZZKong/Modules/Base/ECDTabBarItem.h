//
//  ECDTabBarItem.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETTabBarItem.h"

@interface ECDTabBarItemVO : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *hostString;

@end

@interface ECDTabBarItem : ETTabBarItem

@property (nonatomic, strong) ECDTabBarItemVO *defaultVO;
@property (nonatomic, strong) NSString *hostString;

@end


@interface UITabBarItem (ECDTabBarItem)


@end
