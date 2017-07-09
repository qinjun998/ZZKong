//
//  ETLeftTextTextFeild.m
//  ZZKong
//
//  Created by lee on 16/9/21.
//  Copyright © 2016年 ZZKong. All rights reserved.
//
//

#import "ETLeftViewTextFeild.h"

@implementation ETLeftViewTextFeild






- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
//        [self updateLeftView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self updateLeftView];
    }
    return self;
}

-(void)updateLeftView {
    if (self.leftText) {
        [self setLeftText:self.leftText];
    }
    
//    else if (self.leftImageName) {
//        [self setLeftImage:self.leftImageName];
//    }
}

- (void) layoutSubviews
{
    [super layoutSubviews];
//    [self updateLeftView];
}

-(void)setLeftText:(NSString *)leftString{
    UILabel *paddingView = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 20, 25)];
    paddingView.font = [UIFont systemFontOfSize:16.0];
    paddingView.textColor = [UIColor darkGrayColor];
    paddingView.backgroundColor = [UIColor clearColor];
    paddingView.textAlignment = NSTextAlignmentCenter;
//    paddingView.textAlignment = NSTextAlignmentLeft;
    paddingView.text = leftString;
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

-(void)setLeftImageName:(NSString *) leftImageName{
    CGFloat height = self.frame.size.height;
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 1, height - 1, height - 2)];
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:leftImageName]];
//    icon.frame = CGRectMake(height / 4, height / 4, height / 2, height / 2);
    
   icon.frame = CGRectMake(0, 4, 18, 23);
    [leftView addSubview:icon];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

//文字左偏5个px
-(CGRect) leftViewRectForBounds:(CGRect)bounds {
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 5;
    return iconRect;
}

- (void)drawPlaceholderInRect:(CGRect)rect {
    UIColor *colour = self.placeHolderColor?:[UIColor lightGrayColor];
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
