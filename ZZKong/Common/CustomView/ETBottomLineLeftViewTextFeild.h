//
//  ETBottomLineLeftViewTextFeild.h
//  ZZKong
//
//  Created by lee on 2017/3/16.
//  Copyright © 2017年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETBottomLineLeftViewTextFeild : UITextField

@property(nonatomic,copy) UIColor *placeHolderColor;//placeholder文字颜色
@property(nonatomic,copy) UIColor *lineColor;       //下划线颜色
@property(nonatomic,copy) UIColor *baseTextColor;   //输入之后的文字颜色

@property(nonatomic,copy) NSString *leftText;    //左边文字
@property(nonatomic,strong) NSString *leftImageName; //左边图片

@end
