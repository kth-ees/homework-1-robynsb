module demultiplexer(
	input logic i,
	input logic [3:0] S,
	output logic [15:0] x
);

	always_comb begin
		x = '0;
		x[S] = i;
	end

endmodule

module decoder (
	input logic [3:0] binary,
	output logic [15:0] one_hot
);

	demultiplexer demut (
		.i('1),
		.S(binary),
		.x(one_hot)
	);

endmodule

