//
//  ETCommonRequest+Helper.h
//  ZZKong
//
//  Created by lee on 16/9/13.
//  Copyright © 2016年 ZZKong. All rights reserved.
//

#import "ETCommonRequest.h"

@class RACSignal;


@interface ETCommonRequest (Helper)


+(RACSignal *)commonApiSignalWithClass:(Class)apiClass queue:(NSMutableArray *)apiQueue
                                params:(NSDictionary *)params;

+(RACSignal *)commonApiSignalWithClass:(Class)apiClass queue:(NSMutableArray *)apiQueue
                                params:(NSDictionary *)params
                        waitingMessage:(NSString *)waitingMessage;

+(RACSignal *)commonApiSignalWithClass:(Class)apiClass queue:(NSMutableArray *)apiQueue
                                params:(NSDictionary *)params
                        waitingMessage:(NSString *)waitingMessage
                              preBlock:(void(^)(void))preBlock;

+(RACSignal *)commonApiSignalWithClass:(Class)apiClass queue:(NSMutableArray *)apiQueue
                                params:(NSDictionary *)params
                        waitingMessage:(NSString *)waitingMessage
                              preBlock:(void(^)(void))preBlock
                          successBlock:(void(^)(void))successBlock
                           failedBlock:(void(^)(void))failedBlock;

#pragma mark -
+(RACSignal *)commonApiSignal:(ETCommonRequest *)api queue:(NSMutableArray *)apiQueue;

+(RACSignal *)commonApiSignal:(ETCommonRequest *)api queue:(NSMutableArray *)apiQueue isModel:(BOOL)isModel;

+(RACSignal *)commonApiSignal:(ETCommonRequest *)api queue:(NSMutableArray *)apiQueue
               waitingMessage:(NSString *)waitingMessage isModel:(BOOL)isModel;

+(RACSignal *)commonApiSignal:(ETCommonRequest *)api queue:(NSMutableArray *)apiQueue
               waitingMessage:(NSString *)waitingMessage
                     preBlock:(void(^)(void))preBlock isModel:(BOOL)isModel;

+(RACSignal *)commonApiSignal:(ETCommonRequest *)api queue:(NSMutableArray *)apiQueue
               waitingMessage:(NSString *)waitingMessage
                     preBlock:(void(^)(void))preBlock
                 successBlock:(void(^)(void))successBlock
                  failedBlock:(void(^)(void))failedBlock isModel:(BOOL)isModel;

@end
