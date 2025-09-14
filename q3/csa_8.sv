

module adderselect_sizeN #(
	parameter N = 4
) (
	input logic [N-1:0] A,
	input logic [N-1:0] B,
	input logic s,
	output logic [N-1:0] W
);
	assign W = s ? B : A; // If s is 1 then B else A.
endmodule

module CSA_8 (
	input logic [7:0] A, B,
	output logic [7:0] sum,
	output logic carry
);
	logic [3:0] ms4bits_result_no_carry;
	logic [3:0] ms4bits_result_carry;
	logic carry_result_no_carry;
	logic carry_result_carry;
	logic carry_result_ls4bits;

	adderselect_sizeN #(
		.N(1)
	) carryselect_module (
		.A(carry_result_no_carry),
		.B(carry_result_carry),
		.s(carry_result_ls4bits),
		.W(carry)
	);

	adderselect_sizeN #(
		.N(4)
	) adderselect_module (
		.A(ms4bits_result_no_carry),
		.B(ms4bits_result_carry),
		.s(carry_result_ls4bits),
		.W(sum[7:4])
	);

	adder_4 ls4bits(
		.A(A[3:0]),
		.B(B[3:0]),
		.sum(sum[3:0]),
		.Cin('0),
		.carry(carry_result_ls4bits)
	);

	adder_4 ms4bits_no_carry(
		.A(A[7:4]),
		.B(B[7:4]),
		.Cin('0),
		.sum(ms4bits_result_no_carry),
		.carry(carry_result_no_carry)
	);
	adder_4 ms4bits_carry(
		.A(A[7:4]),
		.B(B[7:4]),
		.Cin('1),
		.sum(ms4bits_result_carry),
		.carry(carry_result_carry)
	);
endmodule
