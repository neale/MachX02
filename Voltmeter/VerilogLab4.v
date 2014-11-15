//  Dependencies
// 
// Revision: 
// Revision 0.01 = File Created
//
/////////////////////////////////////////

module SmartRemote( 
	input   A,B,C,
		    AnalogLdir,
			AnalogRdir,
	output  Len_Out,
			Ldir_Out,
			Ren_Out,
			Rdir_Out
	);
	
	// Ground connection
	supply0 GND;
	
	// Wires
    wire LenO_Wire, LdirO_Wire, RenO_Wire, RdirO_Wire; // Outputs
	wire Len, Ldir, Ren, Rdir; // Connections
	
	// IO wire assignment
	assign Len_Out = LenO_Wire;
	assign LDir_Out = LdirO_Wire;
	assign Ren_Out = RenO_Wire;
	assign Rdir_Out = RdirO_Wire;

	
	
		   
	// Section two booger set to be picked
	Boogers2 Boog( 
				.BoogerA(A), // Inputs
				.BoogerB(B),
				.BoogerC(C),
		    	.Re(Ren), // Outputs
				.Le(Len),
		    	.Rd(Rdir),
				.Ld(Ldir));
	
	
	// Array of multiplexers
	Mux mux_0( .D0(GND),   .D1(Len),  .s(S), .Y(LenO_Wire ) );
	Mux mux_1( .D0(ALdir), .D1(Ldir), .s(S), .Y(LdirO_Wire) );
	Mux mux_2( .D0(GND), .  D1(Ren),  .s(S), .Y(RenO_Wire ) );
	Mux mux_3( .D0(ARdir), .D1(Rdir), .s(S), .Y(RdirO_WIre) );
	
	assign S = AnalogLdir & AnalogRdir; // And Gate

endmodule

module Mux( // Multiplexor Model
		input  D0, D1, s,
		output Y
	);

	assign Y = s ? D1:D0;

endmodule