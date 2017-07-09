//
//  UIColor+Base.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "UIColor+Base.h"
#import <EDColor/EDColor.h>
#import "ETColor.h"

@implementation UIColor (Base)

+(instancetype)colorMajor;{
//     return [UIColor colorWithHex:0x334577];
       return [UIColor colorWithHex:0x0077C1];
}
//背景色
+(instancetype)colorBgMajor{
    return [UIColor colorWithHex:0xeaeef9];
}


+(instancetype)colorBlue{
     return [UIColor colorWithHex:0x0088fe];
}

+(instancetype )colorGray {
    return [UIColor colorWithHex:0xdedede];
}

+(instancetype)colorSilver {
    return [UIColor colorWithHex:0xeeeeee];
}

+(instancetype)colorWhiteDark {
    return [UIColor colorWithHex:0xfafafa];
}

+(instancetype)colorWhiteHighlighted {
    return [UIColor colorWithHex:0xf2f2f2];
}

+(instancetype)colorGrayDark {
    return  [UIColor colorWithHex:0x000000 andAlpha:0.54];
}



@end
