module adder_4 (
	input logic [3:0] A, B,
	input logic Cin, // I added carry in
	output logic [3:0] sum,
	output logic carry
);
	assign {carry, sum} = A+B+Cin;
endmodule
