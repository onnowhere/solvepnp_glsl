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

struct Mat6 { int rows; int cols; int cns; float[6] data; };
#define EmptyArr6			float[](0,0,0,0,0,0)
#define newMat2x3(data) 	Mat6(2,3,1,data)
#define emptyMat2x3() 	    newMat2x3(EmptyArr6)
struct Mat8 { int rows; int cols; int cns; float[8] data; };
#define EmptyArr8 			float[](0,0,0,0,0,0,0,0)
#define newMat4x1x2(data) 	Mat8(4,1,2,data)
#define emptyMat4x1x2() 	newMat4x1x2(EmptyArr8)
#define newMat1x4x2(data) 	Mat8(1,4,2,data)
#define emptyMat1x4x2() 	newMat1x4x2(EmptyArr8)
#define newMat4x2(data) 	Mat8(4,2,1,data)
#define emptyMat4x2() 	    newMat4x2(EmptyArr8)
#define newMat2x4(data) 	Mat8(2,4,1,data)
#define emptyMat2x4() 	    newMat2x4(EmptyArr8)
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
#define newMat4x3(data) 	Mat12(4,3,1,data)
#define emptyMat4x3() 		newMat4x3(EmptyArr12)
struct Mat24 { int rows; int cols; int cns; float[24] data; };
#define EmptyArr24			float[](0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
#define newMat8x3(data) 	Mat24(8,3,1,data)
#define emptyMat8x3() 		newMat8x3(EmptyArr24)
struct Mat27 { int rows; int cols; int cns; float[27] data; };
#define EmptyArr27			float[](0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
#define newMat3x9(data) 	Mat27(3,9,1,data)
#define emptyMat3x9() 		newMat3x9(EmptyArr27)

Mat12 testObjectPoints = newMat4x1x3(float[](
	0.0, 0.0, 0.0,
	1.0, 0.0, 0.0,
	1.0, 1.0, 0.0,
	0.0, 1.0, 0.0
));

Mat8 testImagePoints = newMat4x1x2(float[](
	659.0, 455.0,
    463.0, 445.0,
    500.0, 348.0,
    641.0, 353.0
));

/*
mat3 testObjectPoints = mat3(
	0.0, 0.0, 0.0,
	1.0, 0.0, 0.0,
	1.0, 1.0, 0.0
);

vec3 testObjectPoint4 = vec3(
	0.0, 1.0, 0.0
);
*/

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
mat3 testImagePoints = mat3(
	659.0, 455.0, 1.0,
    463.0, 445.0, 1.0,
    500.0, 348.0, 1.0
);

vec2 testImagePoint4 = vec2(
    641.0, 353.0
);
*/


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
    int size = 2;
    for (int i = 0; i < size; i++) {
        outValue[i] = src[i];
    }
}

void testOutValue(vec3 src)
{
	initOutValue();
    int size = 3;
    for (int i = 0; i < size; i++) {
        outValue[i] = src[i];
    }
}

void testOutValue(vec4 src)
{
	initOutValue();
    int size = 4;
    for (int i = 0; i < size; i++) {
        outValue[i] = src[i];
    }
}

void testOutValue(mat2 src)
{
	initOutValue();
    int size = 2;
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            outValue[i*2+j] = src[i][j];
        }
    }
}

void testOutValue(mat3 src)
{
	initOutValue();
    int size = 3;
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            outValue[i*3+j] = src[i][j];
        }
    }
}

void testOutValue(mat4 src)
{
	initOutValue();
    int size = 4;
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            outValue[i*4+j] = src[i][j];
        }
    }
}

void testOutValue(Mat6 src) {
	initOutValue();
	for (int i = 0; i < src.data.length(); i++) { outValue[i] = src.data[i]; }}
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

// Get matrix index
int idx(Mat6 mat, int row, int col, int cn) {
	return row * mat.cols * mat.cns + col * mat.cns + cn; }
int idx(Mat6 mat, int row, int col) {
	return idx(mat, row, col, 0); }
    
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

int idx(Mat24 mat, int row, int col, int cn) {
	return row * mat.cols * mat.cns + col * mat.cns + cn; }
int idx(Mat24 mat, int row, int col) {
	return idx(mat, row, col, 0); }

int idx(Mat27 mat, int row, int col, int cn) {
	return row * mat.cols * mat.cns + col * mat.cns + cn; }
int idx(Mat27 mat, int row, int col) {
	return idx(mat, row, col, 0); }

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

void swap(inout float[6] a, in int i, inout float[6] b, in int j)
{
	float a_temp = a[i];
	a[i] = b[j];
	b[j] = a_temp;
}

Mat9 convertToMat9(mat3 mat)
{
	return newMat3x3(float[](
		mat[0][0], mat[0][1], mat[0][2], 
		mat[1][0], mat[1][1], mat[1][2], 
		mat[2][0], mat[2][1], mat[2][2]
	));
}

mat3 convertToMat3(Mat6 mat)
{
	return mat3(
		mat.data[0], mat.data[1], mat.data[2],
		mat.data[3], mat.data[4], mat.data[5],
        0.0, 0.0, 0.0
	);
}

mat3 convertToMat3(Mat9 mat)
{
	return mat3(
		mat.data[0], mat.data[1], mat.data[2],
		mat.data[3], mat.data[4], mat.data[5],
		mat.data[6], mat.data[7], mat.data[8]
	);
}

Mat8 mattranspose(Mat8 src)
{
	Mat8 mat = src;
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

Mat24 mattranspose(Mat24 src)
{
	Mat24 mat = src;
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

mat4 matmul(mat4 a, mat4 b)
{
	return transpose(transpose(a) * transpose(b));
}

Mat12 matmul(Mat8 a, Mat6 b)
{
	Mat12 mat = emptyMat4x3();
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

mat2 matmul(Mat8 a, Mat8 b)
{
	mat2 mat = mat2(0.0);
	for (int i = 0; i < 2; i++) {
		for (int j = 0; j < 2; j++) {
			float value = 0;
			for (int k = 0; k < a.cols; k++) {
				value += a.data[idx(a,i,k)] * b.data[idx(b,k,j)];
			}
			mat[i][j] = value;
		}
	}
	return mat;
}

Mat8 matmul(mat2 a, Mat8 b)
{
	Mat8 mat = emptyMat2x4();
	for (int i = 0; i < mat.rows; i++) {
		for (int j = 0; j < mat.cols; j++) {
			float value = 0;
			for (int k = 0; k < 2; k++) {
				value += a[i][k] * b.data[idx(b,k,j)];
			}
			mat.data[idx(mat,i,j)] = value;
		}
	}
	return mat;
}

Mat6 matmul(Mat8 a, Mat12 b)
{
	Mat6 mat = emptyMat2x3();
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

Mat9 matmul(Mat24 a, Mat24 b)
{
	Mat9 mat = emptyMat3x3();
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
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

float[6] matmul(float[6] a, float b)
{
	float[6] mat = a;
	for (int i = 0; i < mat.length(); i++) {
		mat[i] *= b;
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

void cvRodrigues2(
	inout vec3 rvec, inout mat3 rmat, inout Mat27 matJ,
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
                Mat12 domegadvar2 = newMat4x3(float[](
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

void cvRodrigues2(in vec3 src, inout mat3 dst, inout Mat27 matJ)
{
	cvRodrigues2(src, dst, matJ, true, true);
}

void cvRodrigues2(in mat3 src, inout vec3 dst)
{
	Mat27 matJ = emptyMat3x9();
	cvRodrigues2(dst, src, matJ, false, false);
}

void cvRodrigues2(in vec3 src, inout mat3 dst)
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

void rotate(inout Mat9 src, int v1, int v2, float s, float c)
{
    float a0 = src.data[v1];
    float b0 = src.data[v2];
    src.data[v1] = a0*c - b0*s;
    src.data[v2] = a0*s + b0*c;
}

void Jacobi(in Mat9 A, inout vec3 W, inout Mat9 V)
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
        W[k] = A.data[(astep+1)*k];
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
            float y = (W[l] - W[k])*0.5;
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

            W[k] -= t;
            W[l] += t;
            
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
            if (W[m] < W[i]) {
                m = i;
			}
		}
        if (k != m) {
            float temp = W[k];
            W[k] = W[m];
            W[m] = temp;
			// Assume: V is not None
			for (i = 0; i < n; i++) {
				temp = V.data[vstep*k + i];
				V.data[vstep*k + i] = V.data[vstep*m + i];
				V.data[vstep*m + i] = temp;
			}
		}
	}
}








void normalizeDataIsotropic(in Mat8 Data, inout Mat8 DataN, inout mat3 T, inout mat3 Ti)
{
	int numPoints = 4;
    float xm = 0.0;
    float ym = 0.0;
    for (int i = 0; i < 4; i++)
    {
		xm = xm + Data.data[idx(Data,i,0,0)];
		ym = ym + Data.data[idx(Data,i,0,1)];
    }
    xm = xm / numPoints;
    ym = ym / numPoints;

    float kappa = 0.0;
    float xh = 0.0;
	float yh = 0.0;

    for (int i = 0; i < numPoints; i++)
    {
		xh = Data.data[idx(Data,i,0,0)] - xm;
		yh = Data.data[idx(Data,i,0,1)] - ym;

        DataN.data[idx(DataN,0,i)] = xh;
        DataN.data[idx(DataN,1,i)] = yh;
        kappa = kappa + xh * xh + yh * yh;
    }
    float beta = sqrt(2.0 * numPoints / kappa);
    DataN = matmul(DataN, beta);

    T[0][0] = 1.0 / beta;
    T[1][1] = 1.0 / beta;

    T[0][2] = xm;
    T[1][2] = ym;

    T[2][2] = 1.0;

    Ti[0][0] = beta;
    Ti[1][1] = beta;

    Ti[0][2] = -beta * xm;
    Ti[1][2] = -beta * ym;

    Ti[2][2] = 1.0;
}

void homographyHO(in Mat8 srcPoints, in Mat8 targPoints, inout mat3 H)
{
	Mat8 DataA = emptyMat2x4();
	Mat8 DataB = emptyMat2x4();
	mat3 TA = mat3(0.0);
	mat3 TAi = mat3(0.0);
	mat3 TB = mat3(0.0);
	mat3 TBi = mat3(0.0);

    normalizeDataIsotropic(srcPoints, DataA, TA, TAi);
    normalizeDataIsotropic(targPoints, DataB, TB, TBi);
    
	//testOutValue(DataB);

    int n = 4;

	vec4 C1 = vec4(0.0);
	vec4 C2 = vec4(0.0);
	vec4 C3 = vec4(0.0);
	vec4 C4 = vec4(0.0);

    float mC1 = 0.0;
	float mC2 = 0.0;
	float mC3 = 0.0;
	float mC4 = 0.0;

    for (int i = 0; i < n; i++)
    {
        C1[i] = -DataB.data[idx(DataB,0,i)] * DataA.data[idx(DataA,0,i)];
        C2[i] = -DataB.data[idx(DataB,0,i)] * DataA.data[idx(DataA,1,i)];
        C3[i] = -DataB.data[idx(DataB,1,i)] * DataA.data[idx(DataA,0,i)];
        C4[i] = -DataB.data[idx(DataB,1,i)] * DataA.data[idx(DataA,1,i)];

        mC1 += C1[i];
        mC2 += C2[i];
        mC3 += C3[i];
        mC4 += C4[i];
    }

	//testOutValue(C1);

    mC1 /= n;
    mC2 /= n;
    mC3 /= n;
    mC4 /= n;

	Mat12 Mx = emptyMat4x3();
	Mat12 My = emptyMat4x3();

    for (int i = 0; i < n; i++)
    {
        Mx.data[idx(Mx,i,0)] = C1[i] - mC1;
        Mx.data[idx(Mx,i,1)] = C2[i] - mC2;
        Mx.data[idx(Mx,i,2)] = -DataB.data[idx(DataB,0,i)];

        My.data[idx(My,i,0)] = C3[i] - mC3;
        My.data[idx(My,i,1)] = C4[i] - mC4;
        My.data[idx(My,i,2)] = -DataB.data[idx(DataB,1,i)];
    }

	//testOutValue(Mx);

	Mat8 DataAT = mattranspose(DataA);
	mat2 DataADataAT = matmul(DataA, DataAT);

    //testOutValue(DataADataAT);

    float dt = DataADataAT[0][0] * DataADataAT[1][1] - DataADataAT[0][1] * DataADataAT[1][0];

    //testOutValue(dt);

    mat2 DataADataATi = mat2(0.0);
    DataADataATi[0][0] = DataADataAT[1][1] / dt;
    DataADataATi[0][1] = -DataADataAT[0][1] / dt;
    DataADataATi[1][0] = -DataADataAT[1][0] / dt;
    DataADataATi[1][1] = DataADataAT[0][0] / dt;

    //testOutValue(DataADataATi);

    Mat8 Pp = matmul(DataADataATi, DataA);

    //testOutValue(Pp);

    Mat6 Bx = matmul(Pp, Mx);
    Mat6 By = matmul(Pp, My);

    //testOutValue(Bx);

    Mat12 Ex = matmul(DataAT, Bx);
    Mat12 Ey = matmul(DataAT, By);
    
    //testOutValue(Ey);

    Mat24 D = emptyMat8x3();

    for (int i = 0; i < n; i++)
    {
        D.data[idx(D,i,0)] = Mx.data[idx(Mx,i,0)] - Ex.data[idx(Ex,i,0)];
        D.data[idx(D,i,1)] = Mx.data[idx(Mx,i,1)] - Ex.data[idx(Ex,i,1)];
        D.data[idx(D,i,2)] = Mx.data[idx(Mx,i,2)] - Ex.data[idx(Ex,i,2)];

        D.data[idx(D,i+n,0)] = My.data[idx(My,i,0)] - Ey.data[idx(Ey,i,0)];
        D.data[idx(D,i+n,1)] = My.data[idx(My,i,1)] - Ey.data[idx(Ey,i,1)];
        D.data[idx(D,i+n,2)] = My.data[idx(My,i,2)] - Ey.data[idx(Ey,i,2)];
    }

    //testOutValue(D);

    Mat24 DT = mattranspose(D);
    Mat9 DDT = matmul(DT, D);

    //testOutValue(DDT);

    vec3 S = vec3(0.0);
    Mat9 _U = emptyMat3x3();
    Jacobi(DDT, S, _U);
    mat3 U = convertToMat3(_U);

    //testOutValue(U);

    vec3 h789 = vec3(0.0);
    h789.x = U[2][0];
    h789.y = U[2][1];
    h789.z = U[2][2];

    vec2 h12 = (-transpose(convertToMat3(Bx)) * h789).xy;
    vec2 h45 = (-transpose(convertToMat3(By)) * h789).xy;
    //testOutValue(h12);
    //testOutValue(h45);

    float h3 = -(mC1 * h789.x + mC2 * h789.y);
    float h6 = -(mC3 * h789.x + mC4 * h789.y);

    H[0][0] = h12.x;
    H[0][1] = h12.y;
    H[0][2] = h3;

    H[1][0] = h45.x;
    H[1][1] = h45.y;
    H[1][2] = h6;

    H[2][0] = h789.x;
    H[2][1] = h789.y;
    H[2][2] = h789.z;

    H = matmul(matmul(TB, H), TAi);
    float h22_inv = 1.0 / H[2][2];
    H = H * h22_inv;
    //testOutValue(H);
}

void homographyFromSquarePoints(in Mat8 pts, in float halfLength, inout mat3 H)
{
    float p1x = -pts.data[idx(pts,0,0,0)];
    float p1y = -pts.data[idx(pts,0,0,1)];

    float p2x = -pts.data[idx(pts,1,0,0)];
    float p2y = -pts.data[idx(pts,1,0,1)];

    float p3x = -pts.data[idx(pts,2,0,0)];
    float p3y = -pts.data[idx(pts,2,0,1)];

    float p4x = -pts.data[idx(pts,3,0,0)];
    float p4y = -pts.data[idx(pts,3,0,1)];

    //analytic solution:
    float det = halfLength * (p1x * p2y - p2x * p1y - p1x * p4y + p2x * p3y - p3x * p2y + p4x * p1y + p3x * p4y - p4x * p3y);
    if (abs(det) < 1e-9) {
        //CV_Error(Error::StsNoConv, "Determinant is zero!");
        return;
    }
    float detsInv = -1 / det;

    H[0][0] = detsInv * (p1x * p3x * p2y - p2x * p3x * p1y - p1x * p4x * p2y + p2x * p4x * p1y - p1x * p3x * p4y + p1x * p4x * p3y + p2x * p3x * p4y - p2x * p4x * p3y);
    H[0][1] = detsInv * (p1x * p2x * p3y - p1x * p3x * p2y - p1x * p2x * p4y + p2x * p4x * p1y + p1x * p3x * p4y - p3x * p4x * p1y - p2x * p4x * p3y + p3x * p4x * p2y);
    H[0][2] = detsInv * halfLength * (p1x * p2x * p3y - p2x * p3x * p1y - p1x * p2x * p4y + p1x * p4x * p2y - p1x * p4x * p3y + p3x * p4x * p1y + p2x * p3x * p4y - p3x * p4x * p2y);
    H[1][0] = detsInv * (p1x * p2y * p3y - p2x * p1y * p3y - p1x * p2y * p4y + p2x * p1y * p4y - p3x * p1y * p4y + p4x * p1y * p3y + p3x * p2y * p4y - p4x * p2y * p3y);
    H[1][1] = detsInv * (p2x * p1y * p3y - p3x * p1y * p2y - p1x * p2y * p4y + p4x * p1y * p2y + p1x * p3y * p4y - p4x * p1y * p3y - p2x * p3y * p4y + p3x * p2y * p4y);
    H[1][2] = detsInv * halfLength * (p1x * p2y * p3y - p3x * p1y * p2y - p2x * p1y * p4y + p4x * p1y * p2y - p1x * p3y * p4y + p3x * p1y * p4y + p2x * p3y * p4y - p4x * p2y * p3y);
    H[2][0] = -detsInv * (p1x * p3y - p3x * p1y - p1x * p4y - p2x * p3y + p3x * p2y + p4x * p1y + p2x * p4y - p4x * p2y);
    H[2][1] = detsInv * (p1x * p2y - p2x * p1y - p1x * p3y + p3x * p1y + p2x * p4y - p4x * p2y - p3x * p4y + p4x * p3y);
    H[2][2] = 1.0;
}

void rotateVec2ZAxis(in vec3 a, inout mat3 Ra)
{
    float ax = a.x;
    float ay = a.y;
    float az = a.z;

    float nrm = sqrt(ax*ax + ay*ay + az*az);
    ax = ax/nrm;
    ay = ay/nrm;
    az = az/nrm;

    float c = az;

    if (abs(1.0+c) < FLT_EPSILON)
    {
        Ra = mat3(0.0);
        Ra[0][0] = 1.0;
        Ra[1][1] = 1.0;
        Ra[2][2] = -1.0;
    }
    else
    {
        float d = 1.0/(1.0+c);
        float ax2 = ax*ax;
        float ay2 = ay*ay;
        float axay = ax*ay;

        Ra[0][0] = -ax2*d + 1.0;
        Ra[0][1] = -axay*d;
        Ra[0][2] = -ax;

        Ra[1][0] = -axay*d;
        Ra[1][1] = -ay2*d + 1.0;
        Ra[1][2] = -ay;

        Ra[2][0] = ax;
        Ra[2][1] = ay;
        Ra[2][2] = 1.0 - (ax2 + ay2)*d;
    }
}

void computeRotations(
    in float j00, in float j01, in float j10, in float j11, in float p, in float q,
    inout mat3 R1, inout mat3 R2)
{
    //This is fairly optimized code which makes it hard to understand. The matlab code is certainly easier to read.
    mat3 Rv = mat3(0.0);
    vec3 v = vec3(p, q, 1.0);
    rotateVec2ZAxis(v,Rv);
    Rv = transpose(Rv);

    //testOutValue(Rv);

    //setup the 2x2 SVD decomposition:
    float rv00 = Rv[0][0];
    float rv01 = Rv[0][1];
    float rv02 = Rv[0][2];

    float rv10 = Rv[1][0];
    float rv11 = Rv[1][1];
    float rv12 = Rv[1][2];

    float rv20 = Rv[2][0];
    float rv21 = Rv[2][1];
    float rv22 = Rv[2][2];

    float b00 = rv00 - p * rv20;
    float b01 = rv01 - p * rv21;
    float b10 = rv10 - q * rv20;
    float b11 = rv11 - q * rv21;

    float dtinv = 1.0 / ((b00 * b11 - b01 * b10));

    float binv00 = dtinv * b11;
    float binv01 = -dtinv * b01;
    float binv10 = -dtinv * b10;
    float binv11 = dtinv * b00;

    float a00 = binv00 * j00 + binv01 * j10;
    float a01 = binv00 * j01 + binv01 * j11;
    float a10 = binv10 * j00 + binv11 * j10;
    float a11 = binv10 * j01 + binv11 * j11;

    //compute the largest singular value of A:
    float ata00 = a00 * a00 + a01 * a01;
    float ata01 = a00 * a10 + a01 * a11;
    float ata11 = a10 * a10 + a11 * a11;

    float gamma2 = 0.5 * (ata00 + ata11 + sqrt((ata00 - ata11) * (ata00 - ata11) + 4.0 * ata01 * ata01));
    if (gamma2 < 0) {
        //CV_Error(Error::StsNoConv, "gamma2 is negative.");
        return;
    }

    float gamma = sqrt(gamma2);

    if (abs(gamma) < FLT_EPSILON) {
        //CV_Error(Error::StsNoConv, "gamma is zero.");
        return;
    }

    //reconstruct the full rotation matrices:
    float rtilde00 = a00 / gamma;
    float rtilde01 = a01 / gamma;
    float rtilde10 = a10 / gamma;
    float rtilde11 = a11 / gamma;

    float rtilde00_2 = rtilde00 * rtilde00;
    float rtilde01_2 = rtilde01 * rtilde01;
    float rtilde10_2 = rtilde10 * rtilde10;
    float rtilde11_2 = rtilde11 * rtilde11;

    float b0 = sqrt(-rtilde00_2 - rtilde10_2 + 1);
    float b1 = sqrt(-rtilde01_2 - rtilde11_2 + 1);
    float sp = (-rtilde00 * rtilde01 - rtilde10 * rtilde11);

    if (sp < 0)
    {
        b1 = -b1;
    }

    R1[0][0] = (rtilde00)*rv00 + (rtilde10)*rv01 + (b0)*rv02;
    R1[0][1] = (rtilde01)*rv00 + (rtilde11)*rv01 + (b1)*rv02;
    R1[0][2] = (b1 * rtilde10 - b0 * rtilde11) * rv00 + (b0 * rtilde01 - b1 * rtilde00) * rv01 + (rtilde00 * rtilde11 - rtilde01 * rtilde10) * rv02;
    R1[1][0] = (rtilde00)*rv10 + (rtilde10)*rv11 + (b0)*rv12;
    R1[1][1] = (rtilde01)*rv10 + (rtilde11)*rv11 + (b1)*rv12;
    R1[1][2] = (b1 * rtilde10 - b0 * rtilde11) * rv10 + (b0 * rtilde01 - b1 * rtilde00) * rv11 + (rtilde00 * rtilde11 - rtilde01 * rtilde10) * rv12;
    R1[2][0] = (rtilde00)*rv20 + (rtilde10)*rv21 + (b0)*rv22;
    R1[2][1] = (rtilde01)*rv20 + (rtilde11)*rv21 + (b1)*rv22;
    R1[2][2] = (b1 * rtilde10 - b0 * rtilde11) * rv20 + (b0 * rtilde01 - b1 * rtilde00) * rv21 + (rtilde00 * rtilde11 - rtilde01 * rtilde10) * rv22;

    R2[0][0] = (rtilde00)*rv00 + (rtilde10)*rv01 + (-b0) * rv02;
    R2[0][1] = (rtilde01)*rv00 + (rtilde11)*rv01 + (-b1) * rv02;
    R2[0][2] = (b0 * rtilde11 - b1 * rtilde10) * rv00 + (b1 * rtilde00 - b0 * rtilde01) * rv01 + (rtilde00 * rtilde11 - rtilde01 * rtilde10) * rv02;
    R2[1][0] = (rtilde00)*rv10 + (rtilde10)*rv11 + (-b0) * rv12;
    R2[1][1] = (rtilde01)*rv10 + (rtilde11)*rv11 + (-b1) * rv12;
    R2[1][2] = (b0 * rtilde11 - b1 * rtilde10) * rv10 + (b1 * rtilde00 - b0 * rtilde01) * rv11 + (rtilde00 * rtilde11 - rtilde01 * rtilde10) * rv12;
    R2[2][0] = (rtilde00)*rv20 + (rtilde10)*rv21 + (-b0) * rv22;
    R2[2][1] = (rtilde01)*rv20 + (rtilde11)*rv21 + (-b1) * rv22;
    R2[2][2] = (b0 * rtilde11 - b1 * rtilde10) * rv20 + (b1 * rtilde00 - b0 * rtilde01) * rv21 + (rtilde00 * rtilde11 - rtilde01 * rtilde10) * rv22;
}

void computeTranslation(in Mat8 objectPoints, in Mat8 imgPoints, in mat3 R, inout vec3 t)
{
    //This is solved by building the linear system At = b, where t corresponds to the (unknown) translation.
    //This is then inverted with the associated normal equations to give t = inv(transpose(A)*A)*transpose(A)*b
    //For efficiency we only store the coefficients of (transpose(A)*A) and (transpose(A)*b)

    int n = 4;
    int cols = 2;

    //coefficients of (transpose(A)*A)
    float ATA00 = n;
    float ATA02 = 0.0;
    float ATA11 = n;
    float ATA12 = 0.0;
    float ATA20 = 0.0;
    float ATA21 = 0.0;
    float ATA22 = 0.0;

    //coefficients of (transpose(A)*b)
    float ATb0 = 0.0;
    float ATb1 = 0.0;
    float ATb2 = 0.0;

    //now loop through each point and increment the coefficients:
    for (int i = 0; i < n; i++)
    {
        vec2 objPt = vec2(objectPoints.data[i*cols], objectPoints.data[i*cols+1]);
        float rx = R[0][0] * objPt.x + R[0][1] * objPt.y;
        float ry = R[1][0] * objPt.x + R[1][1] * objPt.y;
        float rz = R[2][0] * objPt.x + R[2][1] * objPt.y;

        vec2 imgPt = vec2(imgPoints.data[i*cols], imgPoints.data[i*cols+1]);
        float a2 = -imgPt.x;
        float b2 = -imgPt.y;

        ATA02 = ATA02 + a2;
        ATA12 = ATA12 + b2;
        ATA20 = ATA20 + a2;
        ATA21 = ATA21 + b2;
        ATA22 = ATA22 + a2 * a2 + b2 * b2;

        float bx = -a2 * rz - rx;
        float by = -b2 * rz - ry;

        ATb0 = ATb0 + bx;
        ATb1 = ATb1 + by;
        ATb2 = ATb2 + a2 * bx + b2 * by;
    }

    float detAInv = 1.0 / (ATA00 * ATA11 * ATA22 - ATA00 * ATA12 * ATA21 - ATA02 * ATA11 * ATA20);

    //S gives inv(transpose(A)*A)/det(A)^2
    //construct S:
    float S00 = ATA11 * ATA22 - ATA12 * ATA21;
    float S01 = ATA02 * ATA21;
    float S02 = -ATA02 * ATA11;
    float S10 = ATA12 * ATA20;
    float S11 = ATA00 * ATA22 - ATA02 * ATA20;
    float S12 = -ATA00 * ATA12;
    float S20 = -ATA11 * ATA20;
    float S21 = -ATA00 * ATA21;
    float S22 = ATA00 * ATA11;

    //solve t:
    t[0] = detAInv * (S00 * ATb0 + S01 * ATb1 + S02 * ATb2);
    t[1] = detAInv * (S10 * ATb0 + S11 * ATb1 + S12 * ATb2);
    t[2] = detAInv * (S20 * ATb0 + S21 * ATb1 + S22 * ATb2);
}

void solveCanonicalForm(
    in Mat8 canonicalObjPoints, in Mat8 normalizedInputPoints, in mat3 H,
    inout mat4 Ma, inout mat4 Mb)
{
    //Compute the Jacobian J of the homography at (0,0):
    float j00 = H[0][0] - H[2][0] * H[0][2];
    float j01 = H[0][1] - H[2][1] * H[0][2];
    float j10 = H[1][0] - H[2][0] * H[1][2];
    float j11 = H[1][1] - H[2][1] * H[1][2];

    //Compute the transformation of (0,0) into the image:
    float v0 = H[0][2];
    float v1 = H[1][2];

    //compute the two rotation solutions:
    mat3 Ra = mat3(0.0);
    mat3 Rb = mat3(0.0);
    computeRotations(j00, j01, j10, j11, v0, v1, Ra, Rb);

    //testOutValue(Rb);

    //for each rotation solution, compute the corresponding translation solution:
    vec3 ta = vec3(0.0);
    vec3 tb = vec3(0.0);
    computeTranslation(canonicalObjPoints, normalizedInputPoints, Ra, ta);
    computeTranslation(canonicalObjPoints, normalizedInputPoints, Rb, tb);
    
    //testOutValue(ta);

    Ma = mat4(Ra);
    Ma[0][3] = ta.x;
    Ma[1][3] = ta.y;
    Ma[2][3] = ta.z;
    
    Mb = mat4(Rb);
    Mb[0][3] = tb.x;
    Mb[1][3] = tb.y;
    Mb[2][3] = tb.z;

    //testOutValue(Mb);
}

void solveGeneric(
	in Mat12 objectPoints, in Mat8 normalizedInputPoints,
	inout mat4 Ma, inout mat4 Mb)
{
    //Mat8 canonicalObjPoints;
    //mat4 MmodelPoints2Canonical;

    //transform object points to the canonical position (zero centred and on the plane z=0):
    //makeCanonicalObjectPoints(objectInputPoints, canonicalObjPoints, MmodelPoints2Canonical);

	// Hardcode objectPoints related values for now
	Mat8 canonicalObjPoints = newMat4x1x2(float[](
		-0.5, -0.5,
		0.5, -0.5,
		0.5, 0.5,
		-0.5, 0.5
	));

	mat4 MmodelPoints2Canonical = mat4(
		1.0, 0.0, 0.0, -0.5,
		0.0, 1.0, 0.0, -0.5,
		0.0, 0.0, 1.0, 0.0,
		0.0, 0.0, 0.0, 1.0
	);

    //compute the homography mapping the model's points to normalizedInputPoints
    mat3 H = mat3(0.0);
	homographyHO(canonicalObjPoints, normalizedInputPoints, H);

    //now solve
    mat4 MaCanon = mat4(0.0);
    mat4 MbCanon = mat4(0.0);
    solveCanonicalForm(canonicalObjPoints, normalizedInputPoints, H, MaCanon, MbCanon);

    //transform computed poses to account for canonical transform:
    Ma = matmul(MaCanon, MmodelPoints2Canonical);
    Mb = matmul(MbCanon, MmodelPoints2Canonical);
}

void rot2vec(in mat3 R, inout vec3 rvec)
{
    float trace = R[0][0] + R[1][1] + R[2][2];
    float w_norm = acos((trace - 1.0) / 2.0);
    float d = 1 / (2 * sin(w_norm)) * w_norm;
    if (w_norm < FLT_EPSILON) //rotation is the identity
    {
        rvec = vec3(0.0);
    }
    else
    {
        float c0 = R[2][1] - R[1][2];
        float c1 = R[0][2] - R[2][0];
        float c2 = R[1][0] - R[0][1];
        rvec = d * vec3(c0, c1, c2);
    }
}

void evalReprojError(in Mat12 objectPoints, in Mat8 imagePoints, in mat4 M, inout float err)
{
    vec3 r = vec3(0.0);
    rot2vec(mat3(M), r);
    
    Mat8 projectedPoints = emptyMat4x1x2();

    mat3 K = mat3(1.0);
    cvProjectPoints2(objectPoints, r, vec3(M[0][3], M[1][3], M[2][3]), K, projectedPoints, 0.0);
    //testOutValue(projectedPoints);
    
    err = 0;
    int n = 4;

    float dx = 0.0;
    float dy = 0.0;
    for (int i = 0; i < n; i++)
    {
        dx = projectedPoints.data[idx(projectedPoints,i,0,0)] - imagePoints.data[idx(imagePoints,i,0,0)];
        dy = projectedPoints.data[idx(projectedPoints,i,0,1)] - imagePoints.data[idx(imagePoints,i,0,1)];

        err += dx * dx + dy * dy;
    }
    err = sqrt(err / (2.0 * n));
}

void sortPosesByReprojError(
    in Mat12 objectPoints, in Mat8 imagePoints, in mat4 Ma, in mat4 Mb,
    inout mat4 M1, inout mat4 M2)
{
    float erra, errb;

    evalReprojError(objectPoints, imagePoints, Ma, erra);
    evalReprojError(objectPoints, imagePoints, Mb, errb);
    
    if (erra < errb)
    {
        M1 = Ma;
        M2 = Mb;
    }
    else
    {
        M1 = Mb;
        M2 = Ma;
    }
}

void solvePnP_IPPE(
	in Mat12 objectPoints, in Mat8 imagePoints,
	inout mat3 rmat1, inout vec3 tvec1,
	inout mat3 rmat2, inout vec3 tvec2)
{
    Mat8 normalizedImagePoints = cvUndistortPoints(imagePoints, cameraMatrix, 5, 0.01);
	//testOutValue(normalizedImagePoints);

    //solve:
    mat4 Ma = mat4(0.0);
	mat4 Mb = mat4(0.0);
    solveGeneric(objectPoints, normalizedImagePoints, Ma, Mb);

    //testOutValue(Ma);

    //the two poses computed by IPPE (sorted):
    mat4 M1 = mat4(0.0);
    mat4 M2 = mat4(0.0);

    //sort poses by reprojection error:
    sortPosesByReprojError(objectPoints, normalizedImagePoints, Ma, Mb, M1, M2);

    //fill outputs
    //rot2vec(mat3(M1), rvec1);
    //rot2vec(mat3(M2), rvec2);
    rmat1 = mat3(M1);
    rmat2 = mat3(M2);

    tvec1 = vec3(M1[0][3], M1[1][3], M1[2][3]);
    tvec2 = vec3(M2[0][3], M2[1][3], M2[2][3]);
}









void solvePnP_IPPE_Square(
    in Mat12 objectPoints, in Mat8 imagePoints,
    inout mat3 rmat1, inout vec3 tvec1,
    inout mat3 rmat2, inout vec3 tvec2)
{
    Mat8 normalizedInputPoints = cvUndistortPoints(imagePoints, cameraMatrix, 5, 0.01);

    //generate the object points:

    float squareLength = 1.0;
    float halfLength = squareLength / 2.0;
    Mat8 objectPoints2D = newMat4x1x2(float[](
        halfLength,  -halfLength,
        -halfLength, -halfLength,
        -halfLength,  halfLength,
         halfLength,  halfLength
    ));

    /*
    Mat8 objectPoints2D = emptyMat4x1x2();

    objectPoints2D.ptr<Vec2d>(0)[0] = Vec2d(objectPoints.ptr<Vec3f>(0)[0](0), objectPoints.ptr<Vec3f>(0)[0](1));
    objectPoints2D.ptr<Vec2d>(0)[1] = Vec2d(objectPoints.ptr<Vec3f>(0)[1](0), objectPoints.ptr<Vec3f>(0)[1](1));
    objectPoints2D.ptr<Vec2d>(0)[2] = Vec2d(objectPoints.ptr<Vec3f>(0)[2](0), objectPoints.ptr<Vec3f>(0)[2](1));
    objectPoints2D.ptr<Vec2d>(0)[3] = Vec2d(objectPoints.ptr<Vec3f>(0)[3](0), objectPoints.ptr<Vec3f>(0)[3](1));
    
    float squareLength = sqrt(
        (objectPoints.ptr<Vec3f>(0)[1](0) - objectPoints.ptr<Vec3f>(0)[0](0))*
        (objectPoints.ptr<Vec3f>(0)[1](0) - objectPoints.ptr<Vec3f>(0)[0](0)) +
        (objectPoints.ptr<Vec3f>(0)[1](1) - objectPoints.ptr<Vec3f>(0)[0](1))*
        (objectPoints.ptr<Vec3f>(0)[1](1) - objectPoints.ptr<Vec3f>(0)[0](1)) );
    */

    mat3 H = mat3(0.0); //homography from canonical object points to normalized pixels

    //compute H
    homographyFromSquarePoints(normalizedInputPoints, halfLength, H);

    //now solve
    mat4 Ma = mat4(0.0);
    mat4 Mb = mat4(0.0);
    solveCanonicalForm(objectPoints2D, normalizedInputPoints, H, Ma, Mb);

    //sort poses according to reprojection error:
    mat4 M1 = mat4(0.0);
    mat4 M2 = mat4(0.0);
    sortPosesByReprojError(objectPoints, normalizedInputPoints, Ma, Mb, M1, M2);

    //fill outputs
    rmat1 = mat3(M1);
    rmat2 = mat3(M2);

    tvec1 = vec3(M1[0][3], M1[1][3], M1[2][3]);
    tvec2 = vec3(M2[0][3], M2[1][3], M2[2][3]);
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
	float f_scale = (scale_y / 2.0) / tan(degToRad * (fov / 2.0));
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
	mat3 rmat2;
	vec3 tvec2;
	solvePnP_IPPE_Square(
		testObjectPoints, testImagePoints,
		rmat, tvec,
		rmat2, tvec2);
    
    //testOutValue(rvec1);
    //testOutValue(tvec1);

	//vec3 rvec;
    //mat3 rmat;
	//cvRodrigues2(rvec, rmat);
	//testOutValue(rmat);
	//testOutValue(tvec);
	//testOutValue(rvec);

	vec3 translation = getCameraTranslation(rmat, tvec);
	vec2 rotation = getCameraYawPitch(rmat) * 180.0/pi;

	//testOutValue(rotation);
	//testOutValue(translation);
    testOutValue(mat3(vec3(rotation, 0.0), translation, vec3(0.0)));
}