//
//  CommonApi_UploadImage.h
//  DymIOSApp
//
//  Created by Dong Yiming on 15/8/28.
//  Copyright (c) 2015年 Dong Yiming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETCommonRequest.h"
#import "ETCommonResponse.h"

//
typedef NS_ENUM(NSInteger, EJPServerImagePath) {
    
    kServerUploadPathDealerLicence = 1000        // 经销商 - 营业执照
    , kServerUploadPathDealerOffice              // 经销商 - 门店
    , kServerUploadPathDealerLogo                // 经销商 - logo
    , kServerUploadPathDealerQuotation           // 经销商 - 报价单
    
    , kServerUploadPathAvatar                   // 修理厂 - 头像
    , kServerUploadPathShopLicence               // 修理厂 - 营业执照
    , kServerUploadPathShopOffice                // 修理厂 - 门店
    , kServerUploadPathShopNamecard              // 修理厂 - 名片
    , kServerUploadPathShopInquiryPhoto          // 询价单 - 照片
    , kServerUploadPathShopInquiryAudio          // 询价单 - 语音
    , kServerUploadPathShopDemandPhoto           // 需求 - 图片
    , kServerUploadPathShopDemandAudio           // 需求 - 语音
    
    , kServerUploadPathManAvatar                 // 技师 - 头像
    , kServerUploadPathCustomerServiceInquiry    // 客服 - 询价单
};


//图片和音频类型
typedef NS_ENUM(NSInteger, EJPUploadFileType) {
    
    kJPUploadFileTypeJPEG   = 1  //图片类型
    , kJPUploadFileTypeAMR  = 2   //语音文件类型
};


/// 上传图片API
@interface CommonApi_UploadImage : ETCommonRequest

/// 文件在服务器的路径，比如 /unipei/useuImg/20150828/
//@property (nonatomic, copy) NSString *path;
-(NSString *)path;

//-(NSString *)pathWithName;

/// 图片路径类型
@property (nonatomic, strong) NSNumber              *pathType;

/// 在服务器保存的名称 ，比如： 1.jpg
@property (nonatomic, copy) NSString                *name;
/// 要上传的图片
@property (nonatomic, strong) UIImage               *image;

@property (nonatomic, strong) NSData                *fileData;

@property (nonatomic, assign) EJPUploadFileType     fileType;


@property (nonatomic, copy) NSString        *fileName;
@property (nonatomic, copy) NSString        *mimeType;  //application/x-download

@end


@interface CommonApi_UploadImage_Result : ETCommonResponse
//@property (nonatomic, copy) NSString                *picPath;
@end
