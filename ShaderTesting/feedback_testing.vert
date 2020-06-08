#version 330

in float inValue;
out float[12] outValue;

#define matmul(a, b) transpose(transpose(a) * transpose(b))

struct Mat3x3 { int rows; int cols; int cns; float[9] data; };
#define newMat3x3(data) Mat3x3(3,3,1,data)
#define emptyMat3x3() newMat3x3(float[](0,0,0,0,0,0,0,0,0))
struct Mat4x1x2 { int rows; int cols; int cns; float[8] data; };
#define newMat4x1x2(data) Mat4x1x2(4,1,2,data)
#define emptyMat4x1x2() newMat4x1x2(float[](0,0,0,0,0,0,0,0))
struct Mat4x1x3 { int rows; int cols; int cns; float[12] data; };
#define newMat4x1x3(data) Mat4x1x3(4,1,3,data)
#define emptyMat4x1x3() newMat4x1x3(float[](0,0,0,0,0,0,0,0,0,0,0,0))

Mat4x1x3 outputPoints = newMat4x1x3(float[](
	0.0, 0.0, 0.0,
	1.0, 0.0, 0.0,
	1.0, 1.0, 0.0,
	0.0, 1.0, 0.0
));

Mat4x1x2 imagePoints = newMat4x1x2(float[](
	0.25, 0.5,
	0.5, 1.0,
	0.75, 0.5,
	0.5, 0.0
));

void main()
{
	const vec4 test1 = vec4(sqrt(2.0), 1.0, 0.5, 0.25);
	const mat4 test2 = mat4(
		0.0, 1.0, 2.0, 3.0,
		4.0, 5.0, 6.0, 7.0,
		8.0, 9.0, 10.0, 11.0,
		12.0, 13.0, 14.0, 15.0
	);
	const float[] test3 = float[20](
		0.0, 1.0, 2.0, 3.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
		0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
	);
	mat3 ones = mat3(1.0); // Diagonal eye matrix
	vec3[5] test4; // Array of 5 vec3 vectors
	// vec3[5][2] not possible, need glsl 4.3+

	float[] test5 = emptyMat4x1x3().data;
	test5[0] = 10.0;

	mat3 test6 = mat3(
		1.0, 2.0, 3.0,
		4.0, 5.0, 6.0,
		7.0, 8.0, 9.0
	);

	mat3 test7 = mat3(
		1.0, -1.0, 1.0,
		-1.0, 0.0, 0.0,
		0.0, 0.0, 1.0
	);

	vec3 test8 = vec3(1.0, 2.0, 3.0);
	mat3 normal_multiply = matrixCompMult(test6,test7);
	mat3 matmul_col = test6*test7;
	mat3 matmul_row = transpose(transpose(test6)*transpose(test7));
	mat3 matmul_defined = matmul(test6, test7);

	outValue = outputPoints.data;
}