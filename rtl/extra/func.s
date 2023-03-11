   .text
   .align 4
   .global func

func: addi s2, zero, 5
      addi s3, zero, 6
      mul s4, s3, s2
      mulh s5, s3, s2

      lui s2, 524287
      lui s3, 524287
      addi s2, s2, 2047
      addi s3, s3, 2047
      mul s4, s3, s2
      mulh s5, s3, s2
      jr ra 
