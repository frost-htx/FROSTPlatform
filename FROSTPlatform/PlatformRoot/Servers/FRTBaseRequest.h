//
//  FRTBaseRequest.h
//  FROSTPlatform
//
//  Created by frost on 16/9/2.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "FRTRequestError.h"

typedef NS_ENUM(NSInteger,FRTRequestMethod) {
    FRTRequestMethod_Get,
    FRTRequestMethod_Post,
    FRTRequestMethod_Put,
    FRTRequestMethod_Delete
};

typedef NS_ENUM(NSInteger,FRTRequestSerializerType) {
    FRTRequestSerializerTypeHTTP,
    FRTRequestSerializerTypeJSON,
};

@class FRTBaseRequest;

/**
 *  请求返回的结果
 *
 *  @param request 成功或者失败的回调
 *
 *  @return FRTBaseRequest
 */
typedef void(^FRTRequestCompletionBlock)(__kindof FRTBaseRequest *request);

@interface FRTBaseRequest : NSObject

/**
 *  响应结果
 */
@property (nonatomic,strong,readonly) id responseObject;

/**
 *  Http返回头
 */
@property (nonatomic,strong,readonly) NSDictionary *responseHttpHeads;

/**
 *  返回错误描述
 */
@property (nonatomic,strong,readonly) FRTRequestError *responseError;

/**
 *  下载进度
 */
@property (nonatomic,strong,readonly) NSProgress *downloadProgress;

/**
 *  SessionManager
 */
@property (nonatomic,strong) AFHTTPSessionManager *sessionManager;

/**
 *  请求成功block
 */
@property (nonatomic,copy) FRTRequestCompletionBlock successCompletionBlock;

/**
 *  请求失败block
 */
@property (nonatomic,copy) FRTRequestCompletionBlock failureCompletionBlock;

/**
 *  block回调
 */
- (void)startWithCompletionBlockWithSuccess:(FRTRequestCompletionBlock)success
                                    failure:(FRTRequestCompletionBlock)failure;

/**
 *  开始请求
 */
-(void)start;

/**
 *  请求方法
 */
-(FRTRequestMethod)requestMethod;

/**
 *  请求序列化Type
 */
-(FRTRequestSerializerType)requestSerializerType;

/**
 *  域名
 */
-(NSString *)domainUrl;

/**
 *  请求的URl
 */
-(NSString *)requestUrl;

/**
 *  请求参数
 */
-(id)requestParameters;

/**
 *  Http请求头
 */
-(NSDictionary *)requestHttpHeads;

/**
 *  下载保存至
 */
-(NSString *)downloadSaveAddress;

/**
 *  超时时间
 */
-(NSTimeInterval)requestTimeoutInterval;


@end
