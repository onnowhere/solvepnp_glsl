#version 330

in vec4 Position;

void main()
{
    gl_Position = vec4(Position.xyz, 0.5);
}