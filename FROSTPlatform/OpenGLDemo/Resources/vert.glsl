
#version 300 es

//layout(location = 0) in vec3 position;
//layout(location = 1) in vec3 color;
//layout(location = 2) in vec2 texCoord;
//
//out vec3 outColor;
//out vec2 TexCoord;
//
//uniform mat4 model;
//uniform mat4 view;
//uniform mat4 projection;
//
//void main()
//{
//    gl_Position = projection * view * model * vec4(position, 1.0f);
//    outColor = color;
//    TexCoord = texCoord;
//}

//attribute vec3 position;
//attribute vec3 color;
//attribute vec2 texcoord;
//
//varying vec2 vTexcoord;
//varying vec3 outColor;
//
//void main()
//{
//    gl_Position = vec4(position, 1.0);
//    outColor = color;
//    vTexcoord = texcoord;
//
//}

layout (location = 0) in vec3 position;


void main()
{
    gl_Position = vec4(position.x, position.y, position.z, 1.0);

}

