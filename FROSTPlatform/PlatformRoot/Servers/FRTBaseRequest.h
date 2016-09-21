//
//  FRTBaseRequest.h
//  FROSTPlatform
//
//  Created by frost on 16/9/2.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "FRTBaseRequest.h"
#import "FRTConfigTools.h"

@class FRTBaseRequest;

@protocol FRTBaseRequestDelegate <NSObject>

/**
 *  请求成功
 *
 *  @param baseRequest FRTBaseRequest
 */
-(void)requestFinished:(FRTBaseRequest *)baseRequest;

/**
 *  请求失败
 *
 *  @param baseRequest FRTBaseRequest
 */
-(void)requestFailed:(FRTBaseRequest *)baseRequest;

@end

typedef NS_ENUM(NSInteger,FRTRequestMethod) {
    FRTRequestMethod_Get,
    FRTRequestMethod_Post,
    FRTRequestMethod_Put,
    FRTRequestMethod_Delete
};

typedef NS_ENUM(NSInteger,FRTResponseSerializerType) {
    FRTResponseSerializerTypeHTTP,
    FRTResponseSerializerTypeJSON,
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

/**
 *  下载返回结果
 *
 *  @param response 返回结果
 *  @param filePath 下载后保存的地址
 *  @param error    错误
 */
typedef void(^DownloadCompletionHandler)(NSURLResponse *response, NSURL *filePath, NSError *error);

@interface FRTBaseRequest : NSObject

/**
 *  BaseReques代理
 */
@property (nonatomic,weak) id<FRTBaseRequestDelegate> delegate;

/**
 *  响应结果
 */
@property (nonatomic,strong) id responseObject;

/**
 *  当前系统时间
 */
@property (nonatomic,strong) NSString *currentTime;
/**
 *  会话
 */
@property (nonatomic,strong) NSURLSessionTask *sessionTask;

/**
 *  Http返回头
 */
@property (nonatomic,strong,readonly) NSDictionary *responseHttpHeads;

/**
 *  服务器响应
 */
@property (nonatomic,strong) NSURLResponse *response;

/**
 *  下载进度
 */
@property (nonatomic,strong) NSProgress *downloadProgress;

/**
 *  文件下载路径(NSURL)
 */
@property (nonatomic,strong) NSURL *filePath;

/**
 *  文件下载路径(NSString)
 */
@property (nonatomic,strong,readonly) NSString *filePathStr;

/**
 *  错误信息
 */
@property (nonatomic,strong,readonly) NSString *errorInfo;

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
 *  下载完成Block
 */
@property (nonatomic,copy) DownloadCompletionHandler downloadCompletionHandler;

/**
 *  创建返回成功和返回失败的Block
 *
 *  @param success 返回成功Block
 *  @param failure 返回失败Block
 */
-(void)startWithCompletionBlockWithSuccess:(FRTRequestCompletionBlock)success
                                    failure:(FRTRequestCompletionBlock)failure;

/**
 *  开始请求
 */
-(void)start;

/**
 *  取消请求
 */
-(void)cancel;

/**
 *  清除循环引用
 */
-(void)clearCircularBlock;

/**
 *  请求方法
 */
-(FRTRequestMethod)requestMethod;

/**
 *  请求序列化Type
 */
-(FRTResponseSerializerType)responseSerializerType;

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
 *  下载保存路径
 */
-(NSString *)downloadSaveAddress;

/**
 *  超时时间
 */
-(NSTimeInterval)requestTimeoutInterval;


@end
