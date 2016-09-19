//
//  FRTConfigTools.h
//  FROSTPlatform
//
//  Created by frost on 16/9/2.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRTConfigTools : NSObject

/**
 *  创建单例
 *
 *  @return FRTConfigTools
 */
+(FRTConfigTools *)sharedInstance;

/**
 *  获取appVersion
 *
 *  @return appVersion
 */
-(NSString *)appVersionString;

/**
 *  md5-String
 *
 *  @param string 需要MD5的String
 *
 *  @return MD5后的String
 */
-(NSString *)md5StringFromString:(NSString *)string;

@end
