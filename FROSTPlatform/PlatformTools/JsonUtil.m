//
//  JsonUtil.m
//  OnceAlbum
//
//  Created by frost on 15/7/15.
//  Copyright (c) 2015年 &#23609;&#40527;&#39134;. All rights reserved.
//


#import "JsonUtil.h"
@interface JsonUtil()
+ (id)parseResult:(NSDictionary *)dic type:(Class)clazz;
@end

@implementation JsonUtil
+ (id)parseResult:(NSDictionary *)dic type:(Class)clazz
{
    id tmp = [[clazz alloc] init] ;
    for (NSString *key in dic) {
        [tmp setValue:[dic objectForKey:key] forKey:key];
    }
    return tmp;
}
+ (NSString *)objectToJsonString:(id)object propertiesName:(NSArray *)array
{
    NSDictionary *dic = [object dictionaryWithValuesForKeys:array];
    NSString *json = nil;
    
    if ([NSJSONSerialization isValidJSONObject:dic])
    {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
        json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return json;
}

+ (id)jsonStringToObject:(NSString *)jsonString objectType:(Class)clazz
{
    if(jsonString == nil){
        return nil;
    }
    NSData *data= [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id tmp  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSDictionary *tmpDic;
    id returnObj = nil;
    if([tmp isKindOfClass:[NSArray class]]){
        returnObj = [NSMutableArray array];
        NSArray *array = (NSArray *)tmp;
        for (id tmp in array) {
            tmpDic = (NSDictionary *)tmp;
            [returnObj addObject:[self parseResult:tmpDic type:clazz]];
        }
    }else if([tmp isKindOfClass:[NSDictionary class]]){
        tmpDic = (NSDictionary *)tmp;
        returnObj = [self parseResult:tmpDic type:clazz];
    }
    return returnObj;
}

+ (id)jsonStringToObject:(NSString *)jsonString
{
    if(jsonString == nil){
        return nil;
    }
    NSData *data= [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id tmp  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    return tmp;
}

@end
