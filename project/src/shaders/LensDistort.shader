// Derived from https://www.shadertoy.com/view/4s2GRR#
// Adds a fisheye-effect to the images

shader_type canvas_item; // Shader is a 2d shader
const float PI = 3.1415926535;
uniform vec2 resolution = vec2(640,480);
uniform float factor = 0;

void fragment()
{
	vec2 p = SCREEN_UV; // 2d vector for ranges 0.0 to 1.0 to determine position on screen in pixels
	float prop = resolution.x / resolution.y; // Proportions of screen
	vec2 m = vec2(0.5, 0.5); // Current fragment based on center of coordinates
	vec2 d = p - m; // Vector that goes from the center of screen to the fragment
	float r = sqrt(dot(d, d)); // Pixel-to-center distance
	
	float power = ( 2.0 * PI / (2.0 * sqrt(dot(m, m))) ) * (factor - 0.5); // Amount of fisheye-effect
	float bind = m.y; // Radius of 1:1 fisheye-effect
	
	if (power > 0.0) bind = sqrt(dot(m, m)); // Connect fragment to corners
	else if (prop < 1.0) bind = m.x; // Connect fragment to borders

	vec2 uv = SCREEN_UV; // Vector for position
	if (power > 0.0) // Set postition if there should be a fisheye-effect
		uv = m + normalize(d) * tan(r * power) * bind / tan( bind * power);
	else if (power < 0.0) // Set position if there should not be a fisheye-effect
		uv = m + normalize(d) * atan(r * -power * 10.0) * bind / atan(-power * bind * 10.0);
	
	vec3 col = texture(SCREEN_TEXTURE, vec2(uv.x, uv.y)).xyz; // Give fake blur effect to fake image depth
	COLOR = vec4(col, 1.0);
}
