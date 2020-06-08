#version 330

out vec4 fragColor;
uniform float x2 = 0.0;
void main()
{
	float x = x2;
	x += 1.0;
    fragColor = vec4(x, 0.0, 0.0, 1.0);
	if (x < 0.1) {
		fragColor = vec4(0.0, 1.0, 0.0, 1.0);
	}
}