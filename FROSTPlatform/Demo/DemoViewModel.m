//
//  DemoViewModel.m
//  FROSTPlatform
//
//  Created by frost on 16/9/14.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "DemoViewModel.h"
#import "FRTChainRequest.h"
#import "FRTBatchRequest.h"
#import "DemoRequestAPI.h"
#import "DemoModel.h"
#import "DemoRequestAPI1.h"
#import "DemoRequestAPI2.h"
#import "DemoRequestImageAPI.h"
#import "BaseService.h"

@implementation JsonHelp

+(instancetype)shareJsonHelp {
    static JsonHelp *shareManager = nil;
    static dispatch_once_t editManager;
    dispatch_once(&editManager, ^{
        shareManager = [[self alloc] init];
    });
    return shareManager;
}

//-(NSDictionary *)jsonDic {
//    if (!_jsonDic) {
//        _jsonDic = [NSDictionary dictionary];
//    }
//    return _jsonDic;
//}

-(void)setJsonDic:(NSDictionary *)jsonDic {
    _jsonDic = [NSDictionary dictionaryWithDictionary:jsonDic];
}

@end


@interface DemoViewModel ()<FRTChainRequestDeleate>

@property (nonatomic,strong) NSString *cateId;
@property (nonatomic,strong) NSString *order;
@property (nonatomic,strong) NSString *pageNumber;

@property (nonatomic,strong) NSString *platform;
@property (nonatomic,strong) NSString *version;

@property (nonatomic,strong) DemoModel *demoModel;
@property (nonatomic,strong) DemoRequestAPI *requestAPI;

@property (nonatomic,strong) NSDictionary *demoDic;

@end

@implementation DemoViewModel

#pragma mark life cycle

-(void)dealloc {
    
}

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
    
//    DemoRequestAPI *requestAPI = [[DemoRequestAPI alloc] initWithCateId:self.cateId order:self.order pageNumber:self.pageNumber];
//    
//    if (cacheDataBlock) {
//        NSDictionary *cacheDic = [requestAPI readCacheResponseData];
//        [self buildDemoModel:cacheDic];
//        cacheDataBlock();
//    }
//    
//    [requestAPI startWithCompletionBlockWithSuccess:^(__kindof FRTBaseRequest *request) {
//        [self buildDemoModel:request.responseObject];
//        if (successful) {
//            successful();
//        }
//    } failure:^(__kindof FRTBaseRequest *request) {
//        if (failure) {
//            failure();
//        }
//    }];
//    
//    [requestAPI start];
    
//    [BaseService getDataWithUrlPath:@"http://m.zuzuche.com/v2/?m=api/map/spots/getAllSpots" params:nil customHTTPHead:nil successfulBlock:^(NSURLSessionDataTask *dataTask, id responseObject) {
//        
//        NSDictionary *dic = [JsonUtil jsonDic_NSDataToNSDictionary:responseObject];
//        
//        self.demoDic = dic;
//        [JsonHelp shareJsonHelp].jsonDic = dic;
//        
//        [JsonHelp shareJsonHelp].isfalg = NO;
//        
//        self.version = nil;
//        [self testAction];
//    } failureBlock:^(NSError *error) {
//        
//    }];
    
    WS(weakSelf, self);
    
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"http://m.zuzuche.com/v2/?m=api/map/spots/getAllSpots" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
//        NSDictionary *dic = responseObject;
////
//        self.demoDic = dic;
//        [JsonHelp shareJsonHelp].jsonDic = dic;
//
//        [JsonHelp shareJsonHelp].isfalg = NO;
//        
//        self.version = nil;
//        [weakSelf testAction];
        
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(handleCallBack)]) {
            [weakSelf ]
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            
        }
    }];
}

-(void)testAction {
    printf("123");
}

-(void)demoRequestAPI_chainRequest:(void(^)())successful requestFailure:(void(^)())failure {
    
    DemoRequestAPI1 *demoRequestAPI1 = [[DemoRequestAPI1 alloc] initWithPlatform:self.platform version:self.version];
    
    FRTChainRequest *chainRequest = [[FRTChainRequest alloc] init];
    [chainRequest setRequest:demoRequestAPI1 callBack:^(FRTBaseRequest *baseRequest, FRTChainRequest *chainRequest) {
        DemoRequestAPI1 *api = (DemoRequestAPI1 *)baseRequest;
        NSString *url = [api url];
        DemoRequestAPI2 *demoRequestAPI2 = [[DemoRequestAPI2 alloc] initWithUrl:url];
        [chainRequest setRequest:demoRequestAPI2 callBack:^(FRTBaseRequest *baseRequest, FRTChainRequest *chainRequest) {
            NSLog(@"%@",baseRequest.filePathStr);
        }];
    }];
    chainRequest.delegate = self;
    [chainRequest start];
}

-(void)demoRequestAPI_BatchRequest:(void(^)())successful requestFailure:(void(^)())failure {
    DemoRequestImageAPI *demoRequestImageAPI1 = [[DemoRequestImageAPI alloc] initWithImageId:@"05f13195-ff3d-468a-9709-e41764047fbe.jpg@248w_248h_80q"];
    DemoRequestImageAPI *demoRequestImageAPI2 = [[DemoRequestImageAPI alloc] initWithImageId:@"063aca9c-4152-4f49-8d4d-30b66ecb4548.jpg@248w_248h_80q"];
    DemoRequestImageAPI *demoRequestImageAPI3 = [[DemoRequestImageAPI alloc] initWithImageId:@"0825c075-b0db-410b-bf8e-1a64702f11e7.jpg@248w_248h_80q"];
    DemoRequestImageAPI *demoRequestImageAPI4 = [[DemoRequestImageAPI alloc] initWithImageId:@"131f0102-baf4-4150-898b-669a4b2ee0ba.jpg@248w_248h_80q"];
    DemoRequestImageAPI *demoRequestImageAPI5 = [[DemoRequestImageAPI alloc] initWithImageId:@"086045c0-fe73-4fe1-91162a-5901e4afeec8.jpg@248w_248h_80q"];
    
    FRTBatchRequest *batchRequest = [[FRTBatchRequest alloc] initWithBatchArray:@[demoRequestImageAPI1,demoRequestImageAPI2,demoRequestImageAPI3,demoRequestImageAPI4,demoRequestImageAPI5]];
    [batchRequest startWithCompletionBlockWithSuccess:^(__kindof FRTBatchRequest *batchRequest) {
        
    } failure:^(__kindof FRTBatchRequest *batchRequest) {
        NSString *error = batchRequest.failedRequest.errorInfo;
    }];
}

#pragma mark Private Methods

-(void)buildDemoModel:(NSDictionary *)dic {
//    if (dic) {
//        NSDictionary *jsonDic = [dic objectForKey:@"data"];
//        self.demoModel = [DemoModel modelWithJSON:jsonDic];
//    }
}

#pragma mark getters and setters 

-(NSDictionary *)demoDic {
    if (!_demoDic) {
        _demoDic = [NSDictionary dictionary];
    }
    return _demoDic;
}

-(DemoRequestAPI *)requestAPI {
    if (!_requestAPI) {
        _requestAPI = [[DemoRequestAPI alloc] init];
    }
    return _requestAPI;
}

@end
