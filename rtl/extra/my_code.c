typedef struct Matrix
{
    int rows;
    int cols;
    int start;
    int* ptr;
}
matrix_t;

int         mulf        (int a, int b);
int         lfsr_32bit   (unsigned char* lfsr);
int         lfsr_16bit  (unsigned short* lfsr);
int         lfsr_8bit  (unsigned int* lfsr);
matrix_t    matrixMul   (matrix_t a, matrix_t b, int start);

int main ()
{
    unsigned char   lfsr_32 =    100u;
    unsigned short  lfsr_16 =   100u;
    unsigned int    lfsr_8 =   100u;

    matrix_t matA = {1, 100, 4*8000};
    for(int i = 0; i < 4*matA.rows; i+=4)
    {
        for(int j = 0; j < 4*matA.cols; j+=4)
        {
            matA.ptr = matA.start - i*matA.cols - j;
            *matA.ptr = lfsr_8bit(&lfsr_8);
        }
    }

    matrix_t matB = {100, 2, 4*7900};
    for(int i = 0; i < 4*matB.rows; i+=4)
    {
        for(int j = 0; j < 4*matB.cols; j+=4)
        {
            matB.ptr = matB.start - i*matB.cols - j;
            *matB.ptr = lfsr_8bit(&lfsr_8);
        }
    }

    matrix_t matC = {2, 50, 4*7700};
    for(int i = 0; i < 4*matC.rows; i+=4)
    {
        for(int j = 0; j < 4*matC.cols; j+=4)
        {
            matC.ptr = matC.start - i*matC.cols - j;
            *matC.ptr = lfsr_8bit(&lfsr_8);
        }
    }

    matrix_t matD = {50, 4, 4*7600};
    for(int i = 0; i < 4*matD.rows; i+=4)
    {
        for(int j = 0; j < 4*matD.cols; j+=4)
        {
            matD.ptr = matD.start - i*matD.cols - j;
            *matD.ptr = lfsr_8bit(&lfsr_8);
        }
    }

    matrix_t matE = {4, 25, 4*7400};
    for(int i = 0; i < 4*matE.rows; i+=4)
    {
        for(int j = 0; j < 4*matE.cols; j+=4)
        {
            matE.ptr = matE.start - i*matE.cols - j;
            *matE.ptr = lfsr_8bit(&lfsr_8);
        }
    }

    matrix_t matF = {25, 8, 4*7300};
    for(int i = 0; i < 4*matF.rows; i+=4)
    {
        for(int j = 0; j < 4*matF.cols; j+=4)
        {
            matF.ptr = matF.start - i*matF.cols - j;
            *matF.ptr = lfsr_8bit(&lfsr_8);
        }
    }

    matrix_t matG = {8, 10, 4*7100};
    for(int i = 0; i < 4*matG.rows; i+=4)
    {
        for(int j = 0; j < 4*matG.cols; j+=4)
        {
            matG.ptr = matG.start - i*matG.cols - j;
            *matG.ptr = lfsr_8bit(&lfsr_8);
        }
    }

    matrix_t matH = {10, 2, 4*7020};
    for(int i = 0; i < 4*matH.rows; i+=4)
    {
        for(int j = 0; j < 4*matH.cols; j+=4)
        {
            matH.ptr = matH.start - i*matH.cols - j;
            *matH.ptr = lfsr_8bit(&lfsr_8);
        }
    }

    matrix_t matI = {2, 100, 4*7000};
    for(int i = 0; i < 4*matI.rows; i+=4)
    {
        for(int j = 0; j < 4*matI.cols; j+=4)
        {
            matI.ptr = matI.start - i*matI.cols - j;
            *matI.ptr = lfsr_8bit(&lfsr_8);
        }
    }

    matrix_t matJ = {100, 1, 4*6800};
    for(int i = 0; i < 4*matJ.rows; i+=4)
    {
        for(int j = 0; j < 4*matJ.cols; j+=4)
        {
            matJ.ptr = matJ.start - i*matJ.cols - j;
            *matJ.ptr = lfsr_8bit(&lfsr_8);
        }
    }

    // 1x100 100x2 2x50 50x4 4x25 25x8 8x10 10x2 2x100 100x1
    matrix_t matAB = matrixMul(matA, matB, 4*6700);
    matrix_t matABC = matrixMul(matAB, matC, 4*6698);
    matrix_t matABCD = matrixMul(matABC, matD, 4*6648);
    matrix_t matABCDE = matrixMul(matABCD, matE, 4*6644);
    matrix_t matABCDEF = matrixMul(matABCDE, matF, 4*6619);
    matrix_t matABCDEFG = matrixMul(matABCDEF, matG, 4*6611);
    matrix_t matABCDEFGH = matrixMul(matABCDEFG, matH, 4*6601);
    matrix_t matABCDEFGHI = matrixMul(matABCDEFGH, matI, 4*6599);
    matrix_t matABCDEFGHIJ = matrixMul(matABCDEFGHI, matJ, 4*6499);

    return 0;
}

matrix_t matrixMul (matrix_t a, matrix_t b, int start)
{
    matrix_t result;
    result.start = start;
    result.rows = a.rows;
    result.cols = b.cols;
    for(int i = 0; i < 4*result.rows; i += 4)
    {
        for(int j = 0; j < 4*result.cols; j += 4)
        {
            result.ptr = result.start - i*result.cols - j;
            int temp = 0;
            for(int k = 0; k < 4*a.cols; k += 4)
            {
                a.ptr = a.start - i*a.cols - k;
                b.ptr = b.start - k*b.cols - j;
                int tempA = *a.ptr, tempB = *b.ptr;
                temp += mulf(tempA,tempB);
            }
            *result.ptr = temp;
        }
    }
    return result;
}

int lfsr_32bit (unsigned char* lfsr)
{
    unsigned char bit;
    bit = ((*lfsr >> 0) ^ (*lfsr >> 2) ^ (*lfsr >> 3) ^ (*lfsr >> 4)) & 1u;
    *lfsr = (*lfsr >> 1) | (bit << 7);
    int result = 127 - *lfsr;
    return result;
}

int lfsr_16bit (unsigned short* lfsr)
{
    unsigned short bit;
    bit = ((*lfsr >> 0) ^ (*lfsr >> 2) ^ (*lfsr >> 3) ^ (*lfsr >> 5)) & 1u;
    *lfsr = (*lfsr >> 1) | (bit << 15);
    int result = 32767 - *lfsr;
    return result;
}

int lfsr_8bit (unsigned int* lfsr)
{
    unsigned int bit;
    bit = ((*lfsr >> 0) ^ (*lfsr >> 2) ^ (*lfsr >> 6) ^ (*lfsr >> 7)) & 1u;
    *lfsr = (*lfsr >> 1) | (bit << 31);
    int result = 2147483648 - *lfsr;
    return result;
}