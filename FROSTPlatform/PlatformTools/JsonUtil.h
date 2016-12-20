//
//  JsonUtil.h
//  OnceAlbum
//
//  Created by frost on 15/7/15.
//  Copyright (c) 2015年 &#23609;&#40527;&#39134;. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface JsonUtil : NSObject
/**
 * 将一个对象转换为json字符串
 * @param object    对象
 * @param array     对象属性表
 * @return          json字符串
 */
+ (NSString *)objectToJsonString:(id)object propertiesName:(NSArray *)array;
/**
 * 将一个json字符串转换成一个对象
 * @param jsonString    json字符串
 * @param clazz         对象的class
 * @return              class对应的对象
 */
+ (id)jsonStringToObject:(NSString *)jsonString objectType:(Class)clazz;
/**
 * 将一个json字符串转换成一个对象
 * @param jsonString    json字符串
 * @return              对象（dic或者array）
 */
+ (id)jsonStringToObject:(NSString *)jsonString;

+ (NSDictionary *)jsonDic_NSDataToNSDictionary:(NSData *)jsonData;

@end
