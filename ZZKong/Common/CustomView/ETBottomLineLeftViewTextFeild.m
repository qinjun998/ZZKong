//
//  ETBottomLineLeftViewTextFeild.m
//  ZZKong
//  带下划线和左图标和文字
//  Created by lee on 2017/3/16.
//  Copyright © 2017年 ZZKong. All rights reserved.
//

#import "ETBottomLineLeftViewTextFeild.h"

@implementation ETBottomLineLeftViewTextFeild

#pragma mark Properties

//通过属性设置图片，避免layoutSubviews的循环调用本属性方法
-(void)setLeftImageName:(NSString *) leftImageName{
    CGFloat height = self.frame.size.height;
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 27, 23 )];
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:leftImageName]];
    icon.frame = CGRectMake(0, 0, 18, 23);
    [leftView addSubview:icon];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
            self.font = [UIFont systemFontOfSize:18];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

//取消边框，增加底线
-(void)updateLeftView {
    
    self.borderStyle = UITextBorderStyleNone;
    self.textColor = self.baseTextColor?self.baseTextColor:[UIColor lightGrayColor];

    //add boottom line
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(0,self.frame.size.height-1, self.frame.size.width, 0.5)];
    line.backgroundColor = self.lineColor?self.lineColor:[UIColor lightGrayColor];
    [self addSubview:line];
    
    
//    if (self.leftText) {
//        [self setLeftText:self.leftText];
//    }
    //    else if (self.leftImageName) {
    //        [self setLeftImage:self.leftImageName];
    //    }
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    [self updateLeftView];
}

-(void)setLeftText:(NSString *)leftString{
    UILabel *paddingView = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 20, 25)];
    paddingView.font = [UIFont systemFontOfSize:18.0];
    paddingView.textColor = [UIColor darkGrayColor];
    paddingView.backgroundColor = [UIColor clearColor];
    paddingView.textAlignment = NSTextAlignmentCenter;
    //    paddingView.textAlignment = NSTextAlignmentLeft;
    paddingView.text = leftString;
    self.leftView = paddingView;
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
