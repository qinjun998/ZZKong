//
//  ETColorDefine.h
//  ZZKong
//
//  Created by lee on 16/9/12.
//  Copyright © 2016年 ZZKong. All rights reserved.
//


#ifndef ETColorDefine_h
#define ETColorDefine_h

//颜色
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 \
alpha:1.0]

//special color
#define OTSORANGECOLOR [UIColor colorWithRed:223.0/255 green:119.0/255 blue:28.0/255 alpha:1]
#define OTSTEXTCOLOR [UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1]
#define OTSREDCOLOR [UIColor colorWithRed:220.0/255 green:0/255 blue:0/255 alpha:1]
#define OTSBLUECOLOR [UIColor colorWithRed:104.0/255 green:144.0/255 blue:223.0/255 alpha:1]
#define OTSDISABLECLOLR [UIColor colorWithRed:169.0/255 green:169.0/255 blue:169.0/255 alpha:1.0]
#define OTSGREYCLOLR(color) [UIColor colorWithRed:color/255.0 green:color/255.0 blue:color/255.0 alpha:1.0]


#endif /* ETColorDefine_h */
