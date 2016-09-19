//
//  DemoViewModel.m
//  FROSTPlatform
//
//  Created by frost on 16/9/14.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "DemoViewModel.h"
#import "FRTChainRequest.h"
#import "DemoRequestAPI.h"
#import "DemoModel.h"
#import "DemoRequestAPI1.h"
#import "DemoRequestAPI2.h"

@interface DemoViewModel ()<FRTChainRequestDeleate>

@property (nonatomic,strong) NSString *cateId;
@property (nonatomic,strong) NSString *order;
@property (nonatomic,strong) NSString *pageNumber;

@property (nonatomic,strong) NSString *platform;
@property (nonatomic,strong) NSString *version;

@property (nonatomic,strong) DemoModel *demoModel;
@property (nonatomic,strong) DemoRequestAPI *requestAPI;

@end

@implementation DemoViewModel

#pragma mark life cycle

-(instancetype)init {
    if (self = [super init]) {
        self.pageNumber = @"20";
        self.order = @"";
        self.cateId = @"-1";
        
        self.platform = @"ios";
        self.version = @"13000";
    }
    return self;
}

#pragma mark FRTChainRequestDeleate 

-(void)chainRequestFinish:(FRTChainRequest *)chainRequest {
    
}

-(void)chainRequestFailed:(FRTChainRequest *)chainRequest baseRequest:(FRTBaseRequest *)baseRequest {
    
}

#pragma mark Public Methods

-(void)demoRequestAPI_ReadRequestCache:(void(^)())cacheDataBlock requestSuccessful:(void(^)())successful requestFailure:(void(^)())failure {
    
    DemoRequestAPI *requestAPI = [[DemoRequestAPI alloc] initWithCateId:self.cateId order:self.order pageNumber:self.pageNumber];
    
    if (cacheDataBlock) {
        NSDictionary *cacheDic = [requestAPI readCacheResponseData];
        [self buildDemoModel:cacheDic];
        cacheDataBlock();
    }
    
    [requestAPI startWithCompletionBlockWithSuccess:^(__kindof FRTBaseRequest *request) {
        [self buildDemoModel:request.responseObject];
        if (successful) {
            successful();
        }
    } failure:^(__kindof FRTBaseRequest *request) {
        if (failure) {
            failure();
        }
    }];
    
    [requestAPI start];
}

-(void)demoRequestAPI_chainRequest:(void(^)())successful requestFailure:(void(^)())failure {
    
    DemoRequestAPI1 *demoRequestAPI1 = [[DemoRequestAPI1 alloc] initWithPlatform:self.platform version:self.version];
    
    FRTChainRequest *chainRequest = [[FRTChainRequest alloc] init];
    [chainRequest setRequest:demoRequestAPI1 callBack:^(FRTBaseRequest *baseRequest, FRTChainRequest *chainRequest) {
        DemoRequestAPI1 *api = (DemoRequestAPI1 *)baseRequest;
        NSString *url = [api url];
        DemoRequestAPI2 *demoRequestAPI2 = [[DemoRequestAPI2 alloc] initWithUrl:url];
        [chainRequest setRequest:demoRequestAPI2 callBack:nil];
//        DemoRequestAPI1 *demoRequestAPI1 = [[DemoRequestAPI1 alloc] initWithPlatform:self.platform version:self.version];
//        [chainRequest setRequest:demoRequestAPI1 callBack:nil];

    }];
    chainRequest.delegate = self;
    [chainRequest start];
}

#pragma mark Private Methods

-(void)buildDemoModel:(NSDictionary *)dic {
    if (dic) {
        NSDictionary *jsonDic = [dic objectForKey:@"data"];
        self.demoModel = [DemoModel modelWithJSON:jsonDic];
    }
}

#pragma mark getters and setters 

-(DemoRequestAPI *)requestAPI {
    if (!_requestAPI) {
        _requestAPI = [[DemoRequestAPI alloc] init];
    }
    return _requestAPI;
}

@end
