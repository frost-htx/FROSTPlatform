//
//  DemoViewModel.h
//  FROSTPlatform
//
//  Created by frost on 16/9/14.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonHelp : NSObject

@property (nonatomic,copy) NSDictionary *jsonDic;

@property (nonatomic,assign) BOOL isfalg;
@end

@protocol DemoViewModelDelegate <NSObject>

-(void)handleCallBack;

@end

@interface DemoViewModel : NSObject

@property (nonatomic,weak) id<DemoViewModelDelegate> delegate;

-(void)demoRequestAPI_ReadRequestCache:(void(^)())cacheData requestSuccessful:(void(^)())successful requestFailure:(void(^)())failure;

-(void)demoRequestAPI_chainRequest:(void(^)())successful requestFailure:(void(^)())failure;

-(void)demoRequestAPI_BatchRequest:(void(^)())successful requestFailure:(void(^)())failure;


@end
