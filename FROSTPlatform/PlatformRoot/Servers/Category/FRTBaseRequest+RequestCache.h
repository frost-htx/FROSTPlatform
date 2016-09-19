//
//  FRTBaseRequest+RequestCache.h
//  FROSTPlatform
//
//  Created by frost on 16/9/13.
//  Copyright © 2016年 frost. All rights reserved.
//

#import "FRTBaseRequest.h"

@interface FRTBaseRequest (RequestCache)

/**
 *  是否忽略缓存
 */
@property (nonatomic,assign) BOOL isIgnoreCache;

/**
 *  缓存数据
 */
@property (nonatomic,strong) id cacheData;

/**
 *  写入接口缓存数据
 */
-(void)writeCacheResponseData;

/**
 *  读取缓存数据
 *
 *  @return 缓存数据
 */
-(id)readCacheResponseData;

@end
