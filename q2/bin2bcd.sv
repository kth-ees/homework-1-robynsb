module mux16to1 (
	input logic [0:15] J,
	input logic [3:0] s,
	output logic w
);

	assign w = J[s];

endmodule

module bin2bcd(
	input logic [3:0] binary,
	output logic [3:0] bcd,
	output logic carry
);
	mux16to1 eights(
		.J(16'b0000000011000000),
		.s(binary),
		.w(bcd[3])
	);

	mux16to1 fours(
		.J(16'b0000111100000011),
		.s(binary),
		.w(bcd[2])
	);

	mux16to1 twos(
		.J(16'b0011001100001100),
		.s(binary),
		.w(bcd[1])
	);

	mux16to1 ones(
		.J(16'b0101010101010101),
		.s(binary),
		.w(bcd[0])
	);

	mux16to1 carries(
		.J(16'b0000000000111111),
		.s(binary),
		.w(carry)
	);
	

endmodule

