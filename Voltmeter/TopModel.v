module top_model (
	
	input [7:0] input_8_bit,
	input reset_n,

	output decimal_point,
	output [6:0] segments,
	output [2:0] digit,
	output CS_o,
	output RD_o,
	output WR_o
	);
	
	integer digital_value;
	wire clk;
	wire clk_slow;
	reg [3:0] units_place;
	reg [3:0] tens_place;
	reg [3:0] hundreds_place;
	reg [3:0] thousands_place;
	wire [3:0] data_o;
	
	
	//digital to analog conversion
	always@(*) begin
	digital_value = input_8_bit;// * (5000 / 255); //convert from 0-255 to 0volts to 5volts
	thousands_place = (((digital_value * 5000) / 255) % 10000) / 1000;
	hundreds_place = (((digital_value * 5000) / 255) % 1000) / 100;
	tens_place = (((digital_value * 5000) / 255) % 100) / 10;
	units_place = ((digital_value * 5000) / 255) % 10;
	end
	
	//This is an instance of a special, built in module that accesses the chip's oscillator
        //"2.08" specifies the operating frequency, 2.03 MHz. Other clock frequencies can be found in the MachX02's documentation

	OSCH #("2.08") osc_int (		
                .STDBY(1'b0),	      //Specifies active state
		.OSC(clk),	      //Outputs clock signal to 'clk' net
		.SEDSTDBY()           //Leaves SEDSTDBY pin unconnected

	);									
	clock_counter divider1 (
		.reset_n(reset_n),
		.clk_i(clk),
		.clk_o(clk_slow)
	);
	
	ADCinterface ADC1 (
		.clk(clk),
		.reset_n(reset_n),
		.CS_n(CS_o),
		.RD_n(RD_o),
		.WR_n(WR_o)
	);
	
	digit_state_machine DSM1 (
		.units(units_place),
		.tens(tens_place),
		.hundreds(hundreds_place),
		.thousands(thousands_place),
		.reset_n(reset_n),	    
                .clk(clk_slow),
		.digit_select(digit),
		.data(data_o),
		.decimal_point(decimal_point)
	);
	
	decoder d1(
		.data(data_o),
		.segments(segments)
	);
	
endmodule
