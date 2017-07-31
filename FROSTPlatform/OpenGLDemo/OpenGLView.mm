//
//  OpenGLView.m
//  FROSTPlatform
//
//  Created by frost on 2017/7/7.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "OpenGLView.h"
#import <OpenGLES/ES3/gl.h>
#import "GLUtil.h"
#import "SamplerImageUtil.h"
#include <math.h>
#include <iostream>
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

const int n = 20;
const GLfloat R = 0.5f;
const GLfloat Pi = 3.1415926536f;

typedef struct {
    GLfloat x,y,z;
    GLfloat r,g,b;
} Vertex;

@interface OpenGLView ()

@property (nonatomic,strong) EAGLContext *glContext;
@property (nonatomic,strong) CAEAGLLayer *glLayer;
@property (assign) GLuint colorRenderBuffer;
@property (assign) GLuint frameBuffer;
@property (assign) GLuint glProgramBuffer;


@end

@implementation OpenGLView

#pragma mark - life cycle

+(Class)layerClass {
    return [CAEAGLLayer class];
}

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self setupLayer];
        
        [self setupGlContext];
        
        [self setupFrameAndRenderBuffer];

        [self setupGLProgram];
        
        [self render];
        
        
    }
    
    return self;
}

-(void)layoutSubviews {
    
}

-(void)dealloc {
    [self destoryRenderAndFrameBuffer];
}

#pragma mark - Private Methods

-(void)setupLayer {

    self.glLayer = (CAEAGLLayer*) self.layer;
    
    // CALayer 默认是透明的，必须将它设为不透明才能让其可见
    self.glLayer.opaque = YES;
    
    // 设置描绘属性，在这里设置不维持渲染内容以及颜色格式为 RGBA8
    self.glLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
                                     [NSNumber numberWithBool:NO], kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, nil];
    
}

-(void)setupGlContext {
    
    self.glContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
    
    if ([EAGLContext setCurrentContext:self.glContext]) {
        NSLog(@"OpenGL上下文创建成功");
    }
}

- (void)setupFrameAndRenderBuffer {
    
    glGenRenderbuffers(1, &_colorRenderBuffer);                 //申明一个renderbuffers的ID
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);    //将指定 id 的 renderbuffer 设置为当前 renderbuffer 此时会初始化buffer
    [self.glContext renderbufferStorage:GL_RENDERBUFFER fromDrawable:self.glLayer]; //为renderbuffer分配内存空间
    
    glGenFramebuffers(1,&_frameBuffer);                         //申明一个framebuffer的ID
    glBindFramebuffer(GL_FRAMEBUFFER, _frameBuffer);            //将指定 id 的 framebuffer 设置为当前 framebuffer 此时会初始化buffer
    
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, _colorRenderBuffer); //将renderbuffers附加到framebuffer上
    
}

-(void)render {
    glClearColor(1.0, 1.0, 0, 1.0);     //用来设置清屏颜色
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    glViewport(0, 0, self.frame.size.width, self.frame.size.height);

//    [self setupTriangleVertexDataDemo];
//    [self setupTriangleVertexDataCaseNormal];
//    [self setupTriangleVertexData];
//    [self setupCircularVertexData];
//    [self setupTriangleVertexDataCaseVBO];
//    [self setupTextureDemeo];
    [self setup3DTextureDemeo];

    
    [self.glContext presentRenderbuffer:GL_RENDERBUFFER];
    
}

-(void)setupGLProgram {
    
    NSString *vertFile = [[NSBundle mainBundle] pathForResource:@"vert.glsl" ofType:nil];
    NSString *fragFile = [[NSBundle mainBundle] pathForResource:@"frag.glsl" ofType:nil];
    _glProgramBuffer = createGLProgramFromFile(vertFile.UTF8String, fragFile.UTF8String);
    
    glUseProgram(_glProgramBuffer);
}

-(void)setupTriangleVertexDataDemo {
    
    GLfloat vertices[] = {
        0.0f,  0.5f, 0.0f,
        -0.5f, -0.5f, 0.0f,
        0.5f,  -0.5f, 0.0f };
    
    GLint posSlot = glGetAttribLocation(_glProgramBuffer, "position");
    glVertexAttribPointer(posSlot, 3, GL_FLOAT, GL_FALSE, 0, vertices);
    glEnableVertexAttribArray(posSlot);
    
    GLuint vertexBuffer;
    glGenBuffers(1, &vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    
    glVertexAttribPointer(posSlot, 3, GL_FLOAT, GL_FALSE, 0, 0);
    glEnableVertexAttribArray(posSlot);
    
    glDrawArrays(GL_LINE_LOOP, 0, 3);
    
}

-(void)setupTriangleVertexDataCaseNormal {

    // 需要加static关键字，否则数据传输存在问题
    static GLfloat vertices[] = { //顶点坐标
        -1.0f,-1.0f, 0.0f,
        1.0f,1.0f,0.0f,
        -1.0f,1.0f, 0.0f
    };
    
    GLint posSlot = glGetAttribLocation(_glProgramBuffer, "position");
    glVertexAttribPointer(posSlot, 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*3, vertices);
    glEnableVertexAttribArray(posSlot);
    
    static GLfloat colors[] = {
        0.0f, 1.0f, 0.0f,
        0.0f, 1.0f, 0.0f,
        0.0f, 1.0f, 0.0f
    };
    
    GLint colorSlot = glGetAttribLocation(_glProgramBuffer, "color");
    glVertexAttribPointer(colorSlot, 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*3, colors);
    glEnableVertexAttribArray(colorSlot);
    
    glDrawArrays(GL_TRIANGLES, 0, 3); //直接食用顶点数据画三角形

}

/**
 使用数组索引画三角形
 */
-(void)setupTriangleVertexDataCaseArrayIndex {
    
    // 需要加static关键字，否则数据传输存在问题
    static GLfloat vertices[] = { //顶点坐标
        -1.0f,-1.0f, 0.0f,
        1.0f,1.0f,0.0f,
        -1.0f,1.0f, 0.0f,
        
        -1.0f,-1.0f,0.0f,
        1.0f,-1.0f,0.0f,
        1.0f,1.0f,0.0f
    };
    
    static GLbyte indexs[] = { //索引数组
        
        0,1,2,
        
        2,4,5
    };
    
    GLint posSlot = glGetAttribLocation(_glProgramBuffer, "position");
    glVertexAttribPointer(posSlot, 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*3, vertices);
    glEnableVertexAttribArray(posSlot);
    
    static GLfloat colors[] = {
        0.0f, 1.0f, 0.0f,
        0.0f, 1.0f, 0.0f,
        0.0f, 1.0f, 0.0f,
        
        0.0f, 1.0f, 0.0f,
        0.0f, 1.0f, 0.0f,
        0.0f, 1.0f, 0.0f
    };
    GLint colorSlot = glGetAttribLocation(_glProgramBuffer, "color");
    glVertexAttribPointer(colorSlot, 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*3, colors);
    glEnableVertexAttribArray(colorSlot);
    
    glDrawElements(GL_TRIANGLES, sizeof(indexs)/sizeof(indexs[0]), GL_UNSIGNED_BYTE, indexs); //使用索引数组三角形
}

/**
 使用VBO画三角形
 */
-(void)setupTriangleVertexDataCaseVBO {
    
    typedef struct {
        float Position[3];
        float Color[4];
    } Vertex;
    
    const Vertex Vertices[] = {
        {{-1,-1,0}, {0,0,0,1}},// 左下，黑色
        {{1,-1,0}, {1,0,0,1}}, // 右下，红色
        {{-1,1,0}, {0,0,1,1}}, // 左上，蓝色
        {{1,1,0}, {0,1,0,1}},  // 右上，绿色
    };
    
    
    const GLubyte Indices[] = {
        0,1,2, // 三角形0
        1,2,3  // 三角形1
    };
    
    GLuint vertexBuffer;
    glGenBuffers(1, &vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);// 绑定vertexBuffer到GL_ARRAY_BUFFER，
    glBufferData(GL_ARRAY_BUFFER, sizeof(Vertices), Vertices, GL_STATIC_DRAW); // 给VBO传递数据
    
    GLuint indexBuffer;
    glGenBuffers(1, &indexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexBuffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(Indices), Indices, GL_STATIC_DRAW);
    
    GLint posSlot = glGetAttribLocation(_glProgramBuffer, "position");
    GLint colorSlot = glGetAttribLocation(_glProgramBuffer, "color");
    
    glVertexAttribPointer(posSlot, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), 0);
    glEnableVertexAttribArray(posSlot);
    
    glVertexAttribPointer(colorSlot, 4, GL_FLOAT, GL_FALSE, sizeof(Vertex), (GLvoid *)(sizeof(float) * 3));
    glEnableVertexAttribArray(colorSlot);
    
    glDrawElements(GL_TRIANGLE_STRIP, sizeof(Indices)/sizeof(Indices[0]), GL_UNSIGNED_BYTE, 0);
    
}

/**
 画圆形
 */
-(void)setupCircularVertexData {

    int num = 100;
    
    Vertex *vertext = (Vertex *)malloc(sizeof(Vertex) * num);
    memset(vertext, 0x00, sizeof(Vertex) * num);
    
    float horizontal_R = 0.8;
    float vertical_R = horizontal_R*self.frame.size.width/self.frame.size.height;
    
    float delta = 2.0*M_PI/100;
    
    for (int i = 0; i< 100; i++) {
        GLfloat x = horizontal_R * cos(delta * i);
        GLfloat y = vertical_R * sin(delta * i);
        GLfloat z = 0.0;
        vertext[i] = (Vertex){x, y, z, x, y, x+y};
    }
    
    GLint posSlot = glGetAttribLocation(_glProgramBuffer, "position");
    glVertexAttribPointer(posSlot, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), vertext);
    glEnableVertexAttribArray(posSlot);
    
    GLint colorSlot = glGetAttribLocation(_glProgramBuffer, "color");
    glVertexAttribPointer(colorSlot, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), vertext+sizeof(GLfloat)*3);
    glEnableVertexAttribArray(colorSlot);
    
    glDrawArrays(GL_LINES, 0, num);

}

/**
 绘制纹理
 */
-(void)setupTextureDemeo {
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"wood" ofType:@"jpg"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"smile" ofType:@"jpg"];

    GLfloat b = 0.5 * self.frame.size.width / self.frame.size.height;
    
   GLfloat vertices[] = {
       0.5f,  0.5, 0.0f,   1.0f, 0.0f, 0.0f,   1.0f, 1.0f,   // 右上
       0.5f, -0.5, 0.0f,   0.0f, 1.0f, 0.0f,   1.0f, 0.0f,   // 右下
       -0.5f, -0.5, 0.0f,   0.0f, 0.0f, 1.0f,   0.0f, 0.0f,   // 左下
       -0.5f,  0.5, 0.0f,   1.0f, 1.0f, 0.0f,   0.0f, 1.0f    // 左上
    };
    
    GLuint Indices[] = {
        0,1,3, // 三角形0
        1,2,3  // 三角形1
    };
    
    GLuint VAO;
    glGenVertexArrays(1, &VAO);
    glBindVertexArray(VAO);

    GLuint vertexBuffer;
    glGenBuffers(1, &vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);// 绑定vertexBuffer到GL_ARRAY_BUFFER，
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW); // 给VBO传递数据
    
    GLuint indexBuffer;
    glGenBuffers(1, &indexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexBuffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(Indices), Indices, GL_STATIC_DRAW);
    
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*8, NULL);
    glEnableVertexAttribArray(0);
    
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*8, (GLvoid*)(3 * sizeof(GLfloat)));
    glEnableVertexAttribArray(1);

    glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*8, (GLvoid*)(6 * sizeof(GLfloat)));
    glEnableVertexAttribArray(2);
    
    glm::mat4 model;
    float Angle1 = glm::radians(-55.0);

    model = glm::rotate(model, Angle1, glm::vec3(1.0f, 0.0f, 0.0f));
    
    glm::mat4 view;
    view = glm::translate(view, glm::vec3(0.0f, 0.0f, -3.0f));
    
    glm::mat4 projection;
    float scale = self.frame.size.width / self.frame.size.height;
    float Angle = glm::radians(45.0);
    projection = glm::perspective(Angle, scale, 0.1f, 100.0f);
    
    GLuint modelLoc = glGetUniformLocation(_glProgramBuffer, "model");
    GLuint viewLoc = glGetUniformLocation(_glProgramBuffer, "view");
    GLuint projectionLoc = glGetUniformLocation(_glProgramBuffer, "projection");
    
    
    glUniformMatrix4fv(modelLoc, 1, GL_FALSE, glm::value_ptr(model));
    glUniformMatrix4fv(viewLoc, 1, GL_FALSE, glm::value_ptr(view));
    glUniformMatrix4fv(projectionLoc, 1, GL_FALSE, glm::value_ptr(projection));
    
    glActiveTexture(GL_TEXTURE0);
    GLint texture1 = [SamplerImageUtil setupTextureCoreGraphicsToImage:path1];
    glBindTexture(GL_TEXTURE_2D, texture1);
    GLint textureSlot1 = glGetUniformLocation(_glProgramBuffer, "ourTexture1");
    glUniform1i(textureSlot1, 0);


    glActiveTexture(GL_TEXTURE1);
    GLint texture2 = [SamplerImageUtil setupTextureCoreGraphicsToImage:path2];
    glBindTexture(GL_TEXTURE_2D, texture2);
    GLint textureSlot2 = glGetUniformLocation(_glProgramBuffer, "ourTexture2");
    glUniform1i(textureSlot2, 1);
    
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);
    
}

/**
 绘制3D纹理
 */
-(void)setup3DTextureDemeo {

    glEnable(GL_DEPTH_TEST);
    
    float vertices[] = {
        -0.5f, -0.5f, -0.5f,  0.0f, 0.0f,
        0.5f, -0.5f, -0.5f,  1.0f, 0.0f,
        0.5f,  0.5f, -0.5f,  1.0f, 1.0f,
        0.5f,  0.5f, -0.5f,  1.0f, 1.0f,
        -0.5f,  0.5f, -0.5f,  0.0f, 1.0f,
        -0.5f, -0.5f, -0.5f,  0.0f, 0.0f,
        
        -0.5f, -0.5f,  0.5f,  0.0f, 0.0f,
        0.5f, -0.5f,  0.5f,  1.0f, 0.0f,
        0.5f,  0.5f,  0.5f,  1.0f, 1.0f,
        0.5f,  0.5f,  0.5f,  1.0f, 1.0f,
        -0.5f,  0.5f,  0.5f,  0.0f, 1.0f,
        -0.5f, -0.5f,  0.5f,  0.0f, 0.0f,
        
        -0.5f,  0.5f,  0.5f,  1.0f, 0.0f,
        -0.5f,  0.5f, -0.5f,  1.0f, 1.0f,
        -0.5f, -0.5f, -0.5f,  0.0f, 1.0f,
        -0.5f, -0.5f, -0.5f,  0.0f, 1.0f,
        -0.5f, -0.5f,  0.5f,  0.0f, 0.0f,
        -0.5f,  0.5f,  0.5f,  1.0f, 0.0f,
        
        0.5f,  0.5f,  0.5f,  1.0f, 0.0f,
        0.5f,  0.5f, -0.5f,  1.0f, 1.0f,
        0.5f, -0.5f, -0.5f,  0.0f, 1.0f,
        0.5f, -0.5f, -0.5f,  0.0f, 1.0f,
        0.5f, -0.5f,  0.5f,  0.0f, 0.0f,
        0.5f,  0.5f,  0.5f,  1.0f, 0.0f,
        
        -0.5f, -0.5f, -0.5f,  0.0f, 1.0f,
        0.5f, -0.5f, -0.5f,  1.0f, 1.0f,
        0.5f, -0.5f,  0.5f,  1.0f, 0.0f,
        0.5f, -0.5f,  0.5f,  1.0f, 0.0f,
        -0.5f, -0.5f,  0.5f,  0.0f, 0.0f,
        -0.5f, -0.5f, -0.5f,  0.0f, 1.0f,
        
        -0.5f,  0.5f, -0.5f,  0.0f, 1.0f,
        0.5f,  0.5f, -0.5f,  1.0f, 1.0f,
        0.5f,  0.5f,  0.5f,  1.0f, 0.0f,
        0.5f,  0.5f,  0.5f,  1.0f, 0.0f,
        -0.5f,  0.5f,  0.5f,  0.0f, 0.0f,
        -0.5f,  0.5f, -0.5f,  0.0f, 1.0f
    };
    
    glm::vec3 cubePositions[] = {
        glm::vec3( 0.0f,  0.0f,  0.0f),
        glm::vec3( 2.0f,  5.0f, -15.0f),
        glm::vec3(-1.5f, -2.2f, -2.5f),
        glm::vec3(-3.8f, -2.0f, -12.3f),
        glm::vec3( 2.4f, -0.4f, -3.5f),
        glm::vec3(-1.7f,  3.0f, -7.5f),
        glm::vec3( 1.3f, -2.0f, -2.5f),
        glm::vec3( 1.5f,  2.0f, -2.5f),
        glm::vec3( 1.5f,  0.2f, -1.5f),
        glm::vec3(-1.3f,  1.0f, -1.5f)
    };
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"wood" ofType:@"jpg"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"smile" ofType:@"jpg"];
    
    GLuint vertexBuffer;
    glGenBuffers(1, &vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);// 绑定vertexBuffer到GL_ARRAY_BUFFER，
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW); // 给VBO传递数据
    
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*5, NULL);
    glEnableVertexAttribArray(0);
    
    glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*5, (GLvoid*)(3 * sizeof(GLfloat)));
    glEnableVertexAttribArray(2);
    
    glm::mat4 model;
    float Angle1 = glm::radians(0.0f);
    
    model = glm::rotate(model, Angle1, glm::vec3(0.5f, 1.0f, 0.0f));
    
    glm::mat4 view;
    view = glm::translate(view, glm::vec3(0.0f, 0.0f, -3.0f));
    
    glm::mat4 projection;
    float scale = self.frame.size.width / self.frame.size.height;
    float Angle = glm::radians(45.0);
    
    projection = glm::perspective(Angle, scale, 0.1f, 100.0f);
    
    GLuint modelLoc = glGetUniformLocation(_glProgramBuffer, "model");
    glUniformMatrix4fv(modelLoc, 1, GL_FALSE, glm::value_ptr(model));
    
    GLuint viewLoc = glGetUniformLocation(_glProgramBuffer, "view");
    glUniformMatrix4fv(viewLoc, 1, GL_FALSE, glm::value_ptr(view));
    
    GLuint projectionLoc = glGetUniformLocation(_glProgramBuffer, "projection");
    glUniformMatrix4fv(projectionLoc, 1, GL_FALSE, glm::value_ptr(projection));

    glActiveTexture(GL_TEXTURE0);
    GLint texture1 = [SamplerImageUtil setupTextureCoreGraphicsToImage:path1];
    glBindTexture(GL_TEXTURE_2D, texture1);
    GLint textureSlot1 = glGetUniformLocation(_glProgramBuffer, "ourTexture1");
    glUniform1i(textureSlot1, 0);
    
    
    glActiveTexture(GL_TEXTURE1);
    GLint texture2 = [SamplerImageUtil setupTextureCoreGraphicsToImage:path2];
    glBindTexture(GL_TEXTURE_2D, texture2);
    GLint textureSlot2 = glGetUniformLocation(_glProgramBuffer, "ourTexture2");
    glUniform1i(textureSlot2, 1);
    
    for (GLuint i = 0; i < 10; i++)
    {
        // Calculate the model matrix for each object and pass it to shader before drawing
        glm::mat4 model;
        model = glm::translate(model, cubePositions[i]);
        GLfloat angle = 20.0f * i;
        model = glm::rotate(model, angle, glm::vec3(1.0f, 0.3f, 0.5f));
        glUniformMatrix4fv(modelLoc, 1, GL_FALSE, glm::value_ptr(model));
        
        glDrawArrays(GL_TRIANGLES, 0, 36);
    }

}

/**
 释放
 */
- (void)destoryRenderAndFrameBuffer
{
    glDeleteFramebuffers(1, &_frameBuffer);
    _frameBuffer = 0;
    glDeleteRenderbuffers(1, &_colorRenderBuffer);
    _colorRenderBuffer = 0;
}

@end
