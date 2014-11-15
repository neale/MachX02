// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.1.0.96
// Netlist written on Wed May 14 00:02:58 2014
//
// Verilog Description of module SmartRemote
//

module SmartRemote (A, B, C, AnalogLdir, AnalogRdir, Len_Out, Ldir_Out, 
            Ren_Out, Rdir_Out) /* synthesis syn_module_defined=1 */ ;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(8[8:19])
    input A;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(9[10:11])
    input B;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(9[12:13])
    input C;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(9[14:15])
    input AnalogLdir;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(10[7:17])
    input AnalogRdir;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(11[4:14])
    output Len_Out;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(12[10:17])
    output Ldir_Out;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(13[4:12])
    output Ren_Out;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(14[4:11])
    output Rdir_Out;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(15[4:12])
    
    wire GND_net;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(19[10:13])
    wire A_c;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(9[10:11])
    wire B_c;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(9[12:13])
    wire C_c;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(9[14:15])
    wire AnalogLdir_c;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(10[7:17])
    wire AnalogRdir_c;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(11[4:14])
    wire Len_Out_c;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(12[10:17])
    wire Ren_Out_c;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(14[4:11])
    wire Len;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(23[7:10])
    wire Ren;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(23[18:21])
    wire Rd;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/boogers2.v(9[8:10])
    wire Ld;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/boogers2.v(7[8:10])
    
    wire VCC_net;
    
    VHI i9 (.Z(VCC_net));
    IB B_pad (.I(B), .O(B_c));
    LUT4 i1_2_lut_3_lut (.A(AnalogLdir_c), .B(AnalogRdir_c), .C(Ren), 
         .Z(Ren_Out_c)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_2_lut_3_lut.init = 16'h8080;
    IB A_pad (.I(A), .O(A_c));
    Boogers2 Boog (.C_c(C_c), .B_c(B_c), .A_c(A_c), .Ren(Ren), .Len(Len)) /* synthesis syn_module_defined=1 */ ;
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    GSR GSR_INST (.GSR(VCC_net));
    OBZ Ldir_Out_pad (.I(GND_net), .T(VCC_net), .O(Ldir_Out));
    OB Len_Out_pad (.I(Len_Out_c), .O(Len_Out));
    OB I16 (.I(C_c), .O(Rd)) /* synthesis syn_instantiated=1 */ ;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(35[11] 42[15])
    OB I17 (.I(A_c), .O(Ld)) /* synthesis syn_instantiated=1 */ ;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(35[11] 42[15])
    OBZ Rdir_Out_pad (.I(GND_net), .T(VCC_net), .O(Rdir_Out));
    OB Ren_Out_pad (.I(Ren_Out_c), .O(Ren_Out));
    VLO i1 (.Z(GND_net));
    LUT4 i1_2_lut_3_lut_adj_1 (.A(AnalogLdir_c), .B(AnalogRdir_c), .C(Len), 
         .Z(Len_Out_c)) /* synthesis lut_function=(A (B (C))) */ ;
    defparam i1_2_lut_3_lut_adj_1.init = 16'h8080;
    IB C_pad (.I(C), .O(C_c));
    IB AnalogLdir_pad (.I(AnalogLdir), .O(AnalogLdir_c));
    IB AnalogRdir_pad (.I(AnalogRdir), .O(AnalogRdir_c));
    
endmodule
//
// Verilog Description of module Boogers2
//

module Boogers2 (C_c, B_c, A_c, Ren, Len) /* synthesis syn_module_defined=1 */ ;
    input C_c;
    input B_c;
    input A_c;
    output Ren;
    output Len;
    
    wire N_3;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/boogers2.v(13[6:9])
    wire N_7;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/boogers2.v(17[6:9])
    wire N_4;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/boogers2.v(14[6:9])
    wire N_5;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/boogers2.v(15[6:9])
    wire N_2;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/boogers2.v(12[6:9])
    wire N_1;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/boogers2.v(11[6:9])
    wire N_6;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/boogers2.v(16[6:9])
    
    INV I20 (.A(C_c), .Z(N_3));   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(35[11] 42[15])
    AND3 I19 (.A(N_5), .B(N_4), .C(N_3), .Z(N_7)) /* synthesis syn_instantiated=1 */ ;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(35[11] 42[15])
    INV I21 (.A(B_c), .Z(N_4));   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(35[11] 42[15])
    AND3 I18 (.A(N_5), .B(N_4), .C(N_3), .Z(N_2)) /* synthesis syn_instantiated=1 */ ;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(35[11] 42[15])
    INV I22 (.A(A_c), .Z(N_5));   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(35[11] 42[15])
    AND2 I26 (.A(A_c), .B(B_c), .Z(N_1)) /* synthesis syn_instantiated=1 */ ;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(35[11] 42[15])
    AND2 I27 (.A(B_c), .B(C_c), .Z(N_6)) /* synthesis syn_instantiated=1 */ ;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(35[11] 42[15])
    OR2 I28 (.A(N_2), .B(N_1), .Z(Ren)) /* synthesis syn_instantiated=1 */ ;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(35[11] 42[15])
    OR2 I29 (.A(N_7), .B(N_6), .Z(Len)) /* synthesis syn_instantiated=1 */ ;   // c:/users/joshu_000/documents/diamonddesignfiles/picker/source/veriloglab4.v(35[11] 42[15])
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

