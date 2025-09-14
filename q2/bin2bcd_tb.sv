`timescale 1ns/1ns
module bin2bcd_tb;
  	logic [3:0] binary = '0;
  	logic [3:0] bcd;
	logic [3:0] carry;

	bin2bcd encoder(
		.binary(binary),
		.bcd(bcd),
		.carry(carry)
	);

	initial begin
		for (int i = 0; i < 20; i++) begin
			#10ns;
			binary = binary + 2'b0001;
		end
	end
	
endmodule