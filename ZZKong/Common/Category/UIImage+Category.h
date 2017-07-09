//
//  UIImage+Category.h
//  ShengXianSearch
//
//  Created by 曾浩 on 2017/3/6.
//  Copyright © 2017年 曾浩. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ImageCompletionBlock)(UIImage *image);

@interface UIImage (Category)

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+(UIImage *) getImageFromURL:(NSString *)fileURL ;
+(UIImage *) getImageFromURL:(NSString *)fileURL  completed:(ImageCompletionBlock)completedBlock;

@end
