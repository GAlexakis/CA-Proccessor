#include<stdio.h>
#include<stdlib.h>

FILE* file1;
FILE* file2;

int main()
{
    int input1;
    int input2;
    file1 = fopen("results_risc.txt", "r");
    file2 = fopen("results_compiler.txt", "r");
    while(fscanf(file1, "%d", &input1) != EOF)
    {
        fscanf(file2, "%d", &input2);
        if(input1 != input2)
        {
            printf("ERROR: RESULTS NOT EQUAL\n");
            return 1;
        }
    }
    printf("SUCCESS: ALL RESULTS EQUAL\n");
    return 0;
}