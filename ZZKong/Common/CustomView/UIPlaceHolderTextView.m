//
//  UIPlaceHolderTextView.m
//  Reward
//
//  Created by qinjun on 10/11/15.
//  Copyright © 2015 com.reward. All rights reserved.
//

#import "UIPlaceHolderTextView.h"

@implementation UIPlaceHolderTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self doInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self doInit];
    }
    return self;
}


- (void)awakeFromNib {
  
}

#pragma mark 注册通知
- (void)doInit {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:self];
}

#pragma mark 移除通知
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark 开始编辑
- (void)textDidBeginEditing:(NSNotification *)notification {
    if ([super.text isEqualToString:_placeholder]) {
        super.text = @"";
        [super setTextColor:[UIColor blackColor]];
    }
}

#pragma mark 结束编辑
- (void)textDidEndEditing:(NSNotification *)notification {
    if (super.text.length == 0) {
        super.text = _placeholder;
        //如果文本框内是原本的提示文字，则显示灰色字体
         [super setTextColor:[UIColor colorWithRed:199.0 / 255.0 green:199.0 / 255.0 blue:205.0 / 255.0 alpha:1]];

    }
}

#pragma mark 重写setPlaceholder方法
- (void)setPlaceholder:(NSString *)aPlaceholder {
    _placeholder = aPlaceholder;
    [self textDidEndEditing:nil];
}

#pragma mark 重写getText方法
- (NSString *)text {
    NSString *text = [super text];
    if ([text isEqualToString:_placeholder]) {
        return @"";
    }
    return text;
}

@end
