//
//  UIImage+Scale.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#import "UIImage+Scale.h"

@implementation UIImage (Scale)


-(UIImage*)scaleToFitSize:(CGSize)size
{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    CGFloat verticalRadio = size.height / height;
    CGFloat horizontalRadio = size.width / width;
    
    CGFloat radio = 1;
    if(verticalRadio > 1 && horizontalRadio > 1) {
        radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
    } else {
        radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio;
    }
    
    width = width * radio;
    height = height * radio;
    
    //    NSInteger xPos = (size.width - width) / 2;
    //    NSInteger yPos = (size.height-height) / 2;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, width, height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}

-(NSData *)compressToMaxBytes{
    CGFloat compressRatio = 0.7;
    NSInteger maxBytes = [self maxBytes];
    NSData *data = UIImageJPEGRepresentation(self, compressRatio);
    CGFloat difference = data.length / (CGFloat)maxBytes;
    if (difference > 1.0) {
        compressRatio = compressRatio / difference;
        data = UIImageJPEGRepresentation(self, compressRatio);
    }
    
    return data;
}
-(NSInteger)maxBytes{
    
    NSInteger maxBytes = 500 * 1024;
    return maxBytes;
    
}



@end
