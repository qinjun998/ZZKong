//
//  CommonRequest+Helper.m
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETCommonRequest+Helper.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <SVProgressHUD/SVProgressHUD.h>
//#import "ECDAppStatus.h"
#import "YTKBaseRequest+NetworkError.h"


@implementation ETCommonRequest (Helper)


#pragma mark - common api signals

+(RACSignal *)commonApiSignalWithClass:(Class)apiClass queue:(NSMutableArray *)apiQueue
                                params:(NSDictionary *)params {
    return [self commonApiSignalWithClass:apiClass queue:apiQueue params:params waitingMessage:nil preBlock:nil successBlock:nil failedBlock:nil];
}

+(RACSignal *)commonApiSignalWithClass:(Class)apiClass queue:(NSMutableArray *)apiQueue
                                params:(NSDictionary *)params
                        waitingMessage:(NSString *)waitingMessage {
    return [self commonApiSignalWithClass:apiClass queue:apiQueue params:params waitingMessage:waitingMessage preBlock:nil successBlock:nil failedBlock:nil];
}

+(RACSignal *)commonApiSignalWithClass:(Class)apiClass queue:(NSMutableArray *)apiQueue
                                params:(NSDictionary *)params
                        waitingMessage:(NSString *)waitingMessage
                              preBlock:(void(^)(void))preBlock {
    
    return [self commonApiSignalWithClass:apiClass queue:apiQueue params:params waitingMessage:waitingMessage preBlock:preBlock successBlock:nil failedBlock:nil];
};

+(RACSignal *)commonApiSignalWithClass:(Class)apiClass queue:(NSMutableArray *)apiQueue
                                params:(NSDictionary *)params
                        waitingMessage:(NSString *)waitingMessage
                              preBlock:(void(^)(void))preBlock
                          successBlock:(void(^)(void))successBlock
                           failedBlock:(void(^)(void))failedBlock {
    
//    if (![apiClass isSubclassOfClass:[ETCommonRequest class]]) {
//        return nil;
//    }
//    
//    id api = [[apiClass alloc] initWithParams:params];
//
//    return [self commonApiSignal:api queue:apiQueue waitingMessage:waitingMessage preBlock:preBlock successBlock:successBlock failedBlock:failedBlock];
    
    return nil;
};



#pragma mark -
+(RACSignal *)commonApiSignal:(ETCommonRequest *)api queue:(NSMutableArray *)apiQueue {
    return [self commonApiSignal:api queue:apiQueue waitingMessage:nil preBlock:nil successBlock:nil failedBlock:nil isModel:YES];
}



+(RACSignal *)commonApiSignal:(ETCommonRequest *)api queue:(NSMutableArray *)apiQueue  isModel:(BOOL)isModel{
    
    return [self commonApiSignal:api queue:apiQueue waitingMessage:nil preBlock:nil successBlock:nil failedBlock:nil isModel:isModel];
}

+(RACSignal *)commonApiSignal:(ETCommonRequest *)api queue:(NSMutableArray *)apiQueue
               waitingMessage:(NSString *)waitingMessage  isModel:(BOOL)isModel{
    return [self commonApiSignal:api queue:apiQueue waitingMessage:waitingMessage preBlock:nil successBlock:nil failedBlock:nil isModel:isModel];
}

+(RACSignal *)commonApiSignal:(ETCommonRequest *)api queue:(NSMutableArray *)apiQueue
               waitingMessage:(NSString *)waitingMessage
                     preBlock:(void(^)(void))preBlock isModel:(BOOL)isModel{
    return [self commonApiSignal:api queue:apiQueue waitingMessage:waitingMessage preBlock:preBlock successBlock:nil failedBlock:nil isModel:isModel];
}

+(RACSignal *)commonApiSignal:(ETCommonRequest *)api queue:(NSMutableArray *)apiQueue
               waitingMessage:(NSString *)waitingMessage
                     preBlock:(void(^)(void))preBlock
                 successBlock:(void(^)(void))successBlock
                  failedBlock:(void(^)(void))failedBlock isModel:(BOOL)isModel{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        if (waitingMessage.length > 0) {
            [SVProgressHUD showWithStatus:waitingMessage];
        }
        
        if (preBlock) {
            preBlock();
        }
        
        [apiQueue addObject:api];
        
        [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
            if (waitingMessage.length > 0) {
                [SVProgressHUD dismiss];
            }
            
            if (successBlock) {
                successBlock();
            }

            if (!request.cancelled) {
                NSLog(@"\n\n----------------♦︎Request OK♦︎------------------------\n\n♦︎request:\n%@\n♦︎Arguments:\n%@\n♦︎Headers:\n%@\n\napi.responseHeaders\n%@\n\n",api, api.requestArgument, api.requestHeaderFieldValueDictionary,api.responseHeaders);
                NSLog(@"\n\n----------------♦︎Response♦︎-----------------------\n%@\n\n", api.responseString);

                id  result = nil;
                if (isModel) {
                    result = api.responseModel;
                }else{
                    result = api.responseJSONObject;
                }

                [subscriber sendNext:result];
                
                [subscriber sendCompleted];
                
// 检查code, 如果出现code == 401，强制用户退出登录
                /*
                if ([result isKindOfClass:[ETCommonResponse class]]) {
                    ETCommonResponse *identifiedResult = result;
                    if ([identifiedResult.code integerValue] == 401) {
                        
                        [[JLToast makeText:identifiedResult.msg] show];
                        
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [ECDAppStatus logout];
                        });
                    }
                }
                 */
//                
//                if ([result isKindOfClass:[ETCommonResponse class]]) {
//                    ETCommonResponse *identifiedResult = result;
//                    if ([identifiedResult.code integerValue] == 200 && api.responseHeaders[@"X-ET-Token"]!=nil) {
//                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                            [ECDAppStatus updateToken:api.responseHeaders[@"X-ET-Token"]];
//                        });
//                    }
//                }
            }
            
        } failure:^(YTKBaseRequest *request) {
               NSLog(@"\n\n%@\n\n----------------♦︎Request FAILED♦︎------------------------\n\n♦︎Arguments:\n%@\n♦︎Headers:\n%@\n\n",api,  api.requestArgument, api.requestHeaderFieldValueDictionary);
            if (waitingMessage.length > 0) {
                [SVProgressHUD dismiss];
            }
            if (failedBlock) {
                failedBlock();
            }
            

            id  result = nil;
            if (isModel) {
                result = api.responseModel;
            }else{
                result = api.responseJSONObject;
            }
            
            ETCommonRequest *commRequest = (ETCommonRequest *)request;
            
            if (![commRequest.relativePath hasPrefix:@"service/vcode"]) {
                NSError *error = [request timeoutError];
                ETToast(error.domain);
            }
            

            [subscriber sendNext:result];
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}




@end
