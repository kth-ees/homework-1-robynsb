`timescale 1ns/1ns
module decoder_tb;
	logic [3:0] binary = '0;
	logic [15:0] one_hot;
	
	decoder dec(
		.binary(binary),
		.one_hot(one_hot)
	);

	initial begin
		for (int i = 0; i < 20; i++) begin
			#10ns;
			binary = binary + 2'b0001;
		end
	end
	
endmodule

