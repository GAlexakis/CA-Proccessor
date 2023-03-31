#include<stdio.h>
#include<stdlib.h>

typedef struct Matrix
{
    int rows;
    int cols;
    int* ptr;
}
matrix_t;
int lfsr_8bit (unsigned char* lfsr)
{
    unsigned char bit;
    bit = ((*lfsr >> 0) ^ (*lfsr >> 2) ^ (*lfsr >> 3) ^ (*lfsr >> 4)) & 1u;
    *lfsr = (*lfsr >> 1) | (bit << 7);
    int result = 127 - *lfsr;
    return result;
}

matrix_t matmul (matrix_t a, matrix_t b)
{
    matrix_t result;
    result.rows = a.rows;
    result.cols = b.cols;
    int size = a.cols;
    result.ptr = malloc(result.rows*result.cols*sizeof(int));
    for(int i = 0; i < result.rows; i++)
    {
        for(int j = 0; j < result.cols; j++)
        {
            result.ptr[i*result.cols + j] = 0;
            for(int k = 0; k < size; k++)
            {
                result.ptr[i*result.cols + j] += a.ptr[i*size + k]*b.ptr[k*b.cols + j];
            }
            printf("%d\n",result.ptr[i*result.cols + j]);
        }
    }
    return result;
}

int main()
{
    unsigned char lfsr = 100u;
    matrix_t A;
    A.rows = 1;
    A.cols = 100;
    A.ptr = malloc(A.rows*A.cols*sizeof(int));
    for(int i = 0; i < A.rows; i++)
    {
        for(int j = 0; j < A.cols; j++)
        {
            A.ptr[i*A.cols + j] = lfsr_8bit(&lfsr);
        }
    }
    matrix_t B;
    B.rows = 100;
    B.cols = 2;
    B.ptr = malloc(B.rows*B.cols*sizeof(int));
    for(int i = 0; i < B.rows; i++)
    {
        for(int j = 0; j < B.cols; j++)
        {
            B.ptr[i*B.cols + j] = lfsr_8bit(&lfsr);
        }
    }
    matrix_t C;
    C.rows = 2;
    C.cols = 50;
    C.ptr = malloc(C.rows*C.cols*sizeof(int));
    for(int i = 0; i < C.rows; i++)
    {
        for(int j = 0; j < C.cols; j++)
        {
            C.ptr[i*C.cols + j] = lfsr_8bit(&lfsr);
        }
    }
    matrix_t D;
    D.rows = 50;
    D.cols = 4;
    D.ptr = malloc(D.rows*D.cols*sizeof(int));
    for(int i = 0; i < D.rows; i++)
    {
        for(int j = 0; j < D.cols; j++)
        {
            D.ptr[i*D.cols + j] = lfsr_8bit(&lfsr);
        }
    }
    matrix_t E;
    E.rows = 4;
    E.cols = 25;
    E.ptr = malloc(E.rows*E.cols*sizeof(int));
    for(int i = 0; i < E.rows; i++)
    {
        for(int j = 0; j < E.cols; j++)
        {
            E.ptr[i*E.cols + j] = lfsr_8bit(&lfsr);
        }
    }
    matrix_t F;
    F.rows = 25;
    F.cols = 8;
    F.ptr = malloc(F.rows*F.cols*sizeof(int));
    for(int i = 0; i < F.rows; i++)
    {
        for(int j = 0; j < F.cols; j++)
        {
            F.ptr[i*F.cols + j] = lfsr_8bit(&lfsr);
        }
    }
    matrix_t G;
    G.rows = 8;
    G.cols = 10;
    G.ptr = malloc(G.rows*G.cols*sizeof(int));
    for(int i = 0; i < G.rows; i++)
    {
        for(int j = 0; j < G.cols; j++)
        {
            G.ptr[i*G.cols + j] = lfsr_8bit(&lfsr);
        }
    }
    matrix_t H;
    H.rows = 10;
    H.cols = 2;
    H.ptr = malloc(H.rows*H.cols*sizeof(int));
    for(int i = 0; i < H.rows; i++)
    {
        for(int j = 0; j < H.cols; j++)
        {
            H.ptr[i*H.cols + j] = lfsr_8bit(&lfsr);
        }
    }
    matrix_t I;
    I.rows = 2;
    I.cols = 100;
    I.ptr = malloc(I.rows*I.cols*sizeof(int));
    for(int i = 0; i < I.rows; i++)
    {
        for(int j = 0; j < I.cols; j++)
        {
            I.ptr[i*I.cols + j] = lfsr_8bit(&lfsr);
        }
    }
    matrix_t J;
    J.rows = 100;
    J.cols = 1;
    J.ptr = malloc(J.rows*J.cols*sizeof(int));
    for(int i = 0; i < J.rows; i++)
    {
        for(int j = 0; j < J.cols; j++)
        {
            J.ptr[i*J.cols + j] = lfsr_8bit(&lfsr);
        }
    }

    matrix_t matAB = matmul(A, B);
    matrix_t matABC = matmul(matAB, C);
    matrix_t matABCD = matmul(matABC, D);
    matrix_t matABCDE = matmul(matABCD, E);
    matrix_t matABCDEF = matmul(matABCDE, F);
    matrix_t matABCDEFG = matmul(matABCDEF, G);
    matrix_t matABCDEFGH = matmul(matABCDEFG, H);
    matrix_t matABCDEFGHI = matmul(matABCDEFGH, I);
    matrix_t matABCDEFGHIJ = matmul(matABCDEFGHI, J);
    free(A.ptr);
    free(B.ptr);
    free(C.ptr);
    free(D.ptr);
    free(E.ptr);
    free(F.ptr);
    free(G.ptr);
    free(H.ptr);
    free(I.ptr);
    free(J.ptr);
    free(matAB.ptr);
    free(matABC.ptr);
    free(matABCD.ptr);
    free(matABCDE.ptr);
    free(matABCDEF.ptr);
    free(matABCDEFG.ptr);
    free(matABCDEFGH.ptr);
    free(matABCDEFGHI.ptr);
    free(matABCDEFGHIJ.ptr);
    return 0;
}
