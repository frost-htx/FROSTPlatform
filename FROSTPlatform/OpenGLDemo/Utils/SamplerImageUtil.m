//
//  SamplerImageUtil.m
//  FROSTPlatform
//
//  Created by frost on 2017/7/19.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "SamplerImageUtil.h"
#import <OpenGLES/ES2/gl.h>
#include "GLUtil.h"
#include "JpegUtil.h"

@implementation SamplerImageUtil

#pragma mark - Public Methods

+ (GLuint)setupTextureCoreGraphicsToImage:(NSString *)imageDataPath {

    UIImage *image = [UIImage imageWithContentsOfFile:imageDataPath];
    
    CGImageRef cgImageRef = [image CGImage];
    GLuint width = (GLuint)CGImageGetWidth(cgImageRef);
    GLuint height = (GLuint)CGImageGetHeight(cgImageRef);
    CGRect rect = CGRectMake(0, 0, width, height);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    void *imageData = malloc(width * height * 4);
    CGContextRef context = CGBitmapContextCreate(imageData, width, height, 8, width * 4, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGContextTranslateCTM(context, 0, height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    CGColorSpaceRelease(colorSpace);
    CGContextClearRect(context, rect);
    CGContextDrawImage(context, rect, cgImageRef);
    glEnable(GL_TEXTURE_2D);
    
    GLuint textureID = createTexture2D(GL_RGBA, width, height, imageData);
    
    glBindTexture(GL_TEXTURE_2D, 0);
    CGContextRelease(context);
    free(imageData);
    return textureID;
}

+ (GLuint)setupTextureJpeglibToImage:(NSString *)imageDataPath {
    
    unsigned char *data;
    int size;
    int width;
    int height;
    
    if (read_jpeg_file(imageDataPath.UTF8String, &data, &size, &width, &height) < 0) {
        printf("%s\n", "decode fail");
    }
    
    GLuint textureID = createTexture2D(GL_RGB, width, height, data);
    return textureID;
}

#pragma mark - Private Methods



@end
