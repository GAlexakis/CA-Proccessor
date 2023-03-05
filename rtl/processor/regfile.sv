`ifdef MODEL_TECH
	`include "../sys_defs.vh"
`endif

module regfile(
	input logic clk,
	input logic rst,
	input logic [4:0] rda_idx, rdb_idx, wr_idx,		// read/write index
	input logic [31:0] wr_data,            			// write data
	input logic wr_en,

	output logic[31:0] rda_out, rdb_out    			// read data
);
  
logic [31:0] registers [0:31];   

assign rda_out = registers[rda_idx];
assign rdb_out = registers[rdb_idx];

always_ff @(posedge clk or posedge rst) begin : Write_port
	if(rst) begin
		for(int i=0;i<32;i++) begin
			registers[i]<=0;
		end
	end
	else begin
		if(wr_idx != `ZERO_REG && wr_en) 
			registers[wr_idx] <=  wr_data;
	end
end
	initial begin
		$monitor("
			r0: %32b\n 
			r1: %32b\n 
			r2: %32b\n 
			r3: %32b\n 
			r4: %32b\n 
			r5: %32b\n 
			r6: %32b\n 
			r7: %32b\n 
			r8: %32b\n 
			r9: %32b\n 
			r10: %32b\n 
			r11: %32b\n 
			r12: %32b\n 
			r13: %32b\n 
			r14: %32b\n 
			r15: %32b\n 
			r16: %32b\n 
			r17: %32b\n 
			r18: %32b\n 
			r19: %32b\n 
			r20: %32b\n 
			r21: %32b\n 
			r22: %32b\n 
			r23: %32b\n 
			r24: %32b\n 
			r25: %32b\n 
			r26: %32b\n 
			r27: %32b\n 
			r28: %32b\n 
			r29: %32b\n 
			r30: %32b\n 
			r31: %32b\n",
			registers[0],
			registers[1],
			registers[2],
			registers[3],
			registers[4],
			registers[5],
			registers[6],
			registers[7],
			registers[8],
			registers[9],
			registers[10],
			registers[11],
			registers[12],
			registers[13],
			registers[14],
			registers[15],
			registers[16],
			registers[17],
			registers[18],
			registers[19],
			registers[20],
			registers[21],
			registers[22],
			registers[23],
			registers[24],
			registers[25],
			registers[26],
			registers[27],
			registers[28],
			registers[29],
			registers[30],
			registers[31],
			);
	end
endmodule // regfile
