
#version 300 es

precision mediump float;

in vec3 outColor;
in vec2 TexCoord;

out vec4 color;

uniform sampler2D ourTexture1;
uniform sampler2D ourTexture2;


void main()
{
    color = mix(texture(ourTexture1, TexCoord), texture(ourTexture2, TexCoord), 0.2);
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
