//
//  PlatformTools.m
//  FROSTPlatform
//
//  Created by frost on 17/6/12.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "PlatformTools.h"

@implementation PlatformTools

@end

@implementation FileTools

+(NSString *)getAppDocumentsPath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath=[paths objectAtIndex:0];
    
    return documentsPath;
}

+(NSString *)getAppDocuments_FilePath:(NSString *)fileName {

    NSString *documentsPath = [self getAppDocumentsPath];
    
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    
    return filePath;
}

+(NSString *)getMainBundle_FilePath:(NSString *)fileName fileType:(NSString *)fileType {
   
   NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
    
   return path;
}


@end
