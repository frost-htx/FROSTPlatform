
#version 300 es

precision mediump float;

out vec4 FragColor;

uniform vec4 ourColor;

void main()
{
    FragColor = ourColor;
}

//precision mediump float;
//
//uniform sampler2D image;
//
//varying vec3 outColor;
//
//varying vec2 vTexcoord;
//
//
//void main()
//{
//    gl_FragColor = vec4(outColor, 1.0);
////    gl_FragColor = texture2D(image, vTexcoord);
////    gl_FragColor = texture2D(image, vTexcoord) * vec4(outColor, 1.0f);
//
//
//}
