		
	reg [1:0] ADCstate;
	reg [1:0] ADCstate_n;
	
	parameter ADC0 = 2'b00;
	parameter ADC1 = 2'b01;
	parameter ADC2 = 2'b10;
	parameter ADC3 = 2'b11;
	
	always @ (posedge clk, negedge reset_n)
		begin
			if(!reset_n)
				ADCstate <= ADC0;
			else
				ADCstate <= ADCstate_n;
		end
		
		always @ (*)
			begin
				case(ADCstate)
					
					ADC0: ADCstate_n = ADC1;
					ADC1: ADCstate_n = ADC2;
					ADC2: ADCstate_n = ADC3;
					ADC3: ADCstate_n = ADC0;
					
					default: ADCstate_n = ADC0;
				endcase
			end
			
		always @ (posedge clk, negedge reset_n)
			begin				
				case(ADCstate)
				
				ADC0: begin
					WR_n <= 0;
					end
				ADC1: begin
					WR_n <= ~WR_n;
					end
				ADC2: begin
					RD_n <= 0;
					end

				ADC3: begin
					RD_n <= ~RD_n;
					end
				
				endcase
			end
