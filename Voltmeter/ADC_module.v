
//ADCinterface allows for a verilog project to be interfaced with the ADC0820 breakout board from Tekbots, operating in WR-RD Standalone mode by supplying the CS, RD, and WR control signals
//module can be modified to allow for alternate operating modes, but aren't currently written in
module ADCinterface(
		input reset_n,
		input clk,			//input clock should be 2.08MHz
		
		output CS_n,
		output RD_n,
		output reg WR_n
	);
			
	reg [7:0]count;
	
	assign CS_n = 0;			//in standalone mode, CS tied to ground
	assign RD_n = 0;			//in standalone mode, RD tied to ground
		
	always @ (posedge clk, negedge reset_n)			
		begin
			count <= count + 1;								
			if(!reset_n)
				begin
					WR_n <= 0;		//WR_n level starts low
					count <= 0;						
				end
			else
				if(count == 20)					//in current setup, clock low for first 1/10 of period, ~10uS
						WR_n <= ~WR_n;	
				else if(count == 200)			//in current setup, clock period is (1/2.08E6)(200) = ~100uS
					begin
						WR_n <= ~WR_n;
						count <= 0;	
					end

		end
		
endmodule