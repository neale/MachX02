module decoder(
	input [3:0] data,
	output reg [6:0] segments
	);

	always @ (*)
		case( data ) // 7'bGFEDCBA
			0: segments = 7'b1000000;
			1: segments = 7'b1111001;//1001111;
			2: segments = 7'b0100100;//0010010;
			3: segments = 7'b0110000;//0000110;
			4: segments = 7'b0011001;//1001100;
			5: segments = 7'b0010010;//0100100;
			6: segments = 7'b0000010;//1100000;
			7: segments = 7'b1111000;//0001111;
			8: segments = 7'b0000000;
			9: segments = 7'b0011000;//0001100;
			default: segments = 7'b0000000;
		endcase
endmodule