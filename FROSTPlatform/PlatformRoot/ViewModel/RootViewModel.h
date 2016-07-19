//
//  RootViewModel.h
//  FROSTPlatform
//
//  Created by frost on 16/7/18.
//  Copyright © 2016年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonUtil.h"

@interface RootViewModel : NSObject


-(NSDictionary *)readLocalJson:(NSString *)fileName fileType:(NSString *)fileType;
@end
