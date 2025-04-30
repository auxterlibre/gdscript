shader_type canvas_item;
render_mode blend_mix,unshaded;

uniform float intensity;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

vec4 multiply(vec4 base, vec4 blend){
	return base * blend;
}

vec4 overlay(vec4 base, vec4 blend){
	vec4 limit = step(0.5, base);
	return mix(2.0 * base * blend, 1.0 - 2.0 * (1.0 - base) * (1.0 - blend), limit);
}

vec4 darken(vec4 base, vec4 blend){
	return min(base, blend);
}

void fragment() {
  vec4 bg_color = texture( SCREEN_TEXTURE, SCREEN_UV );

  // mix() if you want to be able to set 'intensity' to different values.
  COLOR.rgb = mix( COLOR, multiply(bg_color,COLOR), intensity ).rgb;

  // No need to mix() if you always want 'intensity' to be 1.0 (uncomment):
  // COLOR.rgb = screen( bg_color, COLOR ).rgb;
}