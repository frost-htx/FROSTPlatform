//
//  FRTNetWorkAgent.m
//  FROSTPlatform
//
//  Created by frost on 16/9/2.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "FRTNetWorkAgent.h"

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
    FRTRequestSerializerType serializerType = [request requestSerializerType];
    id parameters = [request requestParameters];
    NSString *requestUrl = [self buildRequesttUrl:request];
    NSDictionary *httpHeads = [request requestHttpHeads];
    
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    if (httpHeads) {
        [httpHeads enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = requestSerializer;

    if (method == FRTRequestMethod_Get) {
        if ([request downloadSaveAddress]) {
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:requestUrl]];
            [manager downloadTaskWithRequest:urlRequest progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                return [NSURL URLWithString:[request downloadSaveAddress]];
            } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                
            }];
        } else {
            [manager GET:requestUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
        }
    }
}

-(void)cancelRequest:(FRTBaseRequest *)request {

}

#pragma mark private methods

-(NSString *)buildRequesttUrl:(FRTBaseRequest *)request {
    
    NSString *domainUrl = [request domainUrl];
    NSString *requestUrl = [request requestUrl];

    if (domainUrl && requestUrl) {
        return [NSString stringWithFormat:@"%@%@",domainUrl,requestUrl];
    } else {
        return @"";
    }
}

@end
