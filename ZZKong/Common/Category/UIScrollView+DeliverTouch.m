//
//  UIScrollView+DeliverEvent.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "UIScrollView+DeliverTouch.h"
#import "NSObject+swizzle.h"

static char deliverTouchKey;

@implementation UIScrollView (DeliverTouch)

+ (void)load
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        [self exchangeMethod:@selector(touchesBegan:withEvent:) withMethod:@selector(deliverTouchesBegan:withEvent:)];
        [self exchangeMethod:@selector(touchesMoved:withEvent:) withMethod:@selector(deliverTouchesMoved:withEvent:)];
        [self exchangeMethod:@selector(touchesEnded:withEvent:) withMethod:@selector(deliverTouchesEnded:withEvent:)];
    } );
}

- (void)setDeliverTouchEvent:(BOOL)deliverEvent
{
    objc_setAssociatedObject(self, &deliverTouchKey, @(deliverEvent), OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (BOOL)deliverTouchEvent
{
   NSNumber *deleverEventNumber = objc_getAssociatedObject(self, &deliverTouchKey);
    return deleverEventNumber.boolValue;
}


- (void)deliverTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.deliverTouchEvent) {
        [super touchesBegan:touches withEvent:event];
        [self.nextResponder touchesBegan:touches withEvent:event];
    }else{
        [self deliverTouchesBegan:touches withEvent:event];
    }
}


- (void)deliverTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.deliverTouchEvent) {
        [super touchesMoved:touches withEvent:event];
        [self.nextResponder touchesMoved:touches withEvent:event];
    }else{
        [self deliverTouchesMoved:touches withEvent:event];
    }
}

- (void)deliverTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.deliverTouchEvent) {
        [super touchesEnded:touches withEvent:event];
        [self.nextResponder touchesEnded:touches withEvent:event];
    }else{
        [self deliverTouchesEnded:touches withEvent:event];
    }
}

@end
