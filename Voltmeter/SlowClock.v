module clock_counter(
	input clk_i,  //often, "tags" are added to variables to denote what they do for the user
	input reset_n,  //here, 'i' is used for input and 'o' for the output, while 'n' specifies an active low signal ("not") 
	
	output reg clk_o
		);
		
		reg [14:0] count;   //register stores the counter value so that it can be modified on a clock edge. register size needs to store as large of a number as the counter reaches
					//for this implementation, count must reach 415999, so 2^n >= 415999, n = 19
		
		always @ (posedge clk_i, negedge reset_n)			
			begin
				count <= count + 1;   //at every positive edge, the counter is increased by 1
				if(!reset_n)
					begin
						clk_o <= 0;
						count <= 0;   //if reset (active low) is pushed, the counter is reset
					end
				else
					if(count >= 1800)   //count value of greater than or equal to this value causes the output clock to be inverted. the resulting frequency will be input_frequency/(1+count_value)
						begin   //for this implementation, a frequency of 5 Hz was desired, so 2.08e6/5 - 1 = 34666
							clk_o <= ~clk_o;	
                                                        count <= 0;	//resets the counter after the output clock has been inverted
						end
			end
		
		
endmodule
