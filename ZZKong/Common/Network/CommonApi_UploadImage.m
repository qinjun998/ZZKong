//
//  CommonApi_UploadImage.m
//  DymIOSApp
//
//  Created by Dong Yiming on 15/8/28.
//  Copyright (c) 2015年 Dong Yiming. All rights reserved.
//

#import "CommonApi_UploadImage.h"
#import "UIImage+Scale.h"
#import <ReactiveCocoa/RACEXTScope.h>


static NSString *PATH_commonApi_uploadImage = @"resources/uploadFile";



@implementation CommonApi_UploadImage

-(NSString *)requestUrl {
    return PATH_commonApi_uploadImage;
}

- (NSTimeInterval)requestTimeoutInterval {
    return 240;
}

- (AFConstructingBlock)constructingBodyBlock {
    
    @weakify(self)
    return ^(id<AFMultipartFormData> formData) {
        
        @strongify(self)
//        NSString *path = [self path];
//        [formData appendPartWithFormData:[path dataUsingEncoding:NSUTF8StringEncoding] name:@"path"];
//        [formData appendPartWithFormData:[self.name dataUsingEncoding:NSUTF8StringEncoding] name:@"name"];
        
        NSData *data1;
        NSString *mimeType1;
        
        if (_fileType == kJPUploadFileTypeJPEG) {
            mimeType1 = @"image/jpeg";
            UIImage *scaledImage = [self.image scaleToFitSize:[UIScreen mainScreen].bounds.size];
            data1 = [scaledImage compressToMaxBytes]; // 500k
        } else{
            mimeType1 = @"application/x-download";
            data1 = self.fileData;
        }
        
        /*
         此方法参数
         1. 要上传的[二进制数据]
         2. 对应网站上[upload.php中]处理文件的[字段"file"]
         3. 要保存在服务器上的[文件名]
         4. 上传文件的[mimeType]
         */
//        [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:@"image/png"];
//        if (data1 != nil && fileName1.length > 0 && mimeType1.length > 0) {
        if (data1 != nil) {
            [formData appendPartWithFileData:data1 name:@"file" fileName:self.fileName mimeType:mimeType1];
        }
    };
}

-(NSString *)path {
//    NSString *path = [[self pathMap] objectForKey:_pathType];
//    
//    NSDateFormatter *dtFmt = [[NSDateFormatter alloc] init];
//    dtFmt.dateFormat = @"yyyyMMdd";
//    NSString *dateStr = [dtFmt stringFromDate:[NSDate date]];
//    path = [path stringByAppendingPathComponent:dateStr];
//    path = [path stringByAppendingString:@"/"];
//    return path;
        return @"/";
}

//-(NSString *)pathWithName {
//    return [[[self path] stringByAppendingPathComponent:[self name]] stringByAppendingPathExtension:@"jpg"];
//}


-(Class)responseModelClass {
    return [CommonApi_UploadImage_Result class];
}


@end


@implementation CommonApi_UploadImage_Result

+(NSDictionary *) jsonMap {
//    return @{
//             @"picPath": @"body.picPath"
//             };
    return @{};
}
@end
