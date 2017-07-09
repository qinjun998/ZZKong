//
//  UIView+create.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "UIView+create.h"
#import "ETFont.h"
#import "ETFuncDefine.h"

@implementation UIView (create)

+ (instancetype)viewWithFrame:(CGRect)frame
{
    UIView *view = [[self alloc] initWithFrame:frame];
    return view;
}



+ (instancetype)autolayoutView
{
    UIView *view = [[self alloc] initWithFrame:CGRectZero];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor clearColor];
    return view;
}

+ (UIView *)duplicate:(UIView *)view
{
    NSData *tempArchive = [NSKeyedArchiver archivedDataWithRootObject:view];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
}

+ (UIView *)createViewWithAttriutes:(NSArray *)attributs {
    UIView *view = [UIView autolayoutView];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]init];
    [attributs enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL *stop) {
        NSMutableAttributedString *str = nil;
        if(obj[@"isTitle"]&&[obj[@"isTitle"]boolValue]==1){
            if(obj[@"textColor"]){
                str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@\n\n",obj[@"text"]] attributes:@{NSForegroundColorAttributeName:obj[@"textColor"],NSFontAttributeName:[ETFont large]}];
                
            }else{
                str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@\n\n",obj[@"text"]]attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[ETFont large]}];
            }
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
            [paragraphStyle setAlignment:NSTextAlignmentCenter];
            [paragraphStyle setLineSpacing:2.0];
            [str addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, str.length)];
        }else{
            if(idx == attributs.count){//为了去掉省略号
                if(obj[@"textColor"]){
                    str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",obj[@"text"]] attributes:@{NSForegroundColorAttributeName:obj[@"textColor"],NSFontAttributeName:[ETFont medium]}];
                }else{
                    str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@",obj[@"text"]]attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[ETFont medium]}];
                }
            }else{
                if(obj[@"textColor"]){
                    str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@\n\n",obj[@"text"]] attributes:@{NSForegroundColorAttributeName:obj[@"textColor"],NSFontAttributeName:[ETFont medium]}];
                }else{
                    str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@\n\n",obj[@"text"]]attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[ETFont medium]}];
                }
            }
            
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
            [paragraphStyle setAlignment:NSTextAlignmentLeft];
            [paragraphStyle setLineSpacing:2.5];
            [str addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, str.length)];
        }
        [attributedString appendAttributedString:str];
        
    }];
    UILabel *label = [UILabel autolayoutView];
    label.numberOfLines = 0;
    label.attributedText = attributedString;
    [view addSubview:label];
    [label autoPinEdgesToSuperviewEdges];
    return view;
}
@end
