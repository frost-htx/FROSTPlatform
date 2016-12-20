//
//  BaseService.m
//  Maps
//
//  Created by frost on 16/8/1.
//  Copyright © 2016年 TanTu.com. All rights reserved.
//

#import "BaseService.h"

#ifdef DEBUG

#define NSlog( s, ... ) NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#else

#define NSlog( s, ... )

#endif

#define App_WebView_UserAgent [[NSUserDefaults standardUserDefaults] valueForKey:@"ZZCAppUserAgentKey"]

typedef NS_ENUM(NSUInteger, RequestSerializerType)
{
  HTTPRequestSerializer,    //常规cell
  JSONRequestSerializer,  //现实轮播图cell，目前的'推荐'列
};

@interface BaseService ()


@end

@implementation BaseService

#pragma mark Public Methods

+(void)getDataWithUrlPath:(NSString *)aPath
                   params:(NSDictionary *)aParams
           customHTTPHead:(NSDictionary *)headDic
          successfulBlock:(void(^)(NSURLSessionDataTask * dataTask,id responseObject))successful
             failureBlock:(void(^)(NSError *error))failure {
  
  if (!aPath || [aPath isEqualToString:@""])  return;

  AFHTTPSessionManager *manager = [self getAFHTTPSessionManager:HTTPRequestSerializer requestHTTPHeadDic:headDic];
  
  [manager GET:aPath parameters:aParams progress:^(NSProgress * _Nonnull uploadProgress) {
    
  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
    if(successful) {
      successful(task,responseObject);
    }
    
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    if (failure) {
      
      NSlog(@"接口错误信息:%@==================================>%@",aPath,error);
      failure(error);
    }
  }];
  
}

+(NSURLSessionDataTask *)getDataWithUrlPath_ReturnTask:(NSString *)aPath
                                                params:(NSDictionary *)aParams
                                        customHTTPHead:(NSDictionary *)headDic
                                       successfulBlock:(void(^)(NSURLSessionDataTask * dataTask,id responseObject))successful
                                          failureBlock:(void(^)(NSError *error))failure {
  
  if (!aPath || [aPath isEqualToString:@""])  return nil;

  AFHTTPSessionManager *manager = [self getAFHTTPSessionManager:HTTPRequestSerializer requestHTTPHeadDic:headDic];
  
  NSURLSessionDataTask * dataTask= [manager GET:aPath parameters:aParams progress:^(NSProgress * _Nonnull uploadProgress) {
    
  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
    if(successful) {
      successful(task,responseObject);
    }
    
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    if (failure) {
      
      NSlog(@"接口错误信息:%@==================================>%@",aPath,error);
      failure(error);
    }
  }];
  
  return dataTask;
}

+(void)postDataWithUrlPath:(NSString *)aPath
                    params:(id)aParams
            customHTTPHead:(NSDictionary *)headDic
           successfulBlock:(void(^)(NSURLSessionDataTask * dataTask,id responseObject))successful
              failureBlock:(void(^)(NSError *error))failure {
  
  if (!aPath || [aPath isEqualToString:@""])  return ;

  AFHTTPSessionManager *manager = [self getAFHTTPSessionManager:HTTPRequestSerializer requestHTTPHeadDic:headDic];
  
  [manager POST:aPath parameters:aParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

    if(successful) {
      successful(task,responseObject);
    }
    
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
    if (failure) {
      failure(error);
      NSlog(@"接口错误信息:%@==================================>%@",aPath,error);
    }
    
  }];
}

+(void)postJsonDataWithUrlPath:(NSString *)aPath
                        params:(id)aParams
                customHTTPHead:(NSDictionary *)headDic
               successfulBlock:(void(^)(NSURLSessionDataTask * dataTask,id responseObject))successful
                  failureBlock:(void(^)(NSError *error))failure {
  
  if (!aPath || [aPath isEqualToString:@""])  return ;
  
  AFHTTPSessionManager *manager = [self getAFHTTPSessionManager:JSONRequestSerializer requestHTTPHeadDic:headDic];
  
  [manager POST:aPath parameters:aParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
    if(successful) {
      successful(task,responseObject);
    }
    
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
    if (failure) {
      failure(error);
      NSlog(@"接口错误信息:%@==================================>%@",aPath,error);
    }
    
  }];
}

+(void)postDataWithUrlPath:(NSString *)aPath
                    params:(NSDictionary *)aParams
            customHTTPHead:(NSDictionary *)headDic
 constructingBodyWithBlock:(void(^)(id <AFMultipartFormData> formData))constructingBlock
                  progress:(void(^)(NSProgress *uploadProgress))uploadProgressBlock
           successfulBlock:(void(^)(NSURLSessionDataTask * dataTask,id responseObject))successful
              failureBlock:(void(^)(NSError *error))failure {
  
  if (!aPath || [aPath isEqualToString:@""])  return ;
  
  AFHTTPSessionManager *manager = [self getAFHTTPSessionManager:HTTPRequestSerializer requestHTTPHeadDic:headDic];
  
  [manager POST:aPath parameters:aParams constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    if (constructingBlock) {
      constructingBlock(formData);
    }
  } progress:^(NSProgress * _Nonnull uploadProgress) {
    if (uploadProgressBlock) {
      uploadProgressBlock(uploadProgress);
    }
  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    if (successful) {
      successful(task,responseObject);
    }
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    if (failure) {
      NSlog(@"接口错误信息:%@==================================>%@",aPath,error);
      failure(error);
    }
  }];
  
}

+(void)downloadFileWithUrlPath:(NSString *)aPath
                customHTTPHead:(NSDictionary *)headDic
                  saveFilePath:(NSString *)filePath
                  saveFileName:(NSString *)fileName
                      progress:(void(^)(NSProgress *uploadProgress))uploadProgressBlock
               successfulBlock:(void(^)(NSURL *filePath,NSURLResponse *response))successful
                  failureBlock:(void(^)(NSError *error))failure {
  
  if (!aPath || [aPath isEqualToString:@""])  return ;
  
  AFHTTPSessionManager *manager = [self getAFHTTPSessionManager:HTTPRequestSerializer requestHTTPHeadDic:headDic];
  
  NSMutableURLRequest *urlRequest = [self getDownloadURLRequest:aPath customHeadDic:headDic];

  NSURLSessionDownloadTask *sessionTask = [manager downloadTaskWithRequest:urlRequest progress:^(NSProgress * _Nonnull downloadProgress) {
    
    if (uploadProgressBlock) {
      uploadProgressBlock(downloadProgress);
    }
    
  } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
    
    if (fileName) {
      return [[NSURL fileURLWithPath:filePath] URLByAppendingPathComponent:fileName];
    } else {
      return [NSURL fileURLWithPath:filePath];
    }
    
  } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
    
    if (error) {
      NSlog(@"接口错误信息:%@==================================>%@",aPath,error);
      if (failure) {
        failure(error);
      }
    } else {
      if (successful) {
        successful(filePath,response);
      }
    }
    
  }];
  
  [sessionTask resume];
  
}

+(NSURLSessionDownloadTask *)downloadFileWithUrlPath_ReturnTask:(NSString *)aPath
                                                 customHTTPHead:(NSDictionary *)headDic
                                                   saveFilePath:(NSString *)filePath
                                                   saveFileName:(NSString *)fileName
                                                       progress:(void(^)(NSProgress *uploadProgress))uploadProgressBlock
                                                successfulBlock:(void(^)(NSURL *filePath,NSURLResponse *response))successful
                                                   failureBlock:(void(^)(NSError *error))failure {
  
  if (!aPath || [aPath isEqualToString:@""])  return nil;
  
  AFHTTPSessionManager *manager = [self getAFHTTPSessionManager:HTTPRequestSerializer requestHTTPHeadDic:headDic];
  
  NSMutableURLRequest *urlRequest = [self getDownloadURLRequest:aPath customHeadDic:headDic];
  
  NSURLSessionDownloadTask *sessionTask = [manager downloadTaskWithRequest:urlRequest progress:^(NSProgress * _Nonnull downloadProgress) {
    
    if (uploadProgressBlock) {
      uploadProgressBlock(downloadProgress);
    }
    
  } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
    
    if (fileName) {
      return [[NSURL fileURLWithPath:filePath] URLByAppendingPathComponent:fileName];
    } else {
      return [NSURL fileURLWithPath:filePath];
    }
    
  } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
    
    if (error) {
      NSlog(@"接口错误信息:%@==================================>%@",aPath,error);
      if (failure) {
        failure(error);
      }
    } else {
      if (successful) {
        successful(filePath,response);
      }
    }
    
  }];
  
  [sessionTask resume];
  
  return sessionTask;
}

#pragma mark Private Methods

/**
 获取SessionManager

 @return SessionManager
 */
+(AFHTTPSessionManager *)getAFHTTPSessionManager:(RequestSerializerType)requestSerializerType requestHTTPHeadDic:(NSDictionary *)requestHTTPHeadDic{
  
  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  AFHTTPRequestSerializer *requestSerializer = [self getRequestSerializer:requestSerializerType customHeadDic:requestHTTPHeadDic];
  AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
  manager.requestSerializer = requestSerializer;
  manager.responseSerializer = responseSerializer;
  manager.requestSerializer.timeoutInterval = 15.0;
  
  return manager;
}

/**
 获取下载的URLRequest

 @param strURL 下载地址
 @param customHeadDic HTTP头
 @return 返回下载的URLRequest
 */
+(NSMutableURLRequest *)getDownloadURLRequest:(NSString *)strURL customHeadDic:(NSDictionary *)customHeadDic {
  
  NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:strURL]];
  
  static NSDictionary *httpHeads = nil;
  httpHeads = @{@"User-Agent":App_WebView_UserAgent};
  [httpHeads enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
    [urlRequest setValue:obj forHTTPHeaderField:key];
  }];

  if (customHeadDic) {
    [customHeadDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
      [urlRequest setValue:obj forHTTPHeaderField:key];
    }];
  }
  
  return urlRequest;
}

/**
 获取带有HTTPHead的RequestSerializer

 @return RequestSerializer
 */
+(AFHTTPRequestSerializer *)getRequestSerializer:(RequestSerializerType)requestSerializerType customHeadDic:(NSDictionary *)customHeadDic {
  
  AFHTTPRequestSerializer *requestSerializer = nil;
  if (requestSerializerType == HTTPRequestSerializer) {
    requestSerializer = [AFHTTPRequestSerializer serializer];
  } else {
    requestSerializer = [AFJSONRequestSerializer serializer];
  }
  
  [[NSUserDefaults standardUserDefaults] setObject:@" (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E230" forKey:@"ZZCAppUserAgentKey"];
  [[NSUserDefaults standardUserDefaults] synchronize];

    
  static NSDictionary *httpHeads = nil;
  httpHeads = @{@"User-Agent":App_WebView_UserAgent};
  [httpHeads enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
    [requestSerializer setValue:obj forHTTPHeaderField:key];
  }];
  
  if (customHeadDic) {
    [customHeadDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
      [requestSerializer setValue:obj forHTTPHeaderField:key];
    }];
  }
  
  return requestSerializer;
}

/**
 获取带有ContentTypes的ResponseSerializer

 @return ResponseSerializer
 */
+(AFHTTPResponseSerializer *)getResponseSerializer {
  
  AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
  responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",@"application/octet-stream", nil];
  
  return responseSerializer;
}

@end
