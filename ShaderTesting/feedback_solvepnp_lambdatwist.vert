#version 330

in float inValue;
out float[100] outValue;

#define FLT_DECIMAL_DIG  	9                       // # of decimal digits of rounding precision
#define FLT_DIG          	6                       // # of decimal digits of precision
#define FLT_EPSILON      	1.192092896e-07F        // smallest such that 1.0+FLT_EPSILON != 1.0
#define FLT_HAS_SUBNORM  	1                       // type does support subnormal numbers
#define FLT_GUARD       	0
#define FLT_MANT_DIG     	24                      // # of bits in mantissa
#define FLT_MAX          	3.402823466e+38F        // max value
#define FLT_MAX_10_EXP   	38                      // max decimal exponent
#define FLT_MAX_EXP      	128                     // max binary exponent
#define FLT_MIN          	1.175494351e-38F        // min normalized positive value
#define FLT_MIN_10_EXP   	(-37)                   // min decimal exponent
#define FLT_MIN_EXP      	(-125)                  // min binary exponent
#define FLT_NORMALIZE    	0
#define FLT_RADIX        	2                       // exponent radix
#define FLT_TRUE_MIN     	1.401298464e-45F        // min positive value

#define CV_GEMM_A_T			1
#define CV_TERMCRIT_EPS  	2
#define CV_TERMCRIT_ITER 	1

#define DECOMP_SVD       	1
#define DONE				0
#define STARTED				1
#define CALC_J				2
#define CHECK_ERR			3

#define EmptyArr6 			float[](0,0,0,0,0,0)
struct Mat8 { int rows; int cols; int cns; float[8] data; };
#define EmptyArr8 			float[](0,0,0,0,0,0,0,0)
#define newMat4x1x2(data) 	Mat8(4,1,2,data)
#define emptyMat4x1x2() 	newMat4x1x2(EmptyArr8)
#define newMat1x4x2(data) 	Mat8(1,4,2,data)
#define emptyMat1x4x2() 	newMat1x4x2(EmptyArr8)
struct Mat9 { int rows; int cols; int cns; float[9] data; };
#define EmptyArr9 			float[](0,0,0,0,0,0,0,0,0)
#define newMat3x3(data) 	Mat9(3,3,1,data)
#define emptyMat3x3() 		newMat3x3(EmptyArr9)
#define newMat9x1(data) 	Mat9(9,1,1,data)
#define emptyMat9x1() 		newMat9x1(EmptyArr9)
struct Mat12 { int rows; int cols; int cns; float[12] data; };
#define EmptyArr12 			float[](0,0,0,0,0,0,0,0,0,0,0,0)
#define newMat4x1x3(data) 	Mat12(4,1,3,data)
#define emptyMat4x1x3() 	newMat4x1x3(EmptyArr12)
#define newMat3x4(data) 	Mat12(4,3,1,data)
#define emptyMat3x4() 		newMat3x4(EmptyArr12)
struct Mat15 { int rows; int cols; int cns; float[15] data; };
#define EmptyArr15 			float[](0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
#define newMat3x5(data) 	Mat15(3,5,1,data)
#define emptyMat3x5() 		newMat3x5(EmptyArr15)
struct Mat20 { int rows; int cols; int cns; float[20] data; };
#define EmptyArr20 			float[](0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
#define newMat4x5(data) 	Mat20(4,5,1,data)
#define emptyMat4x5() 		newMat4x5(EmptyArr20)
struct Mat24 { int rows; int cols; int cns; float[24] data; };
#define EmptyArr24			float[](0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
#define newMat8x3(data) 	Mat24(8,3,1,data)
#define emptyMat8x3() 		newMat8x3(EmptyArr24)
struct Mat27 { int rows; int cols; int cns; float[27] data; };
#define EmptyArr27			float[](0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
#define newMat3x9(data) 	Mat27(3,9,1,data)
#define emptyMat3x9() 		newMat3x9(EmptyArr27)
struct Mat36 { int rows; int cols; int cns; float[36] data; };
#define EmptyArr36 			float[](0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
#define newMat6x6(data) 	Mat36(6,6,1,data)
#define emptyMat6x6() 		newMat6x6(EmptyArr36)
struct Mat45 { int rows; int cols; int cns; float[45] data; };
#define EmptyArr45 			float[](0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
#define newMat5x9(data) 	Mat45(9,5,1,data)
#define emptyMat5x9() 		newMat5x9(EmptyArr45)
struct Mat48 { int rows; int cols; int cns; float[48] data; };
#define EmptyArr48 			float[](0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
#define newMat8x6(data) 	Mat48(8,6,1,data)
#define emptyMat8x6() 		newMat8x6(EmptyArr48)
struct Mat81 { int rows; int cols; int cns; float[81] data; };
#define EmptyArr81 			float[](0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
#define newMat9x9(data) 	Mat81(9,9,1,data)
#define emptyMat9x9() 		newMat9x9(EmptyArr81)

/*
Mat12 testObjectPoints = newMat4x1x3(float[](
	0.0, 0.0, 0.0,
	1.0, 0.0, 0.0,
	1.0, 1.0, 0.0,
	0.0, 1.0, 0.0
));
*/

mat3 testObjectPoints = mat3(
	0.0, 0.0, 0.0,
	1.0, 0.0, 0.0,
	1.0, 1.0, 0.0
);

vec3 testObjectPoint4 = vec3(
	0.0, 1.0, 0.0
);

/*
Mat8 testImagePoints = newMat4x1x2(float[](
	0.25, 0.5,
	0.5, 1.0,
	0.75, 0.5,
	0.5, 0.0
));
*/

/*
Mat8 testImagePoints = newMat4x1x2(float[](
	1.0, 0.0,
	1.0, 1.0,
	0.0, 1.0,
	0.0, 0.0
));
*/

//520/1120, 269/628 -> 0.4643, 0.4283
//672/1120, 298/628 -> 0.6001, 0.4745
//640/1120, 425/628 -> 0.5714, 0.6768
//442/1120, 372/628 -> 0.3946, 0.5924
///tp @s 25.071 127.0 10.288 160.8 38.4

/*
Mat8 testImagePoints = newMat4x1x2(float[](
    0.4444, 0.4905,
    0.6841, 0.5381,
	0.6365, 0.7444,
    0.3159, 0.6540
));
*/

/*
Mat8 testImagePoints = newMat4x1x2(float[](
    0.4643, 0.4283,
    0.6001, 0.4745,
    0.5714, 0.6768,
    0.3946, 0.5924
));
*/

/*
Mat8 testImagePoints = newMat4x1x2(float[](
	659.0, 455.0,
    463.0, 445.0,
    500.0, 348.0,
    641.0, 353.0
));
*/

mat3 testImagePoints = mat3(
	659.0, 455.0, 1.0,
    463.0, 445.0, 1.0,
    500.0, 348.0, 1.0
);

vec2 testImagePoint4 = vec2(
    641.0, 353.0
);


/*
Mat8 testImagePoints = newMat4x1x2(float[](
	586, 546,
	600, 584,
	483, 588,
	493, 548
));
*/

/*
Mat8 testImagePoints = newMat4x1x2(float[](
	389, 386,
	410, 163,
	634, 155,
	662, 374
));
*/

mat3 cameraMatrix = mat3(1.0); // identity

void initOutValue() {
	outValue = float[100](
		0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,
		0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,
		0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,
		0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,
		0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,
		0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,
		0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,
		0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,
		0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,
		0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0
	);
}

void testOutValue(float src)
{
	initOutValue();
	outValue[0] = src;
}

void testOutValue(float[3] src)
{
	initOutValue();
	for (int i = 0; i < src.length(); i++) {
		outValue[i] = src[i];
	}
}

void testOutValue(float[6] src)
{
	initOutValue();
	for (int i = 0; i < src.length(); i++) {
		outValue[i] = src[i];
	}
}

void testOutValue(vec2 src)
{
	initOutValue();
	outValue[0] = src[0];
	outValue[1] = src[1];
}

void testOutValue(vec3 src)
{
	initOutValue();
	outValue[0] = src[0];
	outValue[1] = src[1];
	outValue[2] = src[2];
}

void testOutValue(vec4 src)
{
	initOutValue();
	outValue[0] = src[0];
	outValue[1] = src[1];
	outValue[2] = src[2];
	outValue[3] = src[3];
}

void testOutValue(mat2 src)
{
	initOutValue();
	outValue[0] = src[0][0];
	outValue[1] = src[0][1];
	outValue[2] = src[1][0];
	outValue[3] = src[1][1];
}

void testOutValue(mat3 src)
{
	initOutValue();
	outValue[0] = src[0][0];
	outValue[1] = src[0][1];
	outValue[2] = src[0][2];
	outValue[3] = src[1][0];
	outValue[4] = src[1][1];
	outValue[5] = src[1][2];
	outValue[6] = src[2][0];
	outValue[7] = src[2][1];
	outValue[8] = src[2][2];
}

void testOutValue(Mat8 src) {
	initOutValue();
	for (int i = 0; i < src.data.length(); i++) { outValue[i] = src.data[i]; }}
void testOutValue(Mat9 src) {
	initOutValue();
	for (int i = 0; i < src.data.length(); i++) { outValue[i] = src.data[i]; }}
void testOutValue(Mat12 src) {
	initOutValue();
	for (int i = 0; i < src.data.length(); i++) { outValue[i] = src.data[i]; }}
void testOutValue(Mat24 src) {
	initOutValue();
	for (int i = 0; i < src.data.length(); i++) { outValue[i] = src.data[i]; }}
void testOutValue(Mat27 src) {
	initOutValue();
	for (int i = 0; i < src.data.length(); i++) { outValue[i] = src.data[i]; }}
void testOutValue(Mat36 src) {
	initOutValue();
	for (int i = 0; i < src.data.length(); i++) { outValue[i] = src.data[i]; }}
void testOutValue(Mat48 src) {
	initOutValue();
	for (int i = 0; i < src.data.length(); i++) { outValue[i] = src.data[i]; }}
void testOutValue(Mat81 src) {
	initOutValue();
	for (int i = 0; i < src.data.length(); i++) { outValue[i] = src.data[i]; }}

// Get matrix index
int idx(Mat8 mat, int row, int col, int cn) {
	return row * mat.cols * mat.cns + col * mat.cns + cn; }
int idx(Mat8 mat, int row, int col) {
	return idx(mat, row, col, 0); }

int idx(Mat9 mat, int row, int col, int cn) {
	return row * mat.cols * mat.cns + col * mat.cns + cn; }
int idx(Mat9 mat, int row, int col) {
	return idx(mat, row, col, 0); }

int idx(Mat12 mat, int row, int col, int cn) {
	return row * mat.cols * mat.cns + col * mat.cns + cn; }
int idx(Mat12 mat, int row, int col) {
	return idx(mat, row, col, 0); }

int idx(Mat15 mat, int row, int col, int cn) {
	return row * mat.cols * mat.cns + col * mat.cns + cn; }
int idx(Mat15 mat, int row, int col) {
	return idx(mat, row, col, 0); }

int idx(Mat20 mat, int row, int col, int cn) {
	return row * mat.cols * mat.cns + col * mat.cns + cn; }
int idx(Mat20 mat, int row, int col) {
	return idx(mat, row, col, 0); }

int idx(Mat24 mat, int row, int col, int cn) {
	return row * mat.cols * mat.cns + col * mat.cns + cn; }
int idx(Mat24 mat, int row, int col) {
	return idx(mat, row, col, 0); }

int idx(Mat27 mat, int row, int col, int cn) {
	return row * mat.cols * mat.cns + col * mat.cns + cn; }
int idx(Mat27 mat, int row, int col) {
	return idx(mat, row, col, 0); }

int idx(Mat36 mat, int row, int col, int cn) {
	return row * mat.cols * mat.cns + col * mat.cns + cn; }
int idx(Mat36 mat, int row, int col) {
	return idx(mat, row, col, 0); }

int idx(Mat45 mat, int row, int col, int cn) {
	return row * mat.cols * mat.cns + col * mat.cns + cn; }
int idx(Mat45 mat, int row, int col) {
	return idx(mat, row, col, 0); }

int idx(Mat48 mat, int row, int col, int cn) {
	return row * mat.cols * mat.cns + col * mat.cns + cn; }
int idx(Mat48 mat, int row, int col) {
	return idx(mat, row, col, 0); }

int idx(Mat81 mat, int row, int col, int cn) {
	return row * mat.cols * mat.cns + col * mat.cns + cn; }
int idx(Mat81 mat, int row, int col) {
	return row * mat.cols * mat.cns + col * mat.cns; }

void swap(inout int a, inout int b)
{
	int a_temp = a;
	a = b;
	b = a_temp;
}

void swap(inout float[3] a, in int i, inout float[3] b, in int j)
{
	float a_temp = a[i];
	a[i] = b[j];
	b[j] = a_temp;
}

void swap(inout Mat9 a, in int i, inout Mat9 b, in int j)
{
	float a_temp = a.data[i];
	a.data[i] = b.data[j];
	b.data[j] = a_temp;
}

void swap(inout Mat27 a, in int i, inout Mat27 b, in int j)
{
	float a_temp = a.data[i];
	a.data[i] = b.data[j];
	b.data[j] = a_temp;
}

void swap(inout Mat36 a, in int i, inout Mat36 b, in int j)
{
	float a_temp = a.data[i];
	a.data[i] = b.data[j];
	b.data[j] = a_temp;
}

void swap(inout float[6] a, in int i, inout float[6] b, in int j)
{
	float a_temp = a[i];
	a[i] = b[j];
	b[j] = a_temp;
}

int checkVector(Mat8 mat, int elemChannels)
{
    return int(mat.rows * mat.cols * mat.cns / elemChannels);
}

Mat9 convertToMat9(mat3 mat)
{
	return newMat3x3(float[](
		mat[0][0], mat[0][1], mat[0][2], 
		mat[1][0], mat[1][1], mat[1][2], 
		mat[2][0], mat[2][1], mat[2][2]
	));
}

mat3 convertToMat3(Mat9 mat)
{
	return mat3(
		mat.data[0], mat.data[1], mat.data[2],
		mat.data[3], mat.data[4], mat.data[5],
		mat.data[6], mat.data[7], mat.data[8]
	);
}

Mat24 cvGetCols(Mat48 arr, int colstart, int colend)
{
    Mat24 res = emptyMat8x3();
	for (int i = 0; i < res.rows; i++) {
		for (int j = 0; j < res.cols; j++) {
            res.data[idx(res,i,j)] = arr.data[idx(arr,i,j+colstart)];
		}
	}
    return res;
}
    
vec3 cvGetCol(mat3 arr, int col)
{
    vec3 res = vec3(0.0);
	res[0] = arr[0][col];
	res[1] = arr[1][col];
	res[2] = arr[2][col];
    return res;
}

void cvStoreCols(inout Mat48 arr, in Mat24 submat, in int colstart, in int colend)
{
	for (int i = 0; i < submat.rows; i++) {
		for (int j = 0; j < submat.cols; j++) {
            arr.data[idx(arr,i,j+colstart)] = submat.data[idx(submat,i,j)];
		}
	}
}

void cvStoreCol(inout mat3 arr, in vec3 submat, in int col)
{
    arr[0][col] = submat[0];
    arr[1][col] = submat[1];
    arr[2][col] = submat[2];
}

Mat9 mattranspose(Mat9 src)
{
	Mat9 mat = src;
	int temp_rows = mat.rows;
	mat.rows = mat.cols;
	mat.cols = temp_rows;
	for (int i = 0; i < src.rows; i++) {
		for (int j = 0; j < src.cols; j++) {
			mat.data[idx(mat,j,i)] = src.data[idx(src,i,j)];
		}
	}
	return mat;
}

Mat12 mattranspose(Mat12 src)
{
	Mat12 mat = src;
	int temp_rows = mat.rows;
	mat.rows = mat.cols;
	mat.cols = temp_rows;
	for (int i = 0; i < src.rows; i++) {
		for (int j = 0; j < src.cols; j++) {
			mat.data[idx(mat,j,i)] = src.data[idx(src,i,j)];
		}
	}
	return mat;
}

Mat36 mattranspose(Mat36 src)
{
	Mat36 mat = src;
	int temp_rows = mat.rows;
	mat.rows = mat.cols;
	mat.cols = temp_rows;
	for (int i = 0; i < src.rows; i++) {
		for (int j = 0; j < src.cols; j++) {
			mat.data[idx(mat,j,i)] = src.data[idx(src,i,j)];
		}
	}
	return mat;
}

Mat48 mattranspose(Mat48 src)
{
	Mat48 mat = src;
	int temp_rows = mat.rows;
	mat.rows = mat.cols;
	mat.cols = temp_rows;
	for (int i = 0; i < src.rows; i++) {
		for (int j = 0; j < src.cols; j++) {
			mat.data[idx(mat,j,i)] = src.data[idx(src,i,j)];
		}
	}
	return mat;
}

mat3 matmul(mat3 a, mat3 b)
{
	return transpose(transpose(a) * transpose(b));
}

Mat9 matmul(Mat12 a, Mat12 b)
{
	Mat9 mat = emptyMat3x3();
	for (int i = 0; i < mat.rows; i++) {
		for (int j = 0; j < mat.cols; j++) {
			float value = 0;
			for (int k = 0; k < a.cols; k++) {
				value += a.data[idx(a,i,k)] * b.data[idx(b,k,j)];
			}
			mat.data[idx(mat,i,j)] = value;
		}
	}
	return mat;
}

Mat15 matmul(Mat12 a, Mat20 b)
{
	Mat15 mat = emptyMat3x5();
	for (int i = 0; i < mat.rows; i++) {
		for (int j = 0; j < mat.cols; j++) {
			float value = 0;
			for (int k = 0; k < a.cols; k++) {
				value += a.data[idx(a,i,k)] * b.data[idx(b,k,j)];
			}
			mat.data[idx(mat,i,j)] = value;
		}
	}
	return mat;
}

Mat27 matmul(Mat15 a, Mat45 b)
{
	Mat27 mat = emptyMat3x9();
	for (int i = 0; i < mat.rows; i++) {
		for (int j = 0; j < mat.cols; j++) {
			float value = 0;
			for (int k = 0; k < a.cols; k++) {
				value += a.data[idx(a,i,k)] * b.data[idx(b,k,j)];
			}
			mat.data[idx(mat,i,j)] = value;
		}
	}
	return mat;
}

Mat36 matmul(Mat48 a, Mat48 b)
{
	Mat36 mat = emptyMat6x6();
	for (int i = 0; i < mat.rows; i++) {
		for (int j = 0; j < mat.cols; j++) {
			float value = 0;
			for (int k = 0; k < a.cols; k++) {
				value += a.data[idx(a,i,k)] * b.data[idx(b,k,j)];
			}
			mat.data[idx(mat,i,j)] = value;
		}
	}
	return mat;
}

Mat8 matmul(Mat8 a, float b)
{
	Mat8 mat = a;
	for (int i = 0; i < mat.data.length(); i++) {
		mat.data[i] *= b;
	}
	return mat;
}

Mat12 matmul(Mat12 a, float b)
{
	Mat12 mat = a;
	for (int i = 0; i < mat.data.length(); i++) {
		mat.data[i] *= b;
	}
	return mat;
}

float[6] matmul(Mat48 a, Mat8 b)
{
	// Assume: b -> Mat8x1
	float[6] mat = EmptyArr6;
	for (int i = 0; i < mat.length(); i++) {
		float value = 0;
		for (int j = 0; j < a.cols; j++) {
			value += a.data[idx(a,i,j)] * b.data[idx(b,j,0)];
		}
		mat[i] = value;
	}
	return mat;
}

float[6] matmul(float[6] a, float b)
{
	float[6] mat = a;
	for (int i = 0; i < mat.length(); i++) {
		mat[i] *= b;
	}
	return mat;
}

float[6] matsub(float[6] a, float[6] b)
{
	float[6] mat = a;
	for (int i = 0; i < mat.length(); i++) {
		mat[i] -= b[i];
	}
	return mat;
}

Mat8 matsub(Mat8 a, Mat8 b)
{
	Mat8 mat = a;
	for (int i = 0; i < mat.data.length(); i++) {
		mat.data[i] -= b.data[i];
	}
	return mat;
}

void reshape(out Mat8 src, int new_cns, int new_rows)
{
	int total_width = src.cols * src.cns;
    if ((new_cns > total_width || total_width % new_cns != 0) && new_rows == 0) {
        new_rows = src.rows * total_width / new_cns;
	}

    if (new_rows != 0 && new_rows != src.rows) {
        int total_size = total_width * src.rows;
        total_width = total_size / new_rows;
	}

    int new_cols = total_width / new_cns;
	src.rows = new_rows;
	src.cols = new_cols;
	src.cns = new_cns;
}

void reshape(out Mat12 src, int new_cns, int new_rows)
{
	int total_width = src.cols * src.cns;
    if ((new_cns > total_width || total_width % new_cns != 0) && new_rows == 0) {
        new_rows = src.rows * total_width / new_cns;
	}

    if (new_rows != 0 && new_rows != src.rows) {
        int total_size = total_width * src.rows;
        total_width = total_size / new_rows;
	}

    int new_cols = total_width / new_cns;
	src.rows = new_rows;
	src.cols = new_cols;
	src.cns = new_cns;
}

float hypot(float a, float b)
{
    a = abs(a);
    b = abs(b);
    if (a > b) {
        b /= a;
        return a*sqrt(1.0 + b*b);
	}
    if (b > 0) {
        a /= b;
        return b*sqrt(1.0 + a*a);
	}
    return 0.0;
}

Mat8 cvUndistortPoints(Mat8 src, mat3 cameraMatrix, int criteria_maxCount, float criteria_epsilon)
{
	mat3 RR = mat3(1.0); // identity
	
	Mat8 dst = emptyMat4x1x2();

	float fx = cameraMatrix[0][0];
	float fy = cameraMatrix[1][1];
	float ifx = 1.0/fx;
	float ify = 1.0/fy;
	float cx = cameraMatrix[0][2];
	float cy = cameraMatrix[1][2];

	int n = src.rows + src.cols - 1;
	for (int i = 0; i < n; i++) {
		int x0 = 0;
		int y0 = 0;

		float x = src.data[idx(src,i,0,0)];
		float y = src.data[idx(src,i,0,1)];

		float u = x;
		float v = y;
		x = (x - cx) * ifx;
		y = (y - cy) * ify;

        float xx = RR[0][0]*x + RR[0][1]*y + RR[0][2];
        float yy = RR[1][0]*x + RR[1][1]*y + RR[1][2];
        float ww_lower = RR[2][0]*x + RR[2][1]*y + RR[2][2];
        float ww = 1.0/ww_lower;
        x = xx*ww;
        y = yy*ww;

        dst.data[idx(dst,i,0,0)] = x;
        dst.data[idx(dst,i,0,1)] = y;
	}

	return dst;
}

vec3 cvAvg(Mat12 mat)
{
	vec3 avgs = vec3(0.0);
    for (int i = 0; i < mat.rows; i++) {
        for (int j = 0; j < mat.cols; j++) {
			avgs[0] += mat.data[idx(mat,i,j,0)] / mat.rows;
			avgs[1] += mat.data[idx(mat,i,j,1)] / mat.rows;
			avgs[2] += mat.data[idx(mat,i,j,2)] / mat.rows;
		}
	}
    return avgs;
}

Mat9 cvMulTransposed(Mat12 src, int ata, vec3 delta)
{
	if (!all(equal(delta, vec3(0.0)))) {
		for (int i = 0; i < src.rows; i++) {
			src.data[idx(src,i,0)] -= delta[0];
			src.data[idx(src,i,1)] -= delta[1];
			src.data[idx(src,i,2)] -= delta[2];
		}
	}
	return matmul(mattranspose(src), src);
}

Mat36 cvMulTransposed(Mat48 src, int ata)
{
	return matmul(mattranspose(src), src);
}

void JacobiSVD(
	inout Mat36 At, in int astep, inout float[6] W, inout Mat36 Vt, in int vstep,
	in int m, in int n, in int n1)
{
	// Assume: float[6] W -> n = 6
    float minval = FLT_MIN;
    float eps = FLT_EPSILON;
	int i, j, k, iter;
	float c, s, sd;
    int max_iter = max(m, 30);
    if (n1 < 0) {
        n1 = n;
	}
    for (i = 0; i < n; i++) {
        sd = 0.0;
        for (k = 0; k < m; k++) {
            float t = At.data[i * astep + k];
            sd += t * t;
		}
        W[i] = sd;
        for (k = 0; k < n; k++) {
            Vt.data[i * vstep + k] = 0.0;
		}
        Vt.data[i * vstep + i] = 1.0;
	}
	//testOutValue(At);
    
    for (iter = 0; iter < max_iter; iter++) {
        bool changed = false;

    	for (i = 0; i < n-1; i++) {
			for (j = i+1; j < n; j++) {
                float a = W[i];
                float p = 0.0;
                float b = W[j];

                for (k = 0; k < m; k++) {
                    p += At.data[i * astep + k] * At.data[j * astep + k];
				}

                if (abs(p) <= eps * sqrt(a * b)) {
                    continue;
				}

                p *= 2;
                float beta = a - b;
                float gamma = hypot(p, beta);
                if (beta < 0.0) {
                    float delta = (gamma - beta) * 0.5;
                    s = sqrt(delta / gamma);
                    c = p / (gamma * s * 2.0);
				} else {
                    c = sqrt((gamma + beta) / (gamma * 2.0));
                    s = p / (gamma * c * 2.0);
				}
				/*
				int xt = int(outValue[99]*9.0);
				outValue[xt+0] = p;
				outValue[xt+1] = beta;
				outValue[xt+2] = gamma;
				outValue[xt+3] = c;
				outValue[xt+4] = s;
				outValue[xt+5] = a;
				outValue[xt+6] = b;
				outValue[xt+7] = W[i];
				outValue[xt+8] = W[j];
				outValue[99] += 1.0;
				*/

                a = 0.0;
                b = 0.0;
                for (k = 0; k < m; k++) {
                    float t0 = c * At.data[i * astep + k] + s * At.data[j * astep + k];
                    float t1 = -s * At.data[i * astep + k] + c * At.data[j * astep + k];
                    At.data[i * astep + k] = t0;
                    At.data[j * astep + k] = t1;

                    a += t0 * t0;
                    b += t1 * t1;
				}
                //testOutValue(At);
                W[i] = a;
                W[j] = b;
                //testOutValue(W);

                changed = true;

                for (k = 0; k < n; k++) {
                    float t0 = (Vt.data[i * vstep + k] * c) + (Vt.data[j * vstep + k] * s);
                    float t1 = (Vt.data[j * vstep + k] * c) - (Vt.data[i * vstep + k] * s);
                    Vt.data[i * vstep + k] = t0;
                    Vt.data[j * vstep + k] = t1;
				}

                for (k = 6; k < n; k++) {
                    float t0 = c * Vt.data[i * vstep + k] + s * Vt.data[j * vstep + k];
                    float t1 = -s * Vt.data[i * vstep + k] + c * Vt.data[j * vstep + k];
                    Vt.data[i * vstep + k] = t0;
                    Vt.data[j * vstep + k] = t1;
				}
			}
		}
        if (!changed) {
            break;
		}
	}
    //testOutValue(W);
    //testOutValue(Vt);

    for (i = 0; i < n; i++) {
        sd = 0;
		for (k = 0; k < m; k++) {
            float t = At.data[i * astep + k];
            sd += t*t;
		}
        W[i] = sqrt(sd);
	}

    for (i = 0; i < n-1; i++) {
        j = i;
		for (k = i+1; k < n; k++) {
            if (W[j] < W[k]) {
                j = k;
			}
		}
        if (i != j) {
            swap(W,i, W,j);
			for (k = 0; k < m; k++) {
                swap(At,i * astep + k, At,j * astep + k);
			}

			for (k = 0; k < n; k++) {
                swap(Vt,i * vstep + k, Vt,j * vstep + k);
			}
		}
	}
	
    //testOutValue(W);
	for (i = 0; i < n1; i++) {
        sd = 0.0;
        if (i < n) {
            sd = W[i];
		}

        for (int ii = 0; ii < 100; ii++) {
            if (sd > minval) {
                break;
			}
            float val0 = 1.0/m;
            for (k = 0; k < m; k++) {
                float val = val0;
                At.data[i * astep + k] = val;
			}
            for (iter = 0; iter < 2; iter++) {
                for (j = 0; j < i; j++) {
                    sd = 0;
            		for (k = 0; k < m; k++) {
                        sd += At.data[i * astep + k] * At.data[j * astep + k];
					}
                    float asum = 0.0;
            		for (k = 0; k < m; k++) {
                        float t = At.data[i * astep + k] - sd * At.data[j * astep + k];
                        At.data[i * astep + k] = t;
                        asum += abs(t);
					}
                    asum = 0.0;
                    if (asum > eps * 100.0) {
                        asum = 1.0 / asum;
					}
            		for (k = 0; k < m; k++) {
                        At.data[i * astep + k] *= asum;
					}
				}
			}
            sd = 0;
			for (k = 0; k < m; k++) {
                float t = At.data[i * astep + k];
                sd += t * t;
			}
            sd = sqrt(sd);
		}
        s = 0.0;
        if (sd > minval) {
            s = 1.0 / sd;
		}
        for (k = 0; k < m; k++) {
            At.data[i * astep + k] *= s;
		}
	}
}

void JacobiSVD(
	inout Mat9 At, in int astep, inout float[3] W, inout Mat9 Vt, in int vstep,
	in int m, in int n, in int n1)
{
	// Assume: float[3] W -> n = 3
    float minval = FLT_MIN;
    float eps = FLT_EPSILON;
	int i, j, k, iter;
	float c, s, sd;
    int max_iter = max(m, 30);
    if (n1 < 0) {
        n1 = n;
	}
    for (i = 0; i < n; i++) {
        sd = 0.0;
        for (k = 0; k < m; k++) {
            float t = At.data[i * astep + k];
            sd += t * t;
		}
        W[i] = sd;
        for (k = 0; k < n; k++) {
            Vt.data[i * vstep + k] = 0.0;
		}
        Vt.data[i * vstep + i] = 1.0;
	}
	//testOutValue(At);
    
    for (iter = 0; iter < max_iter; iter++) {
        bool changed = false;

    	for (i = 0; i < n-1; i++) {
			for (j = i+1; j < n; j++) {
                float a = W[i];
                float p = 0.0;
                float b = W[j];

                for (k = 0; k < m; k++) {
                    p += At.data[i * astep + k] * At.data[j * astep + k];
				}

                if (abs(p) <= eps * sqrt(a * b)) {
                    continue;
				}

                p *= 2;
                float beta = a - b;
                float gamma = hypot(p, beta);
                if (beta < 0.0) {
                    float delta = (gamma - beta) * 0.5;
                    s = sqrt(delta / gamma);
                    c = p / (gamma * s * 2.0);
				} else {
                    c = sqrt((gamma + beta) / (gamma * 2.0));
                    s = p / (gamma * c * 2.0);
				}
				/*
				int xt = int(outValue[99]*9.0);
				outValue[xt+0] = p;
				outValue[xt+1] = beta;
				outValue[xt+2] = gamma;
				outValue[xt+3] = c;
				outValue[xt+4] = s;
				outValue[xt+5] = a;
				outValue[xt+6] = b;
				outValue[xt+7] = W[i];
				outValue[xt+8] = W[j];
				outValue[99] += 1.0;
				*/

                a = 0.0;
                b = 0.0;
                for (k = 0; k < m; k++) {
                    float t0 = c * At.data[i * astep + k] + s * At.data[j * astep + k];
                    float t1 = -s * At.data[i * astep + k] + c * At.data[j * astep + k];
                    At.data[i * astep + k] = t0;
                    At.data[j * astep + k] = t1;

                    a += t0 * t0;
                    b += t1 * t1;
				}
                //testOutValue(At);
                W[i] = a;
                W[j] = b;
                //testOutValue(W);

                changed = true;

                for (k = 0; k < n; k++) {
                    float t0 = (Vt.data[i * vstep + k] * c) + (Vt.data[j * vstep + k] * s);
                    float t1 = (Vt.data[j * vstep + k] * c) - (Vt.data[i * vstep + k] * s);
                    Vt.data[i * vstep + k] = t0;
                    Vt.data[j * vstep + k] = t1;
				}

                for (k = 6; k < n; k++) {
                    float t0 = c * Vt.data[i * vstep + k] + s * Vt.data[j * vstep + k];
                    float t1 = -s * Vt.data[i * vstep + k] + c * Vt.data[j * vstep + k];
                    Vt.data[i * vstep + k] = t0;
                    Vt.data[j * vstep + k] = t1;
				}
			}
		}
        if (!changed) {
            break;
		}
	}
    //testOutValue(W);
    //testOutValue(Vt);

    for (i = 0; i < n; i++) {
        sd = 0;
		for (k = 0; k < m; k++) {
            float t = At.data[i * astep + k];
            sd += t*t;
		}
        W[i] = sqrt(sd);
	}

    for (i = 0; i < n-1; i++) {
        j = i;
		for (k = i+1; k < n; k++) {
            if (W[j] < W[k]) {
                j = k;
			}
		}
        if (i != j) {
            swap(W,i, W,j);
			for (k = 0; k < m; k++) {
                swap(At,i * astep + k, At,j * astep + k);
			}

			for (k = 0; k < n; k++) {
                swap(Vt,i * vstep + k, Vt,j * vstep + k);
			}
		}
	}
	
    //testOutValue(W);
	for (i = 0; i < n1; i++) {
        sd = 0.0;
        if (i < n) {
            sd = W[i];
		}

        for (int ii = 0; ii < 100; ii++) {
            if (sd > minval) {
                break;
			}
            float val0 = 1.0/m;
            for (k = 0; k < m; k++) {
                float val = val0;
                At.data[i * astep + k] = val;
			}
            for (iter = 0; iter < 2; iter++) {
                for (j = 0; j < i; j++) {
                    sd = 0;
            		for (k = 0; k < m; k++) {
                        sd += At.data[i * astep + k] * At.data[j * astep + k];
					}
                    float asum = 0.0;
            		for (k = 0; k < m; k++) {
                        float t = At.data[i * astep + k] - sd * At.data[j * astep + k];
                        At.data[i * astep + k] = t;
                        asum += abs(t);
					}
                    asum = 0.0;
                    if (asum > eps * 100.0) {
                        asum = 1.0 / asum;
					}
            		for (k = 0; k < m; k++) {
                        At.data[i * astep + k] *= asum;
					}
				}
			}
            sd = 0;
			for (k = 0; k < m; k++) {
                float t = At.data[i * astep + k];
                sd += t * t;
			}
            sd = sqrt(sd);
		}
        s = 0.0;
        if (sd > minval) {
            s = 1.0 / sd;
		}
        for (k = 0; k < m; k++) {
            At.data[i * astep + k] *= s;
		}
	}
}

void SVDCompute(in Mat9 src, inout float[3] w, inout Mat9 u, inout Mat9 vt)
{
    int m = src.rows;
    int n = src.cols;
	// Assume: compute_uv = true
    bool at = false;
    if (m < n) {
        swap(m, n);
        at = true;
	}
    Mat9 temp_a = src;
    if (!at) {
        temp_a = mattranspose(temp_a);
	}
    int astep = m;
    int vstep = vt.cols;
	int ustep = u.rows;
	// Set: temp_a, w, vt
    JacobiSVD(temp_a, astep, w, vt, vstep, m, n, ustep);

	u = temp_a;
	// compute_uv
	if (!at) {
		u = mattranspose(u);
	} else {
		u = mattranspose(vt);
		vt = temp_a;
	}
}

float norm(vec3 arr) {
	arr = abs(arr);
    float retval = 0.0;
    retval += arr[0]*arr[0];
    retval += arr[1]*arr[1];
    retval += arr[2]*arr[2];
    return sqrt(retval);
}

float norm(float[6] arr) {
    float retval = 0.0;
	float value;
	for (int i = 0; i < arr.length(); i++) {
		value = abs(arr[i]);
    	retval += value * value;
	}
    return sqrt(retval);
}

float norm(Mat8 arr) {
    float retval = 0.0;
	float value;
	for (int i = 0; i < arr.data.length(); i++) {
		value = abs(arr.data[i]);
    	retval += value * value;
	}
    return sqrt(retval);
}

void cvRodrigues2(
	out vec3 rvec, out mat3 rmat, out Mat27 matJ,
	in bool vec_to_mat, in bool use_jacobian)
{
	if (vec_to_mat) {
		// Assume: src -> length -> rows = 3
		// Assume: src = rvec, dst = rmat
		vec3 r = rvec;
		float theta = norm(r);

		if (theta < FLT_EPSILON) {
			rmat = mat3(1.0); // identity
			if (use_jacobian) {
				matJ.data[5] = -1.0;
				matJ.data[15] = -1.0;
				matJ.data[19] = -1.0;
				matJ.data[7] = -1.0;
				matJ.data[11] = -1.0;
				matJ.data[21] = -1.0;
			}
		} else {
			float c = cos(theta);
			float s = sin(theta);
			float c1 = 1.0 - c;
			float itheta = 0.0;
            if (theta != 0) {
                itheta = 1.0/theta;
			}
            r *= itheta;
            mat3 _rrt = mat3(
                r[0]*r[0], r[0]*r[1], r[0]*r[2],
                r[0]*r[1], r[1]*r[1], r[1]*r[2],
                r[0]*r[2], r[1]*r[2], r[2]*r[2]
            );
            // r_hat (vee matrix)
            mat3 _r_x = mat3(
                0.0, -r[2], r[1],
                r[2], 0.0, -r[0],
                -r[1], r[0], 0.0
			);
			// TODO: CHECK rrt MATMUL CORRECTNESS
            rmat = c*mat3(1.0) + c1*_rrt + s*_r_x;
			//testOutValue(rmat);

			Mat9 rrt = convertToMat9(_rrt);
			Mat9 r_x = convertToMat9(_r_x);

            if (use_jacobian) {
                float[9] I = float[9](
					1.0, 0.0, 0.0,
					0.0, 1.0, 0.0,
					0.0, 0.0, 1.0
				);
                float[27] drrt = float[](
					r[0]+r[0], r[1], r[2], r[1], 0.0, 0.0, r[2], 0.0, 0.0,
					0.0, r[0], 0.0, r[0], r[1]+r[1], r[2], 0.0, r[2], 0.0,
					0.0, 0.0, r[0], 0.0, 0.0, r[1], r[0], r[1], r[2]+r[2]
				);
                float[27] d_r_x = float[](
					0.0, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, 1.0, 0.0,
					0.0, 0.0, 1.0, 0.0, 0.0, 0.0, -1.0, 0.0, 0.0,
					0.0, -1.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0
				);
				
                for (int i = 0; i < 3; i++) {
                    float ri = r[i];
                    float a0 = -s*ri;
                    float a1 = (s - 2*c1*itheta)*ri;
                    float a2 = c1*itheta;
                    float a3 = (c - s*itheta)*ri;
                    float a4 = s*itheta;
                    for (int k = 0; k < 9; k++) {
                        matJ.data[i*9+k] = a0*I[k] + a1*rrt.data[k] + a2*drrt[i*9+k] + a3*r_x.data[k] + a4*d_r_x[i*9+k];
					}
				}
			}
		}
	} else {
		// Assume: src = rmat, dst = rvec
		// Assume: vec_to_mat = false -> jacobian never used -> use_jacobian = false
        float theta, s, c;
		Mat9 _R = convertToMat9(rmat);
		float[3] w;
		Mat9 v = emptyMat3x3();
		// Set: w, R, v
		SVDCompute(_R, w, _R, v);
		//testOutValue(_R);
		//testOutValue(v);
		mat3 R = matmul(convertToMat3(_R), convertToMat3(v));
		
		vec3 r = vec3(R[2][1] - R[1][2], R[0][2] - R[2][0], R[1][0] - R[0][1]);
		
        s = sqrt((r[0]*r[0] + r[1]*r[1] + r[2]*r[2])*0.25);
        c = (R[0][0] + R[1][1] + R[2][2] - 1)*0.5;
		c = clamp(c, -1.0, 1.0);
		theta = acos(c);

		if (s < 1e-5) {
			float t, temp;
			if (c > 0) {
				r = vec3(0.0);
			} else {
                t = (R[0][0] + 1)*0.5;
                r[0] = sqrt(max(t,0.0));
                
                t = (R[1][1] + 1)*0.5;
                temp = 1.0;
                if (R[0][1] < 0) {
                    temp = -1.0;
				}
                r[1] = sqrt(max(t,0.0))*temp;
                
                t = (R[2][2] + 1)*0.5;
                temp = 1.0;
                if (R[0][2] < 0) {
                    temp = -1.0;
				}
                r[2] = sqrt(max(t,0.0))*temp;

                if (abs(r[0]) < abs(r[1]) && abs(r[0]) < abs(r[2]) && (R[1][2] > 0) != (r[1]*r[2] > 0)) {
                    r[2] = -r[2];
				}
                theta /= norm(r);
                r *= theta;
			}
			/*
            if (use_jacobian) {
                if (c > 0) {
                    matJ.data[5] = -0.5;
                    matJ.data[15] = -0.5;
                    matJ.data[19] = -0.5;
                    matJ.data[7] = 0.5;
                    matJ.data[11] = 0.5;
                    matJ.data[21] = 0.5;
				}
			}
			*/
		} else {
            float vth = 1/(2*s);
			/*
            if (use_jacobian) {
                float dtheta_dtr = -1.0/s;
                float dvth_dtheta = -vth*c/s;
                float d1 = 0.5*dvth_dtheta*dtheta_dtr;
                float d2 = 0.5*dtheta_dtr;
                Mat45 dvardR = newMat5x9(float[](
                    0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, -1.0, 0.0,
                    0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0,
                    0.0, 1.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                    d1, 0.0, 0.0, 0.0, d1, 0.0, 0.0, 0.0, d1,
                    d2, 0.0, 0.0, 0.0, d2, 0.0, 0.0, 0.0, d2
				));
            	Mat20 dvar2dvar = newMat4x5(float[](
                    vth, 0.0, 0.0, r.x, 0.0,
                    0.0, vth, 0.0, r.y, 0.0,
                    0.0, 0.0, vth, r.z, 0.0,
                    0.0, 0.0, 0.0, 0.0, 1
				));
                Mat12 domegadvar2 = newMat3x4(float[](
                    theta, 0.0, 0.0, r.x*vth,
                    0.0, theta, 0.0, r.y*vth,
                    0.0, 0.0, theta, r.z*vth
				));
                Mat15 t0 = matmul(domegadvar2, dvar2dvar);
                matJ = matmul(t0, dvardR);
                
                swap(matJ,1, matJ,3);
                swap(matJ,2, matJ,6);
                swap(matJ,5, matJ,7);
                swap(matJ,10, matJ,12);
                swap(matJ,11, matJ,15);
                swap(matJ,14, matJ,16);
                swap(matJ,19, matJ,21);
               	swap(matJ,20, matJ,24);
                swap(matJ,23, matJ,25);
			}
			*/
            vth *= theta;
            r *= vth;
		}
		rvec = r;
	}
	// Unused: Transpose when jacobian matJ is not square
}

void cvRodrigues2(in vec3 src, out mat3 dst, out Mat27 matJ)
{
	cvRodrigues2(src, dst, matJ, true, true);
}

void cvRodrigues2(in mat3 src, out vec3 dst)
{
	Mat27 matJ = emptyMat3x9();
	cvRodrigues2(dst, src, matJ, false, false);
}

void cvRodrigues2(in vec3 src, out mat3 dst)
{
	Mat27 matJ = emptyMat3x9();
	cvRodrigues2(src, dst, matJ, true, false);
}





float cubick(float b, float c, float d)
{
    // Choose an initial solution
    float r0;
    // not monotonic
    if (b * b >= 3.0 * c) {
        // h has two stationary points, compute them
        // float t1 = t - std::sqrt(diff);
        float v = sqrt(b * b - 3.0 * c);
        float t1 = (-b - v) / (3.0);

        // Check if h(t1) > 0, in this case make a 2-order approx of h around t1
        float k = ((t1 + b) * t1 + c) * t1 + d;

        if (k > 0.0) {
            // Find leftmost root of 0.5*(r0 -t1)^2*(6*t1+2*b) +  k = 0
            r0 = t1 - sqrt(-k / (3.0 * t1 + b));
            // or use the linear comp too
            // r0 = t1 -
        } else {
            float t2 = (-b + v) / 3.0;
            k = ((t2 + b) * t2 + c) * t2 + d;
            // Find rightmost root of 0.5 * (r0 - t2)^2 * (6 * t2 +2 * b) + k1 = 0
            r0 = t2 + sqrt(-k / (3.0 * t2 + b));
        }
    } else {
        // r0=1.0/(cubick_inv(c/d,b/d,1.0/d));
        // about half work...
        // if(std::abs((((r0+b)*r0+c)*r0+d))>1e-10)
        r0 = -b / 3.0;
        if (abs(((3.0 * r0 + 2.0 * b) * r0 + c)) < 1e-4) {
            r0 += 1;
		}
        //else r0-=1;
        //float fx=(((r0+b)*r0+c)*r0+d); r0-=10; if(fx<0) r0+=20;
    }

	// Do ITER Newton-Raphson iterations
	// Break if position of root changes less than 1e-13
	// float starterr=std::abs(r0*(r0*(r0 + b) + c) + d);
	// TODO(RJ:) I have hardcoded the number of iteration here, it's a hardcoded in a define in the orginal implementation
	// according to the author, increasing it could lead to a better solution (more robust)
	for (int cnt = 0; cnt < 50; ++cnt) {
		float fx = (((r0 + b) * r0 + c) * r0 + d);

		if (cnt < 7 || abs(fx) > 1e-13) {
			float fpx = ((3.0 * r0 + 2.0 * b) * r0 + c);
			r0 -= fx / fpx;
		} else {
			break;
		}
	}
	return r0;
}

bool root2real(in float b, in float c, inout float r1, inout float r2)
{
    float v = b * b -4.0 * c;
    if (v < 0.0) {
		r1 = r2 = 0.5 * b;
		return false;
    }
    float y = sqrt(v);
    if (b < 0.0) {
        r1 = 0.5 * (-b + y);
        r2 = 0.5 * (-b - y);
    } else {
        r1 = 2.0 * c / (-b + y);
        r2 = 2.0 * c / (-b - y);
    }
    return true;
}

void swap(inout float a, inout float b)
{
	float a_temp = a;
	a = b;
	b = a_temp;
}

void swap(inout vec3 a, inout vec3 b)
{
	vec3 a_temp = a;
	a = b;
	b = a_temp;
}

void swap(inout mat3 a, inout mat3 b)
{
	mat3 a_temp = a;
	a = b;
	b = a_temp;
}

/**
 * @brief eigwithknown0 eigen decomposition of a matrix which has a 0 eigen value
 * @param x the input matrix
 * @param E eigenvectors
 * @param L eigenvalues
 */
void eigwithknown0(in mat3 x, inout mat3 E, inout vec3 L)
{
    // one eigenvalue is known to be 0.
    // the known one...
    L[2] = 0.0;
    vec3 v3 = vec3(
        x[1][0] * x[2][1] - x[2][0] * x[1][1],
        x[2][0] * x[0][1] - x[2][1] * x[0][0],
        x[1][1] * x[0][0] - x[1][0] * x[0][1]
	);

    v3 = normalize(v3);

    float x01_squared = x[0][1] * x[0][1];
    // get the two other...
    float b = -x[0][0] - x[1][1] - x[2][2];
    float c = -x01_squared - x[0][2] * x[0][2] - x[1][2] * x[1][2] +
                         x[0][0] * (x[1][1] + x[2][2]) + x[1][1] * x[2][2];
    float e1, e2;
    // roots(poly(x))
    root2real(b, c, e1, e2);

    if (abs(e1) < abs(e2)) {
        swap(e1, e2);
	}
    L[0] = e1;
    L[1] = e2;

    float mx0011 = -x[0][0] * x[1][1];
    float prec_0 = x[0][1] * x[1][2] - x[0][2] * x[1][1];
    float prec_1 = x[0][1] * x[0][2] - x[0][0] * x[1][2];

    float e = e1;
    float tmp = 1.0 / (e * (x[0][0] + x[1][1]) + mx0011 - e * e + x01_squared);
    float a1 = -(e * x[0][2] + prec_0) * tmp;
    float a2 = -(e * x[1][2] + prec_1) * tmp;
    float rnorm = 1.0 / sqrt(a1 * a1 + a2 * a2 + 1.0);
    a1 *= rnorm;
    a2 *= rnorm;
    vec3 v1 = vec3(a1, a2, rnorm);

    // e = e2;
    float tmp2 = 1.0 / (e2 * (x[0][0] + x[1][1]) + mx0011 - e2 * e2 + x01_squared);
    float a21 = -(e2 * x[0][2] + prec_0) * tmp2;
    float a22 = -(e2 * x[1][2] + prec_1) * tmp2;
    float rnorm2 = 1.0 / sqrt(a21 * a21 + a22 * a22 + 1.0);
    a21 *= rnorm2;
    a22 *= rnorm2;
    vec3 v2 = vec3(a21, a22, rnorm2);

    // optionally remove axb from v1,v2
    // costly and makes a very small difference!
    // v1=(v1-v1.dot(v3)*v3);v1.normalize();
    // v2=(v2-v2.dot(v3)*v3);v2.normalize();
    // v2=(v2-v1.dot(v2)*v2);v2.normalize();
    E = mat3(
		v1[0], v2[0], v3[0],
		v1[1], v2[1], v3[1],
		v1[2], v2[2], v3[2]
	);
}

/**
 * @brief Refine a valid solution with a Gauss-Newton Solver.
 * @param L Valid lambdas
 * @param a12 is the squared distance between X1 and X2
 * @param a13 is the squared distance between X1 and X3
 * @param a23 is the squared distance between X2 and X3
 * @param b12 is the cosine of the angle between bearing vector 1 and bearing vector 2
 * @param b13 is the cosine of the angle between bearing vector 1 and bearing vector 3
 * @param b23 is the cosine of the angle between bearing vector 2 and bearing vector 3
 * The paper note it rarely improve after two iterations. The original implementation use 5 iterations.
 */
void gauss_newton_refineL(
    inout vec3 L,
    in float a12, in float a13, in float a23,
    in float b12, in float b13, in float b23)
{
    // expr makes it easier for the compiler to unroll
    // TODO(RJ:) I have hardcoded the number of iterations here, it's a template parameter in the original implementation
    for (int i = 0; i < 5; ++i) {
        float l1 = L[0];
        float l2 = L[1];
        float l3 = L[2];
        float r1 = l1 * l1 + l2 * l2 + b12 * l1 * l2 - a12;
        float r2 = l1 * l1 + l3 * l3 + b13 * l1 * l3 - a13;
        float r3 = l2 * l2 + l3 * l3 + b23 * l2 * l3 - a23;

        if (abs(r1) + abs(r2) + abs(r3) < 1e-10) {
            break;
        }

        float dr1dl1 = 2.0 * l1 + b12 * l2;
        float dr1dl2 = 2.0 * l2 + b12 * l1;

        float dr2dl1 = 2.0 * l1 + b13 * l3;
        float dr2dl3 = 2.0 * l3 + b13 * l1;

        float dr3dl2 = 2.0 * l2 + b23 * l3;
        float dr3dl3 = 2.0 * l3 + b23 * l2;

        vec3 r = vec3(r1, r2, r3);

        // or skip the inverse and make it explicit...
		{
			float v0 = dr1dl1;
			float v1 = dr1dl2;
			float v3 = dr2dl1;
			float v5 = dr2dl3;
			float v7 = dr3dl2;
			float v8 = dr3dl3;
			float det = 1.0 / (-v0 * v5 * v7 - v1 * v3 * v8);

			mat3 Ji = mat3(
				-v5 * v7, -v1 * v8, v1 * v5,
				-v3 * v8, v0 * v8, -v0 * v5,
				v3 * v7, -v0 * v7, -v1 * v3
			);
			vec3 L1 = vec3(L) - det * (Ji * r);
			//%l=l - g*H\G;%inv(H)*G
			//L=L - g*J\r; 
			//% works because the size is ok!
			{
				float l1 = L1[0];
				float l2 = L1[1];
				float l3 = L1[2];
				float r11 = l1 * l1 + l2 * l2 + b12 * l1 * l2 - a12;
				float r12 = l1 * l1 + l3 * l3 + b13 * l1 * l3 - a13;
				float r13 = l2 * l2 + l3 * l3 + b23 * l2 * l3 - a23;
				if (abs(r11) + abs(r12) + abs(r13) > abs(r1) + abs(r2) + abs(r3))
				{
					break;
				} else {
					L = L1;
				}
			}
		}
    }
}

/**
* @brief Compute the absolute pose of a camera using three 3D-to-2D correspondences.
*  Implementation of the paper "Lambda Twist: An Accurate Fast Robust Perspective Three Point (P3P) Solver". Persson, M. and Nordberg, K. ECCV 2018
* 
* @authors Mikael Persson and Klas Nordberg
* 
* @param[in] bearing_vectors 3x3 matrix with UNITARY feature vectors (each column is a vector)
* @param[in] X  3x3 matrix with corresponding 3D world points (each column is a point)
* @param[out] rotation_translation_solutions vector that will contain the solutions (up to 4 solutions)
*
* @return true if at least one solution is found, false if no solution was found
*
*/

int computePosesNordberg(
	in mat3 bearing_vectors,
	in mat3 X,
	inout mat3[4] rotation_solutions,
	inout vec3[4] translation_solutions)
{
    // Extraction of 3D points vectors
    vec3 P1 = X[0];
    vec3 P2 = X[1];
    vec3 P3 = X[2];

    // Extraction of feature vectors
    vec3 f1 = bearing_vectors[0];
    vec3 f2 = bearing_vectors[1];
    vec3 f3 = bearing_vectors[2];

    f1 = normalize(f1);
	f2 = normalize(f2);
	f3 = normalize(f3);

    float b12 = -2.0 * dot(f1, f2);
    float b13 = -2.0 * dot(f1, f3);
    float b23 = -2.0 * dot(f2, f3);

    // implicit creation of vec3, can be removed
    vec3 d12 = P1 - P2;
    vec3 d13 = P1 - P3;
    vec3 d23 = P2 - P3;
    vec3 d12xd13 = cross(d12, d13);

    float a12 = dot(d12, d12);
    float a13 = dot(d13, d13);
    float a23 = dot(d23, d23);

    //a*g^3 + b*g^2 + c*g + d = 0
    float c31 = -0.5 * b13;
    float c23 = -0.5 * b23;
    float c12 = -0.5 * b12;
    float blob = (c12 * c23 * c31 - 1.0);

    float s31_squared = 1.0 - c31 * c31;
    float s23_squared = 1.0 - c23 * c23;
    float s12_squared = 1.0 - c12 * c12;

    float p3 = a13 * (a23 * s31_squared - a13 * s23_squared);
    float p2 = 2.0 * blob * a23 * a13 + a13 * (2.0 * a12 + a13) * s23_squared + a23 * (a23 - a12) * s31_squared;
    float p1 = a23 * (a13 - a23) * s12_squared - a12 * a12 * s23_squared - 2.0 * a12 * (blob * a23 + a13 * s23_squared);
    float p0 = a12 * (a12 * s23_squared - a23 * s12_squared);

    // float g = 0.0;

    //p3 is det(D2) so its definietly >0 or its a degenerate case
    //if (abs(p3) >= abs(p0) || true)
    //{
    p3 = 1.0 / p3;
    p2 *= p3;
    p1 *= p3;
    p0 *= p3;

    // get sharpest real root of above...
    float g = cubick(p2, p1, p0);
    //}
    // else
    //{

        // lower numerical performance
        //g = 1.0 / (cubick(p1 / p0, p2 / p0, p3 / p0));
    //}

    // we can swap D1,D2 and the coeffs!
    // oki, Ds are:
    //D1=M12*XtX(2,2) - M23*XtX(1,1);
    //D2=M23*XtX(3,3) - M13*XtX(2,2);

    //[    a23 - a23*g,                 (a23*b12)/2,              -(a23*b13*g)/2]
    //[    (a23*b12)/2,           a23 - a12 + a13*g, (a13*b23*g)/2 - (a12*b23)/2]
    //[ -(a23*b13*g)/2, (a13*b23*g)/2 - (a12*b23)/2,         g*(a13 - a23) - a12]

    // gain 13 ns...
    float A00 = a23 * (1.0 - g);
    float A01 = (a23 * b12) * 0.5;
    float A02 = (a23 * b13 * g) * (-0.5);
    float A11 = a23 - a12 + a13 * g;
    float A12 = b23 * (a13 * g - a12) * 0.5;
    float A22 = g * (a13 - a23) - a12;

    mat3 A = mat3(
		A00, A01, A02,
        A01, A11, A12,
        A02, A12, A22
	);

    // get sorted eigenvalues and eigenvectors given that one should be zero...
    mat3 V;
    vec3 L;

    eigwithknown0(A, V, L);

    float v = sqrt(max(0.0, -L[1] / L[0]));

    int valid = 0;
	vec3[4] Ls;

    // use the t=Vl with t2,st2,t3 and solve for t3 in t2
    { //+v
        float s = v;

        float w2 = 1.0 / (s * V[0][1] - V[0][0]);
        float w0 = (V[1][0] - s * V[1][1]) * w2;
        float w1 = (V[2][0] - s * V[2][1]) * w2;

        float a = 1.0 / ((a13 - a12) * w1 * w1 - a12 * b13 * w1 - a12);
        float b = (a13 * b12 * w1 - a12 * b13 * w0 - 2.0 * w0 * w1 * (a12 - a13)) * a;
        float c = ((a13 - a12) * w0 * w0 + a13 * b12 * w0 + a13) * a;

        if (b * b - 4.0 * c >= 0.0)
        {
            float tau1, tau2;
            root2real(b, c, tau1, tau2);
            if (tau1 > 0.0)
            {
                float tau = tau1;
                float d = a23 / (tau * (b23 + tau) + 1.0);
                if(d > 0.0) {
                    float l2 = sqrt(d);
                    float l3 = tau * l2;

                    float l1 = w0 * l2 + w1 * l3;
                    if (l1 >= 0.0)
                    {
                        Ls[valid] = vec3(l1, l2, l3);
                        ++valid;
                    }          
                }
            }
            if (tau2 > 0.0)
            {
                float tau = tau2;
                float d = a23 / (tau * (b23 + tau) + 1.0);
                if(d > 0.0) {
                    float l2 = sqrt(d);
                    float l3 = tau * l2;
                    float l1 = w0 * l2 + w1 * l3;
                    if (l1 >= 0.0)
                    {
                        Ls[valid] = vec3(l1, l2, l3);
                        ++valid;
                    }
                }
            }
        }
    }

    { //-v
        float s = -v;
        float w2 = 1.0 / (s * V[0][1] - V[0][0]);
        float w0 = (V[1][0] - s * V[1][1]) * w2;
        float w1 = (V[2][0] - s * V[2][1]) * w2;

        float a = 1.0 / ((a13 - a12) * w1 * w1 - a12 * b13 * w1 - a12);
        float b = (a13 * b12 * w1 - a12 * b13 * w0 - 2.0 * w0 * w1 * (a12 - a13)) * a;
        float c = ((a13 - a12) * w0 * w0 + a13 * b12 * w0 + a13) * a;

        if (b * b - 4.0 * c >= 0)
        {
            float tau1, tau2;

            root2real(b, c, tau1, tau2);
            if (tau1 > 0)
            {
                float tau = tau1;
                float d = a23 / (tau * (b23 + tau) + 1.0);
                if(d > 0.0) {
                    float l2 = sqrt(d);
                    float l3 = tau * l2;

                    float l1 = w0 * l2 + w1 * l3;
                    if (l1 >= 0)
                    {
                        Ls[valid] = vec3(l1, l2, l3);
                        ++valid;
                    }
                }
            }
            if (tau2 > 0)
            {
                float tau = tau2;
                float d = a23 / (tau * (b23 + tau) + 1.0);
                if(d > 0.0) {
                    float l2 = sqrt(d);
                    float l3 = tau * l2;

                    float l1 = w0 * l2 + w1 * l3;
                    if (l1 >= 0)
                    {
                        Ls[valid] = vec3(l1, l2, l3);
                        ++valid;
                    }
                }
            }
        }
    }

    // if constexpr (refinement_iterations>0)
    for (int i = 0; i < valid; ++i)
    {
        gauss_newton_refineL(Ls[i], a12, a13, a23, b12, b13, b23);
    }

    vec3 ry1, ry2, ry3;
    vec3 yd1;
    vec3 yd2;
    vec3 yd1xd2;
    mat3 Xmat = mat3(
		d12[0], d13[0], d12xd13[0],
        d12[1], d13[1], d12xd13[1],
        d12[2], d13[2], d12xd13[2]
	);

    Xmat = inverse(Xmat);

    for (int i = 0; i < valid; ++i)
    {
        // compute the rotation:
        ry1 = f1 * Ls[i][0];
        ry2 = f2 * Ls[i][1];
        ry3 = f3 * Ls[i][2];

        yd1 = ry1 - ry2;
        yd2 = ry1 - ry3;
        yd1xd2 = cross(yd1, yd2);

        mat3 Ymat = mat3(
            yd1[0], yd2[0], yd1xd2[0],
            yd1[1], yd2[1], yd1xd2[1],
            yd1[2], yd2[2], yd1xd2[2]
        );

        mat3 Rs = matmul(Ymat, Xmat);
		rotation_solutions[i] = Rs;
		translation_solutions[i] = ry1 - Rs * P1;
    }
    
    return valid;
}


void solveP3PLambdaTwist(
	in mat3 opoints, in mat3 ipoints, in mat3 cameraMatrix,
	in vec3 o4point, in vec2 i4point,
	inout mat3 rmat, inout vec3 tvec)
{
	ipoints[0][2] = 1.0;
	ipoints[1][2] = 1.0;
	ipoints[2][2] = 1.0;
    mat3 bearing_vectors = transpose(inverse(cameraMatrix)) * ipoints;
	//testOutValue(bearing_vectors);

	mat3[4] rotation_solutions;
	vec3[4] translation_solutions;
	int nb_solutions = computePosesNordberg(bearing_vectors, opoints, rotation_solutions, translation_solutions);

	//testOutValue(rotation_solutions[0]);
	//testOutValue(translation_solutions[0]);
	
    vec4 reproj_errors;

    // Determine final project by validating with fourth point correspondence
    float fx = cameraMatrix[0][0];
    float fy = cameraMatrix[1][1];
    float ifx = 1.0 / fx;
    float ify = 1.0 / fy;
    float cx = cameraMatrix[0][2];
    float cy = cameraMatrix[1][2];
    float cx_fx = cx / fx;
    float cy_fy = cy / fy;

    float mu3 = i4point[0];
    float mv3 = i4point[1];
    
    mu3 = (mu3 - cx) * ifx;
    mv3 = (mv3 - cy) * ify;
    mu3 = mu3 * fx + cx;
    mv3 = mv3 * fy + cy;
    mu3 = ifx * mu3 - cx_fx;
    mv3 = ify * mv3 - cy_fy;
    
    float X3 = o4point[0];
    float Y3 = o4point[1];
    float Z3 = o4point[2];

    for (int i = 0; i < nb_solutions; i++) {
        mat3 R = rotation_solutions[i];
        vec3 t = translation_solutions[i];
        float X3p = R[0][0] * X3 + R[0][1] * Y3 + R[0][2] * Z3 + t[0];
        float Y3p = R[1][0] * X3 + R[1][1] * Y3 + R[1][2] * Z3 + t[1];
        float Z3p = R[2][0] * X3 + R[2][1] * Y3 + R[2][2] * Z3 + t[2];
        float mu3p = X3p / Z3p;
        float mv3p = Y3p / Z3p;
        
        reproj_errors[i] = (mu3p - mu3) * (mu3p - mu3) + (mv3p - mv3) * (mv3p - mv3);
        //testOutValue(reproj_errors[i]);
	}
    //testOutValue(vec3(X3,Y3,Z3));
    //testOutValue(vec2(mu3, mv3));
    //testOutValue(reproj_errors);

    //sort the solutions
    for (int i = 1; i < nb_solutions; i++) {
        for (int j = i; j > 0; j--) {
            if (reproj_errors[j-1] > reproj_errors[j]) {
				swap(reproj_errors[j], reproj_errors[j-1]);
				swap(rotation_solutions[j], rotation_solutions[j-1]);
				swap(translation_solutions[j], translation_solutions[j-1]);
            } else {
                break;
			}
		}
	}
    //testOutValue(reproj_errors);

    
    rmat = rotation_solutions[0];
    tvec = translation_solutions[0];
}

const float pi = 3.14159265359;
const float halfPi = 3.14159265359/2.0;
const float twoPi = 3.14159265359*2.0;
const float radToDeg = 180.0 / pi; 
const float degToRad = pi / 180.0;


// Get camera yaw and pitch
vec2 getCameraYawPitch(mat3 matR) {
	matR = transpose(matR);
    float cos_x = sqrt(matR[2][1] * matR[2][1] + matR[2][2] * matR[2][2]);
    vec2 rot = vec2(0.0);
    /*
    if (cos_x < 1e-6) {
        // Singular, gimbal locked
        yaw = 0.0;
        pitch = 0.0;
        //roll = 1.0;
        // roll = atan(-matR[2][0], cos_x);
    }
    */
    if (cos_x >= 1e-6) {
        rot.x = atan(matR[1][0], matR[0][0]); // yaw
        rot.y = atan(matR[2][1], matR[2][2]); // pitch
        //rot.x = atan(matR[2][0], cos_x); //roll
        //rot.x = atan(-matR[2][0], cos_x); //roll
    }

    rot.x += pi;
    if (rot.x > pi) {
        rot.x -= twoPi;
    }
    rot.x += pi;

    rot.y -= halfPi;
    if (rot.y < -halfPi) {
        rot.y += pi;
    }
    return rot;
}

// Get camera translation vector
vec3 getCameraTranslation(mat3 R, vec3 tvec) {
    vec3 translation = -1.0 * R * tvec;
    return translation.xyz;
}

void main()
{
	float scale_x = 1120.0;
	float scale_y = 630.0;
	float fov = 70.0;
	// FOV in Minecraft is scaled by height
	float f_scale = (scale_y / 2.0) / tan(degToRad * (70.0 / 2.0));
	//testImagePoints = matmul(testImagePoints, scale);
	
	/*
    testImagePoints.data[0] *= scale_x;
    testImagePoints.data[1] *= scale_y;
    testImagePoints.data[2] *= scale_x;
    testImagePoints.data[3] *= scale_y;
    testImagePoints.data[4] *= scale_x;
    testImagePoints.data[5] *= scale_y;
    testImagePoints.data[6] *= scale_x;
    testImagePoints.data[7] *= scale_y;
	*/

	cameraMatrix[0][0] *= f_scale;
	cameraMatrix[1][1] *= f_scale;
	cameraMatrix[0][2] = scale_x / 2.0;
	cameraMatrix[1][2] = scale_y / 2.0;

	initOutValue();
	mat3 rmat;
	vec3 tvec;
	solveP3PLambdaTwist(
		testObjectPoints, testImagePoints, cameraMatrix,
		testObjectPoint4, testImagePoint4,
		rmat, tvec);

	//vec3 rvec;
	//cvRodrigues2(rmat, rvec);
	//testOutValue(rmat);
	//testOutValue(tvec);
	//testOutValue(rvec);

	vec3 translation = getCameraTranslation(rmat, tvec);
	vec2 rotation = getCameraYawPitch(rmat) * 180.0/pi;

	testOutValue(rotation);
	//testOutValue(translation);
}