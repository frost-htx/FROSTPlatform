
#version 300 es

precision mediump float;

in vec3 outColor;
in vec2 TexCoord;

out vec4 color;

uniform sampler2D ourTexture1;
uniform sampler2D ourTexture2;

uniform vec3 objectColor;
uniform vec3 lightColor;

void main()
{
//    color = mix(texture(ourTexture1, TexCoord), texture(ourTexture2, TexCoord), 0.2);
    color = vec4(lightColor * objectColor, 1.0f);

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
