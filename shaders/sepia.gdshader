shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
	COLOR = texture(SCREEN_TEXTURE, SCREEN_UV);
	COLOR.r = (COLOR.r * 0.393) + (COLOR.g * 0.769) + (COLOR.b * 0.189);
	COLOR.g = (COLOR.r * 0.349) + (COLOR.g * 0.686) + (COLOR.b * 0.168);
	COLOR.b = (COLOR.r * 0.272) + (COLOR.g * 0.534) + (COLOR.b * 0.131);
}