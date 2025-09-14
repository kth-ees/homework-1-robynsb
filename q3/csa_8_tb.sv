`timescale 1ns/1ns
module CSA_8_tb;
  logic [7:0] A = '0;
  logic [7:0] B = '0;
  logic [7:0] sum;
	logic carry;

	CSA_8 adder(
		.A(A),
		.B(B),
		.sum(sum),	
		.carry(carry)
	);

	initial begin
		for (int i = 0; i < 20; i++) begin
			for (int j = 0; j < 20; j++) begin
				#10ns;
				B = B + 2'b00000001;
			end
			A = A + 2'b00000001;
		end
	end
	
endmodule