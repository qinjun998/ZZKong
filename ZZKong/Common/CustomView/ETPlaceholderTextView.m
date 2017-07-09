//
//  JPTextView.m
//  DymIOSApp
//
//  Created by Qinjun on 16/4/27.
//  Copyright © 2016年 JiaParts. All rights reserved.
//

#import "ETPlaceholderTextView.h"

@interface ETPlaceholderTextView ()

@property(nonatomic,strong)UILabel *placeholderLabel;


@end

@implementation ETPlaceholderTextView


-(void)text:(NSString *) text{
    [super setText:text];
    if (self.text.length > 0) {
        _placeholderLabel.hidden=YES;
    }
    else{
        _placeholderLabel.hidden=NO;
    }
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self doInit];
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

-(void)doInit{
    
    self.placeholderLabel = [[UILabel alloc]init];
    self.placeholderLabel.textColor = [UIColor lightGrayColor];
    self.placeholderLabel.font = [UIFont systemFontOfSize:17];
    [self addSubview:self.placeholderLabel];
    [self.placeholderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(5);
        make.top.equalTo(self).with.offset(8);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DidChange:) name:UITextViewTextDidChangeNotification object:self];
    

}
-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    self.placeholderLabel.text = placeholder;
}
-(void)setPlaceholderFont:(UIFont *)placeholderFont{
    _placeholderFont = placeholderFont;
    self.placeholderLabel.font = placeholderFont;
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    self.placeholderLabel.textColor = placeholderColor;
}


-(void)DidChange:(NSNotification*)noti{
    
    if (self.placeholder.length == 0 || [self.placeholder isEqualToString:@""]) {
        _placeholderLabel.hidden=YES;
    }
    
    if (self.text.length > 0) {
        _placeholderLabel.hidden=YES;
    }
    else{
        _placeholderLabel.hidden=NO;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
