//
//  ETBottomLineTextField.m
//  ZZKong
//
//  无边框输入框，可控制placeHolder颜色
//
//  Created by lee on 16/9/21.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETBottomLineTextField.h"


#define kPlaceholderColorKey @"placeholderLabel.textColor"

@interface ETBottomLineTextField()<UITextFieldDelegate>

@end

@implementation ETBottomLineTextField


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self = [super initWithFrame:CGRectZero];
//        [self initWithFrame:CGRectZero];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self doInit];
    }
    return self;
}

-(void)doInit {
    //如果需要重新调用drawRect则设置contentMode为UIViewContentModeRedraw
    self.contentMode = UIViewContentModeRedraw;
    //不允许从Autoresizing转换Autolayout的Constraints
    //貌似Storyboard创建时调用initWithCoder方法时translatesAutoresizingMaskIntoConstraints已经是NO了
    self.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void) updateView
{
    self.borderStyle = UITextBorderStyleNone;
    self.textColor = self.baseTextColor?self.baseTextColor:[UIColor lightGrayColor];
    self.font = [UIFont systemFontOfSize:14];
    //add boottom line
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0,self.frame.size.height-1, self.frame.size.width, 0.5)];
    line.backgroundColor = self.lineColor?self.lineColor:[UIColor lightGrayColor];
    [self addSubview:line];
}



- (void) layoutSubviews
{
    [super layoutSubviews];
//    NSLog(@"layoutSubviews %f %f", self.bounds.size.width, self.bounds.size.height);
    [self updateView];
}

//NSMutableAttributedString* attributedString = [[NSMutableAttributedString alloc] initWithString:@"asdf"];
//NSDictionary* attributes = @{NSForegroundColorAttributeName:[UIColor redColor]};
//[attributedString setAttributes:attributes range:NSMakeRange(0, [attributedString length])];
//[self.textField setAttributedPlaceholder:attributedString];

//控制placeHolder的颜色、字体
- (void)drawPlaceholderInRect:(CGRect)rect {
    UIColor *colour = self.placeHolderColor?self.placeHolderColor:[UIColor lightGrayColor];
    if ([self.placeholder respondsToSelector:@selector(drawInRect:withAttributes:)]) {
        // iOS7 and later
        NSDictionary *attributes = @{NSForegroundColorAttributeName: colour, NSFontAttributeName: self.font};
        CGRect boundingRect = [self.placeholder boundingRectWithSize:rect.size options:0 attributes:attributes context:nil];
        [self.placeholder drawAtPoint:CGPointMake(0, (rect.size.height/2)-boundingRect.size.height/2) withAttributes:attributes];
    } else {
        // iOS 6
        [colour setFill];
        [self.placeholder drawInRect:rect withFont:self.font lineBreakMode:NSLineBreakByTruncatingTail alignment:self.textAlignment];
    }
}



@end
