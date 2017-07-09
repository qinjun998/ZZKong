//
//  UIImage+Category.m
//  ShengXianSearch
//
//  Created by 曾浩 on 2017/3/6.
//  Copyright © 2017年 曾浩. All rights reserved.
//

#import "UIImage+Category.h"



@implementation UIImage (Category)

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

+(UIImage *) getImageFromURL:(NSString *)fileURL {
    UIImage * result;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    return result;
}

//同步下载未成功
+(UIImage *) getImageFromURL:(NSString *)fileURL  completed:(ImageCompletionBlock)completedBlock{

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData * data = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:fileURL]];
        UIImage *image = [[UIImage alloc]initWithData:data];
        if (data != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                //在这里做UI操作(UI操作都要放在主线程中执行)
                if(completedBlock){
                    completedBlock(image);
                }
            });
        }
    });

  return nil;
}




@end
