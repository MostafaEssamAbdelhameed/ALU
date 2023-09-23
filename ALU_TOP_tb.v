`timescale 1us / 1ps

module ALU_TOP_tb();
parameter width = 16 ; 
parameter clk_period = 10;
reg clk_tb =0;
always begin
#(clk_period * 0.4);
clk_tb = ~clk_tb;
#(clk_period * 0.6);
clk_tb = ~clk_tb;
end

reg [width - 1:0] A;
reg [width - 1:0] B;
reg [3:0] ALU_FUN;
reg clk,rst;
wire [width - 1:0] Arith_OUT;
wire Carry_OUT;
wire Arith_Flag;
wire [width - 1:0] Logic_OUT;
wire Logic_Flag;
wire [width - 1:0] CMP_OUT;
wire CMP_Flag;
wire [width - 1:0] Shift_OUT;
wire Shift_Flag;

ALU_TOP #(width) DUT (A,B,ALU_FUN,clk_tb,rst,Arith_OUT,Carry_OUT,
                      Arith_Flag,Logic_OUT,Logic_Flag,CMP_OUT,
                      CMP_Flag,Shift_OUT,Shift_Flag);
                      
initial begin
    rst=0;
    #(clk_period);
    if ((Arith_OUT == 0)&&(Arith_Flag==0)&&
        (Logic_OUT == 0)&&(Logic_Flag==0)&&
        (CMP_OUT == 0)&&(CMP_Flag==0)&&
        (Shift_OUT == 0)&&(Shift_Flag==0)) $display("Test rst Passed");
    #(clk_period);
    
    rst=1;
    A=16'd5;
    B=16'd2;
/*-----------------------------------------------------------------------------*/    
    //Arithmatic
/*-----------------------------------------------------------------------------*/    
    ALU_FUN=4'b0000;
    #(clk_period);
    if ((Arith_OUT == A+B)&&(Arith_Flag==1)) $display("Test Add Passed");
    #(clk_period);
    
    ALU_FUN=4'b0001;
    #(clk_period);
    if ((Arith_OUT == A-B)&&(Arith_Flag==1)) $display("Test Sub Passed");
    #(clk_period);
    
    ALU_FUN=4'b0010;
    #(clk_period);
    if ((Arith_OUT == A*B)&&(Arith_Flag==1)) $display("Test Mult Passed");
    #(clk_period);
    
    ALU_FUN=4'b0011;
    #(clk_period);
    if ((Arith_OUT == A/B)&&(Arith_Flag==1)) $display("Test Div Passed"); 
    #(clk_period);
   
/*-----------------------------------------------------------------------------*/ 
   //Logical
/*-----------------------------------------------------------------------------*/    
    ALU_FUN=4'b0100;
    #(clk_period);
    if ((Logic_OUT == (A&B) )&&(Logic_Flag==1)) $display("Test And Passed ");
    #(clk_period);
    
    ALU_FUN=4'b0101;
    #(clk_period);
    if ((Logic_OUT == (A|B))&&(Logic_Flag==1)) $display("Test OR Passed ");
    #(clk_period);
    
    ALU_FUN=4'b0110;
    #(clk_period);
    if ((Logic_OUT == ~(A&B))&&(Logic_Flag==1)) $display("Test Nand Passed");
    #(clk_period);
    
    ALU_FUN=4'b0111;
    #(clk_period);
    if ((Logic_OUT == ~(A|B))&&(Logic_Flag==1)) $display("Test NOR Passed");
    #(clk_period);
    
/*-----------------------------------------------------------------------------*/  
  //Compare
/*-----------------------------------------------------------------------------*/    
    ALU_FUN=4'b1000;
    #(clk_period);
    if ((CMP_OUT == (0) )&&(CMP_Flag==1)) $display("Test NOP Passed ");
    #(clk_period);
    
    ALU_FUN=4'b1001;
    #(clk_period);
    if ((CMP_OUT == (0))&&(CMP_Flag==1)) $display("Test Equal Passed ");
    #(clk_period);
    
    ALU_FUN=4'b1010;
    #(clk_period);
    if ((CMP_OUT == (2))&&(CMP_Flag==1)) $display("Test Greater Passed");
    #(clk_period);
    
    ALU_FUN=4'b1011;
    #(clk_period);
    if ((CMP_OUT == (0))&&(CMP_Flag==1)) $display("Test Less Passed");
    #(clk_period);
/*-----------------------------------------------------------------------------*/
   //Shift 
/*-----------------------------------------------------------------------------*/    
    ALU_FUN=4'b1100;
    #(clk_period);
    if ((Shift_OUT == (A>>1) )&&(Shift_Flag==1)) $display("Test Shift right A Passed ");
    #(clk_period);
    
    ALU_FUN=4'b1101;
    #(clk_period);
    if ((Shift_OUT == (A<<1) )&&(Shift_Flag==1)) $display("Test Shift left A Passed ");
    #(clk_period);
    
    ALU_FUN=4'b1110;
    #(clk_period);
    if ((Shift_OUT == (B>>1) )&&(Shift_Flag==1)) $display("Test Shift right B Passed ");
    #(clk_period);
    
    ALU_FUN=4'b1111;
    #(clk_period);
    if ((Shift_OUT == (B<<1) )&&(Shift_Flag==1)) $display("Test Shift left B Passed ");
    #(clk_period);
/*-----------------------------------------------------------------------------*/    

end
endmodule
