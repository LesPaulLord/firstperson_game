shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;
uniform float grain_amount = 0.1;
uniform float grain_size : hint_range(0.1, 10.0) = 1.0;

float get_noise(vec2 uv) {
	return fract(sin(dot(uv ,vec2(12.9898,78.233))) * 43758.5453);
}

void fragment() {
	// Sample the original screen texture
    vec4 original_color = texture(screen_texture, SCREEN_UV);
	
	float noise = 2.0 * get_noise(UV + vec2(TIME, 0.0)) - 1.0;
	COLOR = texture(TEXTURE, UV) + noise * grain_amount;
	
	// Add noise to the original color
    original_color.rgb += noise * grain_amount * grain_size;
	
	// Clamp the final color to make sure it stays in the valid range
	COLOR = clamp(original_color, 0.0, 1.0);
}