//
//  BaseService.h
//  Maps
//
//  Created by frost on 16/8/1.
//  Copyright © 2016年 TanTu.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface BaseService : NSObject

/**
 *  GET请求
 *
 *  @param aPath      请求地址
 *  @param aParams    请求参数
 *  @param successful 成功回调
 *  @param failure    失败回调
 */
+(void)getDataWithUrlPath:(NSString *)aPath
                   params:(NSDictionary *)aParams
           customHTTPHead:(NSDictionary *)headDic
          successfulBlock:(void(^)(NSURLSessionDataTask * dataTask,id responseObject))successful
             failureBlock:(void(^)(NSError *error))failure;

/**
 *  GET请求
 *
 *  @param aPath      请求地址
 *  @param aParams    请求参数
 *  @param successful 成功回调
 *  @param failure    失败回调
 *  @Return           NSURLSessionDataTask
 */
+(NSURLSessionDataTask *)getDataWithUrlPath_ReturnTask:(NSString *)aPath
                                                params:(NSDictionary *)aParams
                                        customHTTPHead:(NSDictionary *)headDic
                                       successfulBlock:(void(^)(NSURLSessionDataTask * dataTask,id responseObject))successful
                                          failureBlock:(void(^)(NSError *error))failure;

/**
 *  POST请求
 *
 *  @param aPath      请求地址
 *  @param aParams    请求参数
 *  @param successful 成功回调
 *  @param failure    失败回调
 */
+(void)postDataWithUrlPath:(NSString *)aPath
                    params:(id)aParams
            customHTTPHead:(NSDictionary *)headDic
           successfulBlock:(void(^)(NSURLSessionDataTask * dataTask,id responseObject))successful
              failureBlock:(void(^)(NSError *error))failure;

/**
 *  POST_JSON请求
 *
 *  @param aPath      请求地址
 *  @param aParams    请求参数
 *  @param successful 成功回调
 *  @param failure    失败回调
 */
+(void)postJsonDataWithUrlPath:(NSString *)aPath
                    params:(id)aParams
            customHTTPHead:(NSDictionary *)headDic
           successfulBlock:(void(^)(NSURLSessionDataTask * dataTask,id responseObject))successful
              failureBlock:(void(^)(NSError *error))failure;

/**
 带构建Body的POST请求

 @param aPath 请求地址
 @param aParams 请求参数
 @param constructingBlock 构建的Body
 @param uploadProgressBlock 进度回调
 @param successful 成功回调
 @param failure 失败回调
 */
+(void)postDataWithUrlPath:(NSString *)aPath
                    params:(NSDictionary *)aParams
            customHTTPHead:(NSDictionary *)headDic
 constructingBodyWithBlock:(void(^)(id <AFMultipartFormData> formData))constructingBlock
                  progress:(void(^)(NSProgress *uploadProgress))uploadProgressBlock
           successfulBlock:(void(^)(NSURLSessionDataTask * dataTask,id responseObject))successful
              failureBlock:(void(^)(NSError *error))failure;

/**
 *  下载文件
 *
 *  @param aPath                请求地址
 *  @param headDic              自定义HTTP头
 *  @param filePath             文件存放目录
 *  @param fileName             文件名
 *  @param uploadProgressBlock  下载进度
 *  @param successful           下载成功
 *  @param failure              下载失败
 */
+(void)downloadFileWithUrlPath:(NSString *)aPath
                customHTTPHead:(NSDictionary *)headDic
                  saveFilePath:(NSString *)filePath
                  saveFileName:(NSString *)fileName
                      progress:(void(^)(NSProgress *uploadProgress))uploadProgressBlock
               successfulBlock:(void(^)(NSURL *filePath,NSURLResponse *response))successful
                  failureBlock:(void(^)(NSError *error))failure;

/**
 *  下载文件
 *
 *  @param aPath                请求地址
 *  @param headDic              自定义HTTP头
 *  @param filePath             文件存放目录
 *  @param fileName             文件名
 *  @param uploadProgressBlock  下载进度
 *  @param successful           下载成功
 *  @param failure              下载失败
 *  @return DownloadTask        返回DownloadTask
 */
+(NSURLSessionDownloadTask *)downloadFileWithUrlPath_ReturnTask:(NSString *)aPath
                                                 customHTTPHead:(NSDictionary *)headDic
                                                   saveFilePath:(NSString *)filePath
                                                   saveFileName:(NSString *)fileName
                                                       progress:(void(^)(NSProgress *uploadProgress))uploadProgressBlock
                                                successfulBlock:(void(^)(NSURL *filePath,NSURLResponse *response))successful
                                                   failureBlock:(void(^)(NSError *error))failure;
@end
