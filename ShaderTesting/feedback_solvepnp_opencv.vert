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

Mat12 testObjectPoints = newMat4x1x3(float[](
	0.0, 0.0, 0.0,
	1.0, 0.0, 0.0,
	1.0, 1.0, 0.0,
	0.0, 1.0, 0.0
));

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

Mat8 testImagePoints = newMat4x1x2(float[](
	659.0, 455.0,
    463.0, 445.0,
    500.0, 348.0,
    641.0, 353.0
));

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

void cvProjectPoints2(
	in Mat12 objectPoints, in vec3 r_vec, in vec3 t_vec, in mat3 cameraMatrix,
	inout Mat8 imagePoints,
	inout Mat24 dpdr, in bool use_dpdr,
	inout Mat24 dpdt, in bool use_dpdt,
	in float aspectRatio)
{
    float[14] k = float[](0,0,0,0,0,0,0,0,0,0,0,0,0,0);
	mat3 matR = mat3(0.0);
    Mat27 dRdr = emptyMat3x9();
	mat3 matTilt = mat3(1.0); // identity
	mat2 dMatTilt = mat2(0.0);
	int dpdr_step, dpdt_step;
	int dpdr_i, dpdt_i;
	int i, j, row, col;
    
	// Assume: aspectRatio = 0
	// Assume: fixedAspectRatio = false

	// Assume: total = 12, count = 4;
    int total = objectPoints.rows * objectPoints.cols * objectPoints.cns;
    int count = int(total / 3.0);

	// Assume: r_vec.rows = 3, r_vec.cols = 1
	// Set: matR, dRdr;
	//testOutValue(r_vec);
    cvRodrigues2(r_vec, matR, dRdr);
	//testOutValue(matR);
	//testOutValue(dRdr);

    float fx = cameraMatrix[0][0];
    float fy = cameraMatrix[1][1];
    float cx = cameraMatrix[0][2];
    float cy = cameraMatrix[1][2];

	// Assume: fixedAspectRatio = false

    // Assume: distCoeffs is None

    if (use_dpdr) {
        dpdr_step = dpdr.cols;
        dpdr_i = 0;
	}
    if (use_dpdt) {
        dpdt_step = dpdt.cols;
        dpdt_i = 0;
	}

    bool calc_derivatives = false;
    if (use_dpdr) {
        // Skip check for all other dpd because don't need to check
        calc_derivatives = true;
	}
	//testOutValue(imagePoints);
    for (i = 0; i < count; i++) {
        float X = objectPoints.data[idx(objectPoints,0,i,0)];
        float Y = objectPoints.data[idx(objectPoints,0,i,1)];
        float Z = objectPoints.data[idx(objectPoints,0,i,2)];
        float x = matR[0][0]*X + matR[0][1]*Y + matR[0][2]*Z + t_vec[0];
        float y = matR[1][0]*X + matR[1][1]*Y + matR[1][2]*Z + t_vec[1];
        float z = matR[2][0]*X + matR[2][1]*Y + matR[2][2]*Z + t_vec[2];

		/*
		int offs = int(outValue[99])*6;
		outValue[0+offs] = x;
		outValue[1+offs] = y;
		outValue[2+offs] = z;
		*/

        if (z != 0.0) {
            z = 1.0/z;
		} else {
            z = 1.0;
		}
        x *= z;
        y *= z;
		/*
		outValue[3+offs] = x;
		outValue[4+offs] = y;
		outValue[5+offs] = z;
		outValue[99] += 1.0;
		*/
		

        float r2 = x*x + y*y;
        float r4 = r2*r2;
        float r6 = r4*r2;
        float a1 = 2*x*y;
        float a2 = r2 + 2*x*x;
        float a3 = r2 + 2*y*y;
        // k is all 0 because no distcoeffs
        float cdist = 1.0 + k[0]*r2 + k[1]*r4 + k[4]*r6;
        float icdist2 = 1.0/(1.0 + k[5]*r2 + k[6]*r4 + k[7]*r6);
        float xd0 = x*cdist*icdist2 + k[2]*a1 + k[3]*a2 + k[8]*r2 + k[9]*r4;
        float yd0 = y*cdist*icdist2 + k[2]*a3 + k[3]*a1 + k[10]*r2 + k[11]*r4;
		/*
		int offs = int(outValue[99])*4;
		outValue[0+offs] = cdist;
		outValue[1+offs] = icdist2;
		outValue[2+offs] = xd0;
		outValue[3+offs] = yd0;
		outValue[99] += 1.0;
		*/		

		// TODO: Check matmul
        vec3 vecTilt = matTilt * vec3(xd0, yd0, 1.0);
		/*
		int offs = int(outValue[99])*3;
		outValue[0+offs] = vecTilt[0];
		outValue[1+offs] = vecTilt[1];
		outValue[2+offs] = vecTilt[2];
		outValue[99] += 1.0;
		*/

        float invProj = 1.0;
        if (vecTilt[2] != 0) {
            invProj = 1.0/vecTilt[2];
		}
        float xd = invProj * vecTilt[0];
        float yd = invProj * vecTilt[1];

        imagePoints.data[idx(imagePoints,0,i,0)] = xd*fx + cx;
        imagePoints.data[idx(imagePoints,0,i,1)] = yd*fy + cy;

        if (calc_derivatives) {
			for (row = 0; row < 2; row++) {
				for (col = 0; col < 2; col++) {
                    dMatTilt[row][col] = matTilt[row][col]*vecTilt[2] - matTilt[2][col]*vecTilt[row];
				}
			}
			float invProjSquare = invProj*invProj;
			// TODO: Check matmul correctness
            dMatTilt *= invProjSquare;
			/*
			int offs = int(outValue[99])*4;
			outValue[0+offs] = dMatTilt[0][0];
			outValue[1+offs] = dMatTilt[0][1];
			outValue[2+offs] = dMatTilt[1][0];
			outValue[3+offs] = dMatTilt[1][1];
			outValue[99] += 1.0;
			*/

            if (use_dpdt) {
                vec3 dxdt = vec3(z, 0.0, -x*z);
                vec3 dydt = vec3(0.0, z, -y*z);
                for (j = 0; j < 3; j++) {
                	float dr2dt = 2.0*x*dxdt[j] + 2.0*y*dydt[j];
                    float dcdist_dt = k[0]*dr2dt + 2.0*k[1]*r2*dr2dt + 3.0*k[4]*r4*dr2dt;
                    float dicdist2_dt = -icdist2*icdist2*(k[5]*dr2dt + 2.0*k[6]*r2*dr2dt + 3.0*k[7]*r4*dr2dt);
                    float da1dt = 2.0*(x*dydt[j] + y*dxdt[j]);
                    float dmxdt = (dxdt[j]*cdist*icdist2 + x*dcdist_dt*icdist2 + x*cdist*dicdist2_dt +
                             k[2]*da1dt + k[3]*(dr2dt + 4.0*x*dxdt[j]) + k[8]*dr2dt + 2.0*r2*k[9]*dr2dt);
                    float dmydt = (dydt[j]*cdist*icdist2 + y*dcdist_dt*icdist2 + y*cdist*dicdist2_dt +
                             k[2]*(dr2dt + 4.0*y*dydt[j]) + k[3]*da1dt + k[10]*dr2dt + 2.0*r2*k[11]*dr2dt);
					// TODO: Check matmul correctness
                    vec2 dXdYd = dMatTilt * vec2(dmxdt, dmydt);
                    dpdt.data[dpdt_i+j] = fx*dXdYd[0];
                    dpdt.data[dpdt_i+dpdt_step+j] = fy*dXdYd[1];
				}
                dpdt_i += dpdt_step*2;
			}

            if (use_dpdr) {
                vec3 dx0dr = vec3(
                    X*dRdr.data[0] + Y*dRdr.data[1] + Z*dRdr.data[2],
                    X*dRdr.data[9] + Y*dRdr.data[10] + Z*dRdr.data[11],
                    X*dRdr.data[18] + Y*dRdr.data[19] + Z*dRdr.data[20]
				);
                vec3 dy0dr = vec3(
                    X*dRdr.data[3] + Y*dRdr.data[4] + Z*dRdr.data[5],
                    X*dRdr.data[12] + Y*dRdr.data[13] + Z*dRdr.data[14],
                    X*dRdr.data[21] + Y*dRdr.data[22] + Z*dRdr.data[23]
				);
                vec3 dz0dr = vec3(
                    X*dRdr.data[6] + Y*dRdr.data[7] + Z*dRdr.data[8],
                    X*dRdr.data[15] + Y*dRdr.data[16] + Z*dRdr.data[17],
                    X*dRdr.data[24] + Y*dRdr.data[25] + Z*dRdr.data[26]
				);
				/*
				int offs = int(outValue[99])*9;
				outValue[0+offs] = dx0dr[0];
				outValue[1+offs] = dx0dr[1];
				outValue[2+offs] = dx0dr[2];
				outValue[3+offs] = dy0dr[0];
				outValue[4+offs] = dy0dr[1];
				outValue[5+offs] = dy0dr[2];
				outValue[6+offs] = dz0dr[0];
				outValue[7+offs] = dz0dr[1];
				outValue[8+offs] = dz0dr[2];
				outValue[99] += 1.0;
				*/
				for (j = 0; j < 3; j++) {
                    float dxdr = z*(dx0dr[j] - x*dz0dr[j]);
                    float dydr = z*(dy0dr[j] - y*dz0dr[j]);
					/*
					int offs = int(outValue[99])*5;
					outValue[0+offs] = dxdr;
					outValue[1+offs] = dydr;
					outValue[2+offs] = x;
					outValue[3+offs] = y;
					outValue[4+offs] = z;
					outValue[99] += 1.0;
					*/
                    float dr2dr = 2.0*x*dxdr + 2.0*y*dydr;
                    float dcdist_dr = (k[0] + 2.0*k[1]*r2 + 3.0*k[4]*r4)*dr2dr;
                    float dicdist2_dr = -icdist2*icdist2*(k[5] + 2.0*k[6]*r2 + 3.0*k[7]*r4)*dr2dr;
                    float da1dr = 2.0*(x*dydr + y*dxdr);
                    float dmxdr = (dxdr*cdist*icdist2 + x*dcdist_dr*icdist2 + x*cdist*dicdist2_dr +
                                       k[2]*da1dr + k[3]*(dr2dr + 4.0*x*dxdr) + (k[8] + 2.0*r2*k[9])*dr2dr);
                    float dmydr = (dydr*cdist*icdist2 + y*dcdist_dr*icdist2 + y*cdist*dicdist2_dr +
                                       k[2]*(dr2dr + 4.0*y*dydr) + k[3]*da1dr + (k[10] + 2.0*r2*k[11])*dr2dr);
                    
					/*
					int offs = int(outValue[99])*6;
					outValue[0+offs] = dr2dr;
					outValue[1+offs] = dcdist_dr;
					outValue[2+offs] = dicdist2_dr;
					outValue[3+offs] = da1dr;
					outValue[4+offs] = dmxdr;
					outValue[5+offs] = dmydr;
					outValue[99] += 1.0;
					*/

					vec2 dXdYd = dMatTilt * vec2(dmxdr, dmydr);
					/*
					int offs = int(outValue[99])*2;
					outValue[0+offs] = dXdYd[0];
					outValue[1+offs] = dXdYd[1];
					outValue[99] += 1.0;
					*/
                    dpdr.data[dpdr_i+j] = fx*dXdYd[0];
                    dpdr.data[dpdr_i+dpdr_step+j] = fy*dXdYd[1];
				}
                dpdr_i += dpdr_step*2;
			}
		}
	}

    //testOutValue(dpdr);
    //testOutValue(dpdt);
    //testOutValue(imagePoints);
}

void cvProjectPoints2(
	in Mat12 objectPoints, in vec3 r_vec, in vec3 t_vec, in mat3 cameraMatrix,
	inout Mat8 imagePoints, inout Mat24 dpdr, inout Mat24 dpdt, in float aspectRatio)
{
	cvProjectPoints2(objectPoints, r_vec, t_vec, cameraMatrix,
		imagePoints, dpdr, true, dpdt, true, 0.0);
}

void cvProjectPoints2(
	in Mat12 objectPoints, in vec3 r_vec, in vec3 t_vec, in mat3 cameraMatrix,
	inout Mat8 imagePoints, in float aspectRatio)
{
	Mat24 empty = emptyMat8x3();
	cvProjectPoints2(objectPoints, r_vec, t_vec, cameraMatrix,
		imagePoints, empty, false, empty, false, 0.0);
}

void SVBkSb(
	int m, int n, float[6] w, int wstep,
	Mat36 u, int ldu, bool uT, Mat36 v, int ldv, bool vT,
	float[6] b, int ldb, int nb, out float[6] x, int ldx)
{
	int i, j;
    int incw = 1;
	// Assume: wstep = 0
    float eps = FLT_EPSILON * 2.0;
    float threshold = 0.0;
	// Assume: uT = true
    int udelta0 = ldu;
    int udelta1 = 1;
	// Assume: vT = true
    int vdelta0 = ldv;
	int vdelta1 = 1;
    // Assume: nb = 1
	// Assume: m = 6, n = 6
    int nm = min(m, n);
	
    x = EmptyArr6;

    for (i = 0; i < nm; i++) {
        threshold += w[i*incw];
	}
    threshold *= eps;

    int udeltax = 0;
    int vdeltax = 0;
    for (i = 0; i < nm; i++) {
        float wi = w[i*incw];
        if (abs(wi) <= eps) {
			continue;
		}
        wi = 1.0 / wi;

		// Assume: nb = 1
		float s = 0.0;
		// Assume: b is not None
		for (j = 0; j < m; j++) {
			s += u.data[udeltax + j * udelta1] * b[j * ldb];
		}
		s *= wi;

		for (j = 0; j < n; j++) {
			x[j * ldx] += s * v.data[vdeltax + j * vdelta1];
		}
                
        udeltax += udelta0;
        vdeltax += vdelta0;
	}
}

vec3 cvGEMM(mat3 A, vec3 B, int alpha, int flags)
{
    // Solves matrix multiplication
    A *= alpha;
    if (flags == 1) {
        A = transpose(A);
	}
	// Skip flags == 2, vec3 doesn't need transpose for glsl matmul
    return A * B;
}

float[6] cvGEMM(Mat48 A, Mat8 B, int alpha, int flags)
{
    // Solves matrix multiplication
	// Set: B
	reshape(B, 1, 8);
	// Assume: alpha = 1
    if (flags == 1) {
        A = mattranspose(A);
	}
    return matmul(A, B);
}

void completeSymm(out Mat81 m, in bool LtoR)
{
	// Completes a symmetric matrix
	int i, j;
    int rows = m.rows;
    int j0 = 0;
    int j1 = rows;

    for (i = 0; i < rows; i++) {
        if (!LtoR) {
            j1 = i;
		} else {
            j0 = i+1;
		}
        for (j = j0; j < j1; j++) {
            m.data[idx(m,i,j)] = m.data[idx(m,j,i)];
		}
	}
}

void rotate(out Mat81 src, int v1, int v2, float s, float c)
{
    float a0 = src.data[v1];
    float b0 = src.data[v2];
    src.data[v1] = a0*c - b0*s;
    src.data[v2] = a0*s + b0*c;
}

void Jacobi(in Mat81 A, out Mat9 W, out Mat81 V)
{
	int i, j, k, l, m;
	float mv, val;
	int n = A.rows;
	float eps = FLT_EPSILON;
    int astep = A.rows;
    int vstep = V.rows;
	// Assume: V is not None
	// Set identity diagonal
	for (i = 0; i < n; i++) {
		for (j = 0; j < n; j++) {
			V.data[i*vstep + j] = 0.0;
		}
		V.data[i*vstep + i] = 1.0;
	}
    //testOutValue(V);
	int iters;
    int maxIters = n*n*30;
    int[9] indR = int[](0,0,0,0,0,0,0,0,0);
    int[9] indC = int[](0,0,0,0,0,0,0,0,0);
    for (k = 0; k < n; k++) {
        W.data[k] = A.data[(astep+1)*k];
        if (k < n-1) {
            m = k+1;
            mv = abs(A.data[astep*k + m]);
            for (i = k+2; i < n; i++) {
                val = abs(A.data[astep*k+i]);
                if (mv < val) {
                    mv = val;
                    m = i;
				}
			}
            indR[k] = m;
		}
        if (k > 0) {
            m = 0;
            mv = abs(A.data[k]);
            for (i = 1; i < k; i++) {
                val = abs(A.data[astep*i+k]);
                if (mv < val) {
                    mv = val;
                    m = i;
				}
			}
            indC[k] = m;
		}
	}
    if (n > 1) {
        for (iters = 0; iters < maxIters; iters++) {
            k = 0;
            mv = abs(A.data[indR[0]]);
            for (i = 1; i < n-1; i++) {
                val = abs(A.data[astep*i+indR[i]]);
                if (mv < val) {
                    mv = val;
                    k = i;
				}
			}
            l = indR[k];
            for (i = 1; i < n; i++) {
                val = abs(A.data[astep*indC[i] + i]);
                if (mv < val) {
                    mv = val;
                    k = indC[i];
                    l = i;
				}
			}

            float p = A.data[astep*k + l];
            if (abs(p) <= eps) {
                break;
			}
            float y = (W.data[l] - W.data[k])*0.5;
            float t = abs(y) + hypot(p, y);
            
            float s = hypot(p, t);
            float c = t/s;
            s = p/s;
            t = (p/t)*p;
            if (y < 0) {
                s = -s;
                t = -t;
			}
            A.data[astep*k + l] = 0.0;

            W.data[k] -= t;
            W.data[l] += t;
            
            for (i = 0; i < k; i++) {
				rotate(A, astep*i+k, astep*i+l, s, c);
			}
            for (i = k+1; i < l; i++) {
				rotate(A, astep*k+i, astep*i+l, s, c);
			}
            for (i = l+1; i < n; i++) {
				rotate(A, astep*k+i, astep*l+i, s, c);
			}

			// Assume: V is not None
			for (i = 0; i < n; i++) {
				rotate(V, vstep*k+i, vstep*l+i, s, c);
			}

            for (j = 0; j < 2; j++) {
                int index = 0;
                if (j == 0) {
                    index = k;
				} else {
                    index = l;
				}
                if (index < n - 1) {
                    m = index+1;
                    mv = abs(A.data[astep*index + m]);
					for (i = index+2; i < n; i++) {
                        val = abs(A.data[astep*index+i]);
                        if (mv < val) {
                            mv = val;
                            m = i;
						}
					}
                    indR[index] = m;
				}
                if (index > 0) {
                    m = 0;
                    mv = abs(A.data[index]);
					for (i = 1; i < index; i++) {
                        val = abs(A.data[astep*i+index]);
                        if (mv < val) {
                            mv = val;
                            m = i;
						}
					}
                    indC[index] = m;
				}
			}
		}
	}

    for (k = 0; k < n-1; k++) {
        m = k;
        for (i = k+1; i < n; i++) {
            if (W.data[m] < W.data[i]) {
                m = i;
			}
		}
        if (k != m) {
            float temp = W.data[k];
            W.data[k] = W.data[m];
            W.data[m] = temp;
			// Assume: V is not None
			for (i = 0; i < n; i++) {
				temp = V.data[vstep*k + i];
				V.data[vstep*k + i] = V.data[vstep*m + i];
				V.data[vstep*m + i] = temp;
			}
		}
	}
}

// HomographyEstimatorCallback -> runKernel()
bool runKernel(in Mat8 M, in Mat8 m, out mat3 H0)
{
	int i, j, k;
    int count = checkVector(M, 2);

    Mat81 LtL = emptyMat9x9();
    Mat9 matW = emptyMat9x1();
    Mat81 matV = emptyMat9x9();
    vec2 cM = vec2(0.0);
    vec2 cm = vec2(0.0);
    vec2 sM = vec2(0.0);
    vec2 sm = vec2(0.0);

    for (i = 0; i < count; i++) {
        cm[0] += m.data[idx(m,i,0,0)];
        cm[1] += m.data[idx(m,i,0,1)];
        cM[0] += M.data[idx(M,i,0,0)];
        cM[1] += M.data[idx(M,i,0,1)];
	}

    cm[0] /= count;
    cm[1] /= count;
    cM[0] /= count;
    cM[1] /= count;

    for (i = 0; i < count; i++) {
        sm[0] += abs(m.data[idx(m,i,0,0)] - cm[0]);
        sm[1] += abs(m.data[idx(m,i,0,1)] - cm[1]);
        sM[0] += abs(M.data[idx(M,i,0,0)] - cM[0]);
        sM[1] += abs(M.data[idx(M,i,0,1)] - cM[1]);
	}

    if (abs(sm[0]) < FLT_EPSILON || abs(sm[1]) < FLT_EPSILON ||
		abs(sM[0]) < FLT_EPSILON || abs(sM[1]) < FLT_EPSILON) {
        H0 = mat3(0.0);
		return false;
	}
    
    sm[0] = count / sm[0];
    sm[1] = count / sm[1];
    sM[0] = count / sM[0];
    sM[1] = count / sM[1];

    mat3 invHnorm = mat3(
		1/sm[0], 0, cm[0],
		0, 1/sm[1], cm[1],
		0, 0, 1
	);
    mat3 Hnorm2 = mat3(
		sM[0], 0, -cM[0]*sM[0],
		0, sM[1], -cM[1]*sM[1],
		0, 0, 1
	);

    for (i = 0; i < count; i++) {
        float x = (m.data[idx(m,i,0,0)] - cm[0])*sm[0];
        float y = (m.data[idx(m,i,0,1)] - cm[1])*sm[1];
        float X = (M.data[idx(m,i,0,0)] - cM[0])*sM[0];
        float Y = (M.data[idx(m,i,0,1)] - cM[1])*sM[1];
        float[9] Lx = float[9](
			X, Y, 1,
			0, 0, 0,
			-x*X, -x*Y, -x
		);
        float[9] Ly = float[9](
			0, 0, 0,
			X, Y, 1,
			-y*X, -y*Y, -y
		);
    	for (j = 0; j < 9; j++) {
			for (k = j; k < 9; k++) {
                LtL.data[idx(LtL,j,k)] += Lx[j]*Lx[k] + Ly[j]*Ly[k];
			}
		}
	}
    // Set: LtL
	completeSymm(LtL, false);
    //testOutValue(LtL);
    
    // Unused: matW
	// Set: matW, matV
    Jacobi(LtL, matW, matV);
	//testOutValue(matW);
    //testOutValue(matV);
    
    H0 = mat3(
		matV.data[idx(matV,8,0)], matV.data[idx(matV,8,1)], matV.data[idx(matV,8,2)],
		matV.data[idx(matV,8,3)], matV.data[idx(matV,8,4)], matV.data[idx(matV,8,5)],
		matV.data[idx(matV,8,6)], matV.data[idx(matV,8,7)], matV.data[idx(matV,8,8)]
	);

    mat3 Htemp = matmul(invHnorm, H0);
    //testOutValue(Htemp);
    H0 = matmul(Htemp, Hnorm2);
    //testOutValue(H0);

    // Normalize
    H0 *= (1.0/H0[2][2]);
	return true;
}

void cvFindHomography(in Mat8 points1, in Mat8 points2, out mat3 H)
{
	bool result = false;
    int npoints = -1;
	Mat8 p;
    Mat8 src = emptyMat1x4x2();
    Mat8 dst = emptyMat1x4x2();

    for (int i = 1; i <= 2; i++) {
        if (i == 1) {
            p = points1;
		} else {
            p = points2;
		}
        npoints = checkVector(p, 2);
		// Set: p
        reshape(p, 2, npoints);
        if (i == 1) {
            src = p;
		} else {
            dst = p;
		}
	}

    // Only method 0 and npoints 4 is used
	// Hardcoded: method == 0, npoints == 4
	// Set: H
	bool HSet = runKernel(src, dst, H);
	if (!HSet) {
		result = true;
	}

	/*
	// Unused
	// For more than 4 object and image points
    if result and npoints > 4:
        print("RE")
	*/
}

void solve(in Mat36 src, in float[6] src2, out float[6] dst, in int method)
{
	// Assume: m = 6, n = 6, m == n
    int m = src.rows;
    int n = src.cols;
    int nb = 1; // src2.cols
    int vstep = n;
    int ustep = m;

	// Assume: method == DECOMP_SVD
	Mat36 u = mattranspose(src);
	Mat36 v = emptyMat6x6();
	float[6] w = EmptyArr6;

	// Set: w, u, v
	JacobiSVD(u, ustep, w, v, vstep, m, n, -1);

	int src2step = nb;
	int dststep = nb;
	// Set: dst
	SVBkSb(m, n, w, 0, u, ustep, true, v, vstep, true, src2, src2step, nb, dst, dststep);
}

float[6] diag(Mat36 array)
{
    float[6] diag = EmptyArr6;
    for (int i = 0; i < array.rows; i++) {
        diag[i] = array.data[idx(array,i,i)];
	}
    return diag;
}

void fill_diagonal(Mat36 array, float[6] diag)
{
    for (int i = 0; i < diag.length(); i++) {
        array.data[idx(array,i,i)] = diag[i];
	}
}

// CvLevMarq
struct cvTermCriteria
{
	int type;
	int max_iter;
	float epsilon;
};

struct CvLevMarq
{
	float[6] mask;
	float[6] prevParam;
	float[6] param;
	Mat48 J;
	Mat8 err;
	Mat36 JtJ;
	Mat36 JtJN;
	float[6] JtErr;
	float[6] JtJV;
	float[6] JtJW;
	float prevErrNorm;
	float errNorm;
	float lambdaLg10;
	cvTermCriteria criteria;
	int state;
	int iters;
	bool completeSymmFlag;
	int solveMethod;
};

// Global: lm
CvLevMarq lm;

void newCvLevMarq()
{
	lm.mask = EmptyArr6;
	lm.prevParam = EmptyArr6;
	lm.param = EmptyArr6;
	lm.J = emptyMat8x6();
	lm.err = emptyMat4x1x2();
	lm.JtJ = emptyMat6x6();
	lm.JtJN = emptyMat6x6();
	lm.JtErr = EmptyArr6;
	lm.JtJV = EmptyArr6;
	lm.JtJW = EmptyArr6;
	lm.prevErrNorm = FLT_MAX;
	lm.errNorm = FLT_MAX;
	lm.lambdaLg10 = 0.0;
	lm.criteria = cvTermCriteria(0,0,0.0);
	lm.state = DONE;
	lm.iters = 0;
	lm.completeSymmFlag = false;
	lm.solveMethod = DECOMP_SVD;
}

void CvLevMarq_init(int nparams, int nerrs, cvTermCriteria criteria0, bool _completeSymmFlag)
{
	// Assume: nparams = 6, nerrs = 8
    
   	int errcheck = 0;
	// Assume: err is None, param is None
	lm.mask = float[6](1.0,1.0,1.0,1.0,1.0,1.0);
    lm.lambdaLg10 = -3.0;
    lm.criteria = criteria0;
    
	// Assume: criteria["type"] & CV_TERMCRIT_ITER = true
	// Assume: criteria["type"] & CV_TERMCRIT_EPS = true
    lm.criteria.max_iter = min(max(lm.criteria.max_iter,1),1000);
    lm.criteria.epsilon = max(lm.criteria.epsilon, 0.0);
    lm.state = STARTED;
    lm.completeSymmFlag = _completeSymmFlag;
	
	// Assume: All other values already initialized
}

void CvLevMarq_step() {
    float LOG10 = log(10.0);
    float _lambda = exp(lm.lambdaLg10*LOG10);
    // Assume: nparams = 6
    int nparams = 6;

    float[6] _mask = lm.mask;

	// Assume: lm.mask -> float[6](1.0,1.0,1.0,1.0,1.0,1.0)
	// Assume: nparams_nz = 6
    int nparams_nz = 6;
	
	// Assume: JtJN, JtJV, JtJW are empty
    float[6] nonzero_param = lm.JtJW;

    float[6] _JtErr = lm.JtErr;
    Mat36 _JtJN = lm.JtJ;
    
	// Assume: err is never None

    // Scale diag by (1 + lambda)
    float[6] _JtJNdiag = matmul(diag(_JtJN), 1.0 + _lambda);
    // Set: _JtJN
	fill_diagonal(_JtJN, _JtJNdiag);

    // Set: nonzero_param
	solve(_JtJN, _JtErr, nonzero_param, lm.solveMethod);
    //testOutValue(nonzero_param);
	//testOutValue(_JtJN);
	//testOutValue(_JtErr);
    for (int i = 0; i < nparams; i++) {
		// Assume: mask[i] = true
		// Assume: j = i, as j always increments due to mask[i]
        lm.param[i] = lm.prevParam[i] - nonzero_param[i];
	}
	//testOutValue(lm.param);
}

bool CvLevMarq_update(
	out float[6] _param, out Mat48 matJ, out Mat8 _err,
	out bool matJNone, out bool errNone)
{
	matJNone = true;
	errNone = true;

	// Assume: matJ and _err already reset
	if (lm.state == DONE) {
		_param = lm.param;
		return false;
	}

	if (lm.state == STARTED) {
		_param = lm.param;
		lm.J = emptyMat8x6();
		lm.err = emptyMat4x1x2();
		// Assume: matJ is empty
		// Assume: _err is empty
		matJNone = false;
		errNone = false;
		lm.state = CALC_J;
		return true;
	}

	if (lm.state == CALC_J) {
		//testOutValue(lm.J);
		lm.JtJ = cvMulTransposed(lm.J, 1);
		lm.JtErr = cvGEMM(lm.J, lm.err, 1, CV_GEMM_A_T);
		//testOutValue(lm.err);
		//testOutValue(lm.JtErr);
		lm.prevParam = lm.param;
		CvLevMarq_step();
		if (lm.iters == 0) {
			lm.prevErrNorm = norm(lm.err);
		}
		_param = lm.param;
		//testOutValue(_param);
		lm.err = emptyMat4x1x2();
		// Assume: _err is empty
		errNone = false;
		lm.state = CHECK_ERR;
		return true;
	}

	if (lm.state == CHECK_ERR) {
        lm.errNorm = norm(lm.err);
        if (lm.errNorm > lm.prevErrNorm) {
            lm.lambdaLg10 += 1.0;
            if (lm.lambdaLg10 <= 16) {
                CvLevMarq_step();
                _param = lm.param;
                lm.err = emptyMat4x1x2();
                // Assume: _err is empty
				errNone = false;
                lm.state = CHECK_ERR;
                return true;
			}
		}

        lm.lambdaLg10 = max(lm.lambdaLg10-1.0, -16.0);
        lm.iters += 1;
		
        if (lm.iters >= lm.criteria.max_iter || norm(matsub(lm.prevParam,lm.param)) < lm.criteria.epsilon) {
            _param = lm.param;
            lm.state = DONE;
            return true;
		}

        lm.prevErrNorm = lm.errNorm;
        _param = lm.param;
		lm.J = emptyMat8x6();
        // Assume: matJ is empty
		matJNone = false;
        _err = lm.err;
		errNone = false;
        lm.state = CALC_J;
        return true;
	}
	return false;
}

void cvFindExtrinsicCameraParams2(
	in Mat12 objectPoints, in Mat8 imagePoints, in mat3 cameraMatrix,
	out vec3 tvec, out vec3 rvec)
{
	vec3 r, t;
	int max_iter = 20;

	int i, count;
	//int count = max(objectPoints.cols, imagePoints.rows);
	//hardcoded: count = 4
	count = 4;
	Mat12 matM = objectPoints;
	Mat8 _m = imagePoints;

	Mat8 Mxy = emptyMat1x4x2();
	// Undistort points does nothing if camera matrix is identity
	Mat8 mn = cvUndistortPoints(_m, cameraMatrix, 5, 0.01);

	vec3 Mc = cvAvg(matM);
	// Set: matM
	reshape(matM, 1, 4);
	Mat9 MM = cvMulTransposed(matM, 1, Mc);
	
	float[3] W;
	Mat9 V = emptyMat3x3();
	// Set: W, MM, V
	SVDCompute(MM, W, MM, V);
	//testOutValue(matV);
	//testOutValue(matW);
	if (W[2]/W[1] < 1e-3) {
		// a planar structure case (all M's lie in the same plane)
		mat3 R_transform = convertToMat3(V);
		if (V.data[2]*V.data[2] + V.data[5]*V.data[5] < 1e-10) {
			R_transform = mat3(1.0); // identity
		}
		if (determinant(R_transform) < 0) {
			R_transform *= -1.0;
		}
		vec3 T_transform = cvGEMM(R_transform, Mc, -1, 2);
		//testOutValue(T_transform);
		for (i = 0; i < count; i++) {
			Mxy.data[idx(Mxy,0,i,0)] = 
				R_transform[0][0]*matM.data[i*3+0] + 
				R_transform[0][1]*matM.data[i*3+1] + 
				R_transform[0][2]*matM.data[i*3+2] + 
				T_transform[0];
			Mxy.data[idx(Mxy,0,i,1)] = 
				R_transform[1][0]*matM.data[i*3+0] + 
				R_transform[1][1]*matM.data[i*3+1] + 
				R_transform[1][2]*matM.data[i*3+2] + 
				T_transform[1];
		}
		mat3 matH = mat3(0.0);
		// Set: matH
		cvFindHomography(Mxy, mn, matH);
		//testOutValue(matH);

		vec3 h1 = cvGetCol(matH, 0);
		vec3 h2 = cvGetCol(matH, 1);
		vec3 h3 = cvGetCol(matH, 2);
		
		float h1_norm = sqrt(
			matH[0][0]*matH[0][0] +
			matH[1][0]*matH[1][0] +
			matH[2][0]*matH[2][0]);
		float h2_norm = sqrt(
			matH[0][1]*matH[0][1] +
			matH[1][1]*matH[1][1] +
			matH[2][1]*matH[2][1]);

		h1 *= 1.0/max(h1_norm, FLT_EPSILON);
		h2 *= 1.0/max(h2_norm, FLT_EPSILON);
		t = h3 * (2/max(h1_norm + h2_norm, FLT_EPSILON));
		h3 = cross(h1, h2);
		//testOutValue(h1);
		//testOutValue(h2);
		//testOutValue(h3);
		//testOutValue(t);

		// Set: matH
		cvStoreCol(matH, h1, 0);
		cvStoreCol(matH, h2, 1);
		cvStoreCol(matH, h3, 2);
		//testOutValue(matH);

		// Set: r
		cvRodrigues2(matH, r);
		//testOutValue(r);

		// Set: matH
		cvRodrigues2(r, matH);
		t = T_transform * matH + t;
		//testOutValue(t);
		mat3 matR = matmul(matH, R_transform);
		//testOutValue(matR);

		// Set: r
		cvRodrigues2(matR, r);
	} else {
		// non-planar structure. Use DLT method
		// Not needed currently
	}
	//testOutValue(r);
	//testOutValue(t);

	// Set: matM
	reshape(matM, 3, 1);
	// Set: mn
	reshape(mn, 2, 1);

	// Set: global -> lm
	newCvLevMarq();
	CvLevMarq_init(6, count*2, cvTermCriteria(CV_TERMCRIT_EPS+CV_TERMCRIT_ITER, max_iter, FLT_EPSILON), true);

	lm.param = float[](r.x, r.y, r.z, t.x, t.y, t.z);
	//testOutValue(lm.param);

	Mat48 matJ;
	Mat8 _err;
	float[6] _param;
	bool proceed, matJNone, errNone;
	for (int xx = 0; xx < 40; xx++) {
		matJ = emptyMat8x6();
		_err = emptyMat4x1x2();
		_param = EmptyArr6;
		// Set: _param, matJ, _err, matJNone, errNone
		proceed = CvLevMarq_update(_param, matJ, _err, matJNone, errNone);
		r = vec3(_param[0], _param[1], _param[2]);
		t = vec3(_param[3], _param[4], _param[5]);
		if (!proceed || errNone ) {
			break;
		}
		// Set: _err
		reshape(_err, 2, 1);
		//testOutValue(_err);
		if (!matJNone) {
            Mat24 dpdr = cvGetCols(matJ, 0, 3);
            Mat24 dpdt = cvGetCols(matJ, 3, 6);
			// Set: _err, dpdr, dpdt
			cvProjectPoints2(matM, r, t, cameraMatrix, _err, dpdr, dpdt, 0.0);
			// Set: matJ
            cvStoreCols(matJ, dpdr, 0, 3);
            cvStoreCols(matJ, dpdt, 3, 6);
			//testOutValue(matJ);
		} else {
			// Set: _err
			cvProjectPoints2(matM, r, t, cameraMatrix, _err, 0.0);
		}
		//testOutValue(_err);
		_err = matsub(_err, imagePoints);
		lm.err = _err;
		lm.J = matJ;
		lm.param = _param;

		/*
		if (xx==1) {
			testOutValue(lm.param);
			break;
		}
		*/
	}

	rvec = vec3(lm.param[0], lm.param[1], lm.param[2]);
	tvec = vec3(lm.param[3], lm.param[4], lm.param[5]);
	testOutValue(lm.param);
}

void solvePnP(
	in Mat12 objectPoints, in Mat8 imagePoints, in mat3 cameraMatrix,
	out vec3 tvec, out vec3 rvec)
{
	cvFindExtrinsicCameraParams2(objectPoints, imagePoints, cameraMatrix, tvec, rvec);
}

const float pi = 3.14159265359;
const float halfPi = 3.14159265359/2.0;
const float twoPi = 3.14159265359*2.0;
const float radToDeg = 180.0 / pi; 
const float degToRad = pi / 180.0;


// Get camera yaw and pitch
vec2 getCameraYawPitch(mat3 matR) {
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
	vec3 tvec;
	vec3 rvec;
	solvePnP(testObjectPoints, testImagePoints, cameraMatrix, tvec, rvec); // out -> tvec, rvec

	//testOutValue(testObjectPoints);
	//testOutValue(rvec);
	//testOutValue(tvec);

	mat3 R = mat3(0.0);
	cvRodrigues2(rvec, R);
	vec3 translation = getCameraTranslation(R, tvec);
	vec2 rotation = getCameraYawPitch(R) * 180.0/pi;

	//testOutValue(rotation);
	//testOutValue(translation);
}