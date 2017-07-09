//
//  CommonRequest.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ETRequestBase.h"


@interface ETCommonRequest : ETRequestBase

@property (nonatomic, strong) NSDictionary  *params;     //提交参数
@property (nonatomic, strong) NSString      *relativePath;  //提交路径
@property (nonatomic, strong) NSString      *method;  //提交方式

/// 子类重写此方法，设置自己的response mode 类型
-(Class)responseModelClass;  //读取
-(void)setResponseModelClass:(Class)class1;  //写入
//-(void)setResponseModelClass:(NSString*) className;  //写入

///获得属性Model，默认情况下为CommonResponse类型
- (id)responseModel;
-(id) jsonData;

/// 传入参数Dictionary初始化，keys和values要和paramToPropertyMap的定义一致
- (instancetype)initWithParams:(NSDictionary *)params;
@end
