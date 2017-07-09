//
//  UIImage+tool.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (tool)

//变灰色
-(UIImage *)grayscaleImage;

//去色灰色显示
-(UIImage *)grayImage;

/**
 *  通过颜色创建image
 *
 *  @param color 颜色
 *
 *  @return image
 */
+ (UIImage *)imageWithColor:(UIColor *)aColor;

/**
 *  视图转换为UIImage
 *
 *  @param view
 *
 *  @return
 */
+ (UIImage *)imageWithView:(UIView *)view;

+ (UIImage *)image:(UIImage *)image WithTintColor:(UIColor *)tintColor;

//设置图片透明度
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;

/**
 *  等比例缩放
 *
 *  @param size 大小
 *
 *  @return image
 */
-(UIImage*)scaleToSize:(CGSize)size;

/**
 *	按照尺寸缩放图片
 *
 *	@param aSize
 *
 *	@return
 */
- (UIImage *)shrinkImageForSize:(CGSize)aSize;

/**
 *	功能:存储图片到doc目录
 *
 *	@param imageName :图片名称
 *	@param aQuality  :压缩比率
 *
 *	@return 
 */
- (NSString *)saveImageWithName:(NSString *)imageName
		  forCompressionQuality:(CGFloat )aQuality;



@end
