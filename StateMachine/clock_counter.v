
module clock_counter(
	
	input clk_i,
	input reset_n,
	
	output reg clk_o
	);
		
	OSCH #("2.08") osc_int (					//"2.08" specifies the operating frequency, 2.08 MHz. Other clock frequencies can be found in the MachX02's documentation
		.STDBY(1'b0),							//Specifies active state
		.OSC(clk),								//Outputs clock signal to 'clk' net
		.SEDSTDBY());							//Leaves SEDSTDBY pin unconnected
		
		
	
	reg [21:0] count;
	
	always @ (posedge clk_i, negedge reset_n)
		begin
			count <= count + 1;
			if(!reset_n)
				begin
					clk_o <= 0;
					count <=0;
				end
			else
				if(count>= 1039999)
					begin
						clk_o <= ~clk_o;
						count <= 0;
						end
					end
endmodule