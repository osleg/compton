#version 110
uniform vec2 pixeluv;
uniform vec2 extent;
uniform float factor_center;
uniform sampler2D tex_scr;

vec4 sample(vec2 uv) {
return texture2D(tex_scr, clamp(uv, vec2(0.0), extent));
}

void main() {
vec2 uv = gl_TexCoord[0].xy;
vec4 sum = texture2D(tex_scr, uv) * 4.0;
sum += sample(uv + pixeluv);
sum += sample(uv + -pixeluv);
sum += sample(uv + vec2(pixeluv.x, pixeluv.y));
sum += sample(uv + vec2(pixeluv.x, pixeluv.y));
gl_FragColor = sum / 8.0;
}

