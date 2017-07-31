//
//  SamplerImageUtil.h
//  FROSTPlatform
//
//  Created by frost on 2017/7/19.
//  Copyright © 2017年 frost. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SamplerImageUtil : NSObject

/**
 加载Image，使用CoreGraphics将图片数据转化成OpenGL ES 2.0纹理对象

 @param image UIimage数据
 @return OpenGL ES 2.0 纹理对象
 */
+ (GLuint)setupTextureCoreGraphicsToImage:(NSString *)imageDataPath;


/**
 加载图片路径，使用jpeglib将图片数据转化成OpenGL ES 2.0纹理对象

 @param imageDataPath 图片路径
 @return OpenGL ES 2.0 纹理对象
 */
+ (GLuint)setupTextureJpeglibToImage:(NSString *)imageDataPath;


@end
