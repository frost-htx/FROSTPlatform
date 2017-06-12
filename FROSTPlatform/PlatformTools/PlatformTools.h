//
//  PlatformTools.h
//  FROSTPlatform
//
//  Created by frost on 17/6/12.
//  Copyright © 2017年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlatformTools : NSObject

@end


@interface FileTools : NSObject

/**
 获取Documents路径

 @return Documents路径
 */
+(NSString *)getAppDocumentsPath;

/**
 获取Documents路径下的文件

 @param fileName 文件名
 @return 文件路径
 */
+(NSString *)getAppDocuments_FilePath:(NSString *)fileName;

/**
 获取MainBundle下的文件

 @param fileName 文件名称
 @param fileType 文件类型
 @return 路径
 */
+(NSString *)getMainBundle_FilePath:(NSString *)fileName fileType:(NSString *)fileType;


@end
