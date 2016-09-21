//
//  FRTNetWorkAgent.m
//  FROSTPlatform
//
//  Created by frost on 16/9/2.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "FRTNetWorkAgent.h"

@interface FRTNetWorkAgent ()

@property (nonatomic,strong) NSMutableDictionary<NSString *, FRTBaseRequest *> *requestDic;

@end

@implementation FRTNetWorkAgent

#pragma mark life cycle

+(FRTNetWorkAgent *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark public methods

-(void)addRequest:(FRTBaseRequest *)request {
    
    FRTRequestMethod method = [request requestMethod];
    FRTResponseSerializerType serializerType = [request responseSerializerType];
    id parameters = [request requestParameters];
    NSString *requestUrl = [self buildRequesttUrl:request];
    NSDictionary *httpHeads = [request requestHttpHeads];
    NSURLSessionTask *sessionTask = nil;

    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    if (httpHeads) {
        [httpHeads enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
    
    AFHTTPResponseSerializer *responseSerializer = nil;
    if (serializerType == FRTResponseSerializerTypeHTTP) {
        responseSerializer = [AFHTTPResponseSerializer serializer];
    } else {
        responseSerializer = [AFJSONResponseSerializer serializer];
    }
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"application/octet-stream", nil];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = requestSerializer;
    manager.responseSerializer = responseSerializer;
    
    if (method == FRTRequestMethod_Get) {
        if ([request downloadSaveAddress]) {
            NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestUrl]];
            if (httpHeads) {
                [httpHeads enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    [urlRequest setValue:obj forHTTPHeaderField:key];
                }];
            }
            sessionTask = [manager downloadTaskWithRequest:urlRequest progress:^(NSProgress * _Nonnull downloadProgress) {
                request.downloadProgress = downloadProgress;
            } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                return [NSURL fileURLWithPath:[request downloadSaveAddress]];
            } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                request.response = response;
                request.requestError = error;
                request.filePath = filePath;
                [self requestCompleteHandle:request];
            }];
            [sessionTask resume];
        } else {
            sessionTask = [manager GET:requestUrl parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
                request.downloadProgress = uploadProgress;
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                request.responseObject = responseObject;
                [self requestCompleteHandle:request];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                request.requestError = error;
                [self requestCompleteHandle:request];
            }];
        }
    } else if (method == FRTRequestMethod_Post) {
        sessionTask = [manager POST:requestUrl parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            request.downloadProgress = uploadProgress;
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            request.responseObject = responseObject;
            [self requestCompleteHandle:request];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            request.requestError = error;
            [self requestCompleteHandle:request];
        }];
    
    } else if (method == FRTRequestMethod_Put) {
        sessionTask = [manager PUT:requestUrl parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            request.responseObject = responseObject;
            [self requestCompleteHandle:request];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            request.requestError = error;
            [self requestCompleteHandle:request];
        }];
    } else if (method == FRTRequestMethod_Delete) {
        sessionTask = [manager DELETE:requestUrl parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            request.responseObject = responseObject;
            [self requestCompleteHandle:request];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            request.requestError = error;
            [self requestCompleteHandle:request];
        }];
    }
    
    request.sessionTask = sessionTask;
    [self addRequestToRequstDic:request];
}

-(void)cancelRequest:(FRTBaseRequest *)request {
    if (request) {
        [request.sessionTask cancel];
        NSString *key = [NSString stringWithFormat:@"%lu",(unsigned long)[request hash]];
        @synchronized (self) {
            [self.requestDic removeObjectForKey:key];
        }
    }
}

-(void)cancelAllRequest {
    [self.requestDic enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, FRTBaseRequest * _Nonnull obj, BOOL * _Nonnull stop) {
        [obj.sessionTask cancel];
    }];
    [self.requestDic removeAllObjects];
}

#pragma mark private methods

-(void)requestCompleteHandle:(FRTBaseRequest *)request {
    if (!request.requestError) {
        if (!request.isIgnoreCache) {
            [request writeCacheResponseData];
        }
        if (request.successCompletionBlock) {
            request.successCompletionBlock(request);
        }
        if (request.delegate && [request.delegate respondsToSelector:@selector(requestFinished:)]) {
            [request.delegate requestFinished:request];
        }
    } else {
        if (request.failureCompletionBlock) {
            request.failureCompletionBlock(request);
        }
        if (request.delegate && [request.delegate respondsToSelector:@selector(requestFailed:)]) {
            [request.delegate requestFailed:request];
        }

    }
    [self removeRequestToRequstDic:request];
    [request clearCircularBlock];
}

-(NSString *)buildRequesttUrl:(FRTBaseRequest *)request {
    
    NSString *domainUrl = [request domainUrl];
    NSString *requestUrl = [request requestUrl];

    if (domainUrl && requestUrl) {
        return [NSString stringWithFormat:@"%@%@",domainUrl,requestUrl];
    } else if (domainUrl){
        return domainUrl;
    } else {
        return @"";
    }
}

-(void)addRequestToRequstDic:(FRTBaseRequest *)request {
    if (request) {
        NSString *key = [NSString stringWithFormat:@"%lu",(unsigned long)[request hash]];
        @synchronized (self) {
            [self.requestDic setObject:request forKey:key];
        }
    }
}

-(void)removeRequestToRequstDic:(FRTBaseRequest *)request {
    if (request) {
        NSString *key = [NSString stringWithFormat:@"%lu",(unsigned long)[request hash]];
        @synchronized (self) {
            [self.requestDic removeObjectForKey:key];
        }
    }
}

#pragma mark getters and setters 

-(NSMutableDictionary<NSString *,FRTBaseRequest *> *)requestDic {
    if (!_requestDic) {
        _requestDic = [NSMutableDictionary dictionary];
    }
    return _requestDic;
}

@end
