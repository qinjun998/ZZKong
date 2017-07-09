//
//  JPTextView.h
//  DymIOSApp
//
//  Created by qinjun on 16/4/27.
//  Copyright © 2016年 JiaParts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETPlaceholderTextView : UITextView

@property(nonatomic,copy)NSString *placeholder;

/**
 *  占位字体大小
 */
@property(nonatomic,assign)UIFont *placeholderFont;

/**
 *  占位字体颜色
 */
@property(nonatomic,strong)UIColor *placeholderColor;


@end
