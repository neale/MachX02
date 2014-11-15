module state_machine(
	input clk_i,
	input reset_n,
	input LeftBumper,
	input RightBumper,
        
	output clk_out,
	output L_Ena,
	output L_Dir,
	output R_Ena,
	output R_Dir);
	
	reg [3:0] state;
	reg [3:0] state_n;
	
	parameter S0 = 4'b0000;
	parameter S1 = 4'b0001;
	parameter S2 = 4'b0010;
	parameter S3 = 4'b0100;
	parameter S4 = 4'b1000;
	
	always @ (posedge clk_i, negedge reset_n)
		begin
			//clk_out = clk_i;
			if(!reset_n)
				state = S0;
			else
				state = state_n;
		end
		
	always @ (*)
		begin
			case(state)
				S0: if(~LeftBumper) state_n = S3;
				    else if(~RightBumper) state_n = S1;
				    else state_n = S0;
				S1: state_n = S2;
				S2: state_n = S0;
				S3: state_n = S4;
				S4: state_n = S0;
				default: state_n = S0;
			endcase
		end
	
	assign L_Ena = 0;
	assign L_Dir = (state == S0 || state == S4);
	assign R_Ena = 0;
	assign R_Dir = (state == S0 || state == S2);
	
endmodule
