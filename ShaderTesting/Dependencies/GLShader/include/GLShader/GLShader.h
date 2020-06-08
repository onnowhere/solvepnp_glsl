#ifndef GLSHADER_H
#define GLSHADER_H

#include <GLAD/glad.h>
#define GLFW_INCLUDE_NONE
#include <GLFW/glfw3.h>

GLuint LoadShader(const char *vertex_path, const char *fragment_path);
GLuint program = LoadShader("shader.vert", "shader.frag");
glUseProgram(program);

#endif