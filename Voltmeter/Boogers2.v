/* Verilog model created from schematic Boogers2.sch -- May 13, 2014 23:16 */

module Boogers2( BoogerA, BoogerB, BoogerC, Ld, Le, Rd, Re );
 input BoogerA;
 input BoogerB;
 input BoogerC;
output Ld;
output Le;
output Rd;
output Re;
wire N_1;
wire N_2;
wire N_3;
wire N_4;
wire N_5;
wire N_6;
wire N_7;
wire N_8;
wire N_9;
wire N_10;



AND3 I18 ( .A(N_5), .B(N_4), .C(N_3), .Z(N_2) );
AND3 I19 ( .A(N_10), .B(N_9), .C(N_8), .Z(N_7) );
INV I20 ( .A(BoogerC), .Z(N_3) );
INV I21 ( .A(BoogerB), .Z(N_4) );
INV I22 ( .A(BoogerA), .Z(N_5) );
INV I23 ( .A(BoogerC), .Z(N_8) );
INV I24 ( .A(BoogerB), .Z(N_9) );
INV I25 ( .A(BoogerA), .Z(N_10) );
OB I16 ( .I(BoogerC), .O(Rd) );
OB I17 ( .I(BoogerA), .O(Ld) );
AND2 I26 ( .A(BoogerA), .B(BoogerB), .Z(N_1) );
AND2 I27 ( .A(BoogerB), .B(BoogerC), .Z(N_6) );
OR2 I28 ( .A(N_2), .B(N_1), .Z(Re) );
OR2 I29 ( .A(N_7), .B(N_6), .Z(Le) );

endmodule // Boogers2
