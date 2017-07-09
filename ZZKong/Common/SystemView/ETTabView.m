//
//  ETTabView.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETTabView.h"
#import "NSArray+safe.h"

#import "NSMutableArray+safe.h"
#import "UIView+Extension.h"

@interface ETTabView()

@end

@implementation ETTabView
@synthesize currentIndex = _currentIndex;

- (id)initWithFrame:(CGRect)frame
              texts:(NSArray *)aArray
              color:(UIColor *)aColor
               font:(UIFont *)aFont
       normalImages:(NSArray *)bArray
          selImages:(NSArray *)cArray
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.normalImages = bArray;
        self.selImages = cArray;
        
        NSInteger count = aArray.count;
        CGFloat width = frame.size.width/count;
        CGFloat height = frame.size.height;
        CGFloat xValue = 0.0;
        self.labels = [NSMutableArray arrayWithCapacity:count];
        self.imageViews = [NSMutableArray arrayWithCapacity:count];
        _imageSize = CGSizeMake(width, height);
        for (int i=0; i<count; i++) {
            NSString *normalImageName = [bArray safeObjectAtIndex:i];
            NSString *selImageName = [cArray safeObjectAtIndex:i];
            NSString *text= [aArray safeObjectAtIndex:i];
            UIImageView *theIv = [[UIImageView alloc] initWithFrame:CGRectMake(xValue, 0, width, height)];
            theIv.tag = i;
            
            if (i == 0) {
                theIv.image = [UIImage imageNamed:selImageName];
                
            } else {
                theIv.image = [UIImage imageNamed:normalImageName];
            }
            
            [self layoutImageView:theIv];
            
            
            [self addSubview:theIv];
            [self.imageViews safeAddObject:theIv];
            
            CGRect lblRect = CGRectIntegral(CGRectMake(xValue, 0, width, height));
            UILabel *theLbl = [[UILabel alloc] initWithFrame:lblRect];
            theLbl.backgroundColor = [UIColor clearColor];
            theLbl.numberOfLines = 2;
            theLbl.text = text;
            theLbl.textColor = aColor;
            theLbl.font = aFont;
            theLbl.textAlignment = NSTextAlignmentCenter;
            [self addSubview:theLbl];
            [self.labels safeAddObject:theLbl];
            
            xValue += width;
            //手势处理
            UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
            [theIv addGestureRecognizer:tapGes];
            theIv.userInteractionEnabled = YES;
            
        }
    }
    return self;
}

- (void)setImageSizeToFit:(BOOL)imageSizeToFit
{
    if(_imageSizeToFit != imageSizeToFit){
        _imageSizeToFit = imageSizeToFit;
    }
    UIImageView * firstImageView = [_imageViews safeObjectAtIndex:0];
    [self layoutImageView:firstImageView];
}


- (void)setBackgroundView:(UIView *)backgroundView
{
    if(_backgroundView != backgroundView){
        [_backgroundView removeFromSuperview];
        _backgroundView = backgroundView;
        backgroundView.frame = self.bounds;
        [self insertSubview:backgroundView atIndex:0];
    }
}
- (void)updateWithTextAry:(NSArray *)aTextAry
{
    if(!aTextAry.count) {
        return;
    }
    
    if(!self.labels) {
        self.labels = [[NSMutableArray alloc] initWithCapacity:aTextAry.count];
    }
    
    int index = 0;
    for (NSString *text in aTextAry) {
        UILabel *label = [self.labels safeObjectAtIndex:index];
        label.text = text;
        index ++;
    }
}

- (void)layoutImageView:(UIImageView *)aImageView
{
    CGPoint center = aImageView.center;
    
    if(aImageView.image && _imageSizeToFit){
        [aImageView sizeToFit];
        aImageView.center = center;
    }
    else{
        aImageView.width = _imageSize.width;
        aImageView.height = _imageSize.height;
        aImageView.center = center;
    }
}

- (void)selectIndex:(NSInteger)index
{
    self.currentIndex = index;
    
    if ([self.delegate respondsToSelector:@selector(tabView:changeToIndex:)]) {
        [self.delegate tabView:self changeToIndex:(int)self.currentIndex];
    }
}

- (void)setCurrentIndex:(NSInteger)index
{
    if (index >= self.imageViews.count) {
        return;
    }
    UIImageView *oldSelectImageView = [self.imageViews safeObjectAtIndex:self.currentIndex];
    UIImageView *currentSelectImageView = [self.imageViews safeObjectAtIndex:index];
    
    oldSelectImageView.image = [UIImage imageNamed:[self.normalImages safeObjectAtIndex:self.currentIndex]];
    currentSelectImageView.image = [UIImage imageNamed:[self.selImages safeObjectAtIndex:index]];
    
    [self layoutImageView:oldSelectImageView];
    [self layoutImageView:currentSelectImageView];
    
    _currentIndex = index;
}

- (void)handleTap:(UIPanGestureRecognizer*)gestureRecognizer
{
    UIImageView *selIv = (UIImageView *)gestureRecognizer.view;
    NSInteger index = selIv.tag;
    [self selectIndex:index];
}

@end
